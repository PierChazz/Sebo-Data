
//
//  ViewController.swift
//  SeboData3
//
//  Created by Pierre pc. CHARVOZ on 28/11/2016.
//  Copyright © 2016 Pierre pc. CHARVOZ. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchDisplayDelegate, UISearchBarDelegate {

    @IBOutlet weak var searchSebo: UISearchBar!
    
    @IBOutlet weak var tableView: UITableView!
    
    var donnees = [Entree]()
    var donnees_filtrees = [Entree]()
    var searchController: UISearchController!
    
   //search in progress or not
    var isSearching : Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        get_data_from_url("http://localhost:8080/WSSebo2016/webresources/ws.article")
            }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
     func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
     func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if self.isSearching == true {
            return donnees_filtrees.count
            
        } else {
            
        return donnees.count
        }
    }
    
    
     func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cellu", forIndexPath: indexPath) as! TableViewCell
        
        // Configure the cell...
        
        if self.isSearching == true{//(tableView == self.searchDisplayController?.searchResultsTableView){
            let entre = donnees_filtrees[indexPath.row]
            cell.imageCell.image = UIImage(named: "")
            cell.titreCell.text = ""
            cell.textLabel?.text = entre.titre
        } else {
            let entre = donnees[indexPath.row]
           
            print (entre.image)
            
            let imgURL: NSURL = NSURL(string: "http://localhost:8080/WSSebo2016/" + entre.image)!
            let request: NSURLRequest = NSURLRequest(URL: imgURL)
            NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue(), completionHandler: {(response: NSURLResponse?, data: NSData?, error: NSError?) -> Void in
                if error == nil{
                    
                    dispatch_async(dispatch_get_main_queue(), {
                        cell.imageCell.image = UIImage(data: data!)
                       
                    })                    
                }
                })
            cell.titreCell.text = entre.titre
        }
        
        return cell
    }
    
    //MARK Navigation
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "Article" {
            let details = segue.destinationViewController as! CustomViewController
            
            var indexPath = NSIndexPath()
            if self.searchController.active{
                indexPath = self.searchDisplayController!.searchResultsTableView.indexPathForSelectedRow!
                details.stringImage = self.donnees_filtrees[indexPath.row].image
            }
            else{
                
                indexPath = self.tableView.indexPathForSelectedRow!
            details.stringImage = self.donnees_filtrees[indexPath.row].image
            }
            
            }
            
        }
    
    
    //MARK Search Methods
    
    func filterContentsForSearchText(searchText: String, scope: String = "Title")
    {
        self.donnees_filtrees = self.donnees.filter({(donnee : Entree) -> Bool in
            
            let categoryMatch = (scope == "Title")
            let stringMatch = donnee.titre.rangeOfString(searchText)
            
            return categoryMatch && (stringMatch != nil)
            }
            )
    }
    
    func searchController(controller:UISearchController, shouldReloadTableForSearchString searchString: String!) -> Bool{
        self.filterContentsForSearchText(searchString, scope: "Title")
        
        return true
    }
    
    func
        searchController(controller: UISearchController, shouldReloadTableForSearchScope searchOption: Int) -> Bool
    {
        self.filterContentsForSearchText(self.searchController!.searchBar.text!, scope: "Title")
        
        return true
    }
    
    struct Entree {
        let image : String
        let titre : String
        let description : String
        //let prix : Int
        //let prixString = String(prix)
        
    }
    
    
    
    
    func get_data_from_url(url:String)
    {
        let httpMethod = "GET"
        let timeout = 15
        let url = NSURL(string: url)
        let urlRequest = NSMutableURLRequest(URL: url!, cachePolicy: .ReloadIgnoringLocalCacheData, timeoutInterval: 15.0)
        let queue = NSOperationQueue()
        NSURLConnection.sendAsynchronousRequest(urlRequest, queue: queue, completionHandler: {
            (response: NSURLResponse?, data: NSData?, error: NSError?) in
            if data!.length > 0 && error == nil{
                //let json = NSString(data: data!, encoding: NSASCIIStringEncoding)
                self.extract_json(data!)
            }else if data!.length == 0 && error == nil{
                print("Aucun fichier n'a été téléchargé")
            }else if error != nil {
                print("Erreur: \(error)")
            }
        })
    }
    
    func extract_json(data:NSData)
    {
        var parseError: NSError?
        //let jsonData: NSData = data.dataUsingEncoding(NSASCIIStringEncoding)!
        do
        {
          let json = try NSJSONSerialization.JSONObjectWithData(data, options: []) as! [[String:AnyObject]]
         
          for art in json
          {
            let imageE = art["photo"] as? String
            let titreE = art["titre"] as? String
            let descE = art["descriptif"] as? String
                        
            self.donnees += [Entree(image: imageE!, titre: titreE!, description: descE!)]
            self.donnees_filtrees += [Entree(image: imageE!, titre: titreE!, description: descE!)]
            
          
          }

        }
        catch let error as NSError{
            parseError = error
            
        }
                       refresh();
    }

    func refresh()
    {
        dispatch_async(dispatch_get_main_queue(), {
           self.tableView.reloadData()
            return
        })
    }
    
    

}

