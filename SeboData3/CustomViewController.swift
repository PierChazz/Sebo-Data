//
//  ViewController.swift
//  SeboData
//
//  Created by Pierre pc. CHARVOZ on 24/11/2016.
//  Copyright © 2016 Pierre pc. CHARVOZ. All rights reserved.
//

import UIKit

class CustomViewController: UIViewController {
    
    
    @IBOutlet weak var imageArticle: UIImageView!
    
    var stringImage:String = ""

    @IBOutlet weak var titreArticle: UILabel!
    
    @IBOutlet weak var descArticle: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = NSURL(string: "http://localhost:8080/WSSebo2016/webresources/ws.article")
        let session = NSURLSession.sharedSession()
        let task = session.dataTaskWithURL(url!) { (data, response, error) in
            if error != nil
            {
                print ("ERROR")
            }
            else
            {
                if data != nil
                {
                    do
                    {
                        //Array
                        let myJson = try NSJSONSerialization.JSONObjectWithData(data!, options:NSJSONReadingOptions.MutableContainers ) 
                        print(myJson)
                        
                        if let rates = myJson["IDArticle"] as AnyObject!
                        {
                            if let currency = rates[""]
                            {
                                print (currency)
                            }
                        }
                    }
                    catch
                    {
                        
                    }
                }
            }
        }
        task.resume()
        
    }

        
        

        // Do any additional setup after loading the view.
        
    
        //imageArticle.image = UIImage(named: stringImage)
        
    
    


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK: - Navigation
    


    /*
    

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
