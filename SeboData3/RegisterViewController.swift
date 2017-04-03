//
//  RegisterViewController.swift
//  SeboData3
//
//  Created by Pierre pc. CHARVOZ on 05/12/2016.
//  Copyright © 2016 Pierre pc. CHARVOZ. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {
    
    
    @IBOutlet weak var nomTF: UITextField!
    
    @IBOutlet weak var prenomTF: UITextField!
    
    @IBOutlet weak var numTF: UITextField!
    
    @IBOutlet weak var adressTF: UITextField!
    
    @IBOutlet weak var villeTF: UITextField!
    
    @IBOutlet weak var telTF: UITextField!
    
    @IBOutlet weak var codpostTF: UITextField!
    
    @IBOutlet weak var logTF: UITextField!
    
    @IBOutlet weak var passwTF: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func displayMyAlertMessage(userMessage : String)
     {
        var alert = UIAlertController(title: "Alert", message : userMessage, preferredStyle: UIAlertControllerStyle.Alert)
        
        let okAction = UIAlertAction(title: "ok", style: UIAlertActionStyle.Default, handler: nil)
        
       alert.addAction(okAction)
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    @IBAction func connex(sender: AnyObject) {
        
        let nom  = nomTF.text
        let prenom = prenomTF.text
        let num = numTF.text
        let adress = adressTF.text
        let ville = villeTF.text
        let code = codpostTF.text
        let tel = telTF.text
        let log = logTF.text
        let psw = passwTF.text
        
        //Vérifier les champs vides 
        
        if (nom!.isEmpty||prenom!.isEmpty||num!.isEmpty||adress!.isEmpty||ville!.isEmpty||code!.isEmpty||tel!.isEmpty||log!.isEmpty||psw!.isEmpty){
            
            displayMyAlertMessage("Veuillez remplir tous les champs !")
           return
        
        }
        
        /*var alert = UIAlertController(title: "Alert", message : "Votre compte a été créé", preferredStyle: UIAlertControllerStyle.Alert)
        
        let okAction = UIAlertAction(title: "ok", style: UIAlertActionStyle.Default){ action in
            self.dismissViewControllerAnimated(true, completion: nil)*/

        
        
        
    }
    
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
