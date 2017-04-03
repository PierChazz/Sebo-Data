//
//  HomeViewController.swift
//  SeboData3
//
//  Created by Pierre pc. CHARVOZ on 30/11/2016.
//  Copyright © 2016 Pierre pc. CHARVOZ. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    
    @IBAction func connex(sender: AnyObject) {
        alertControlLogin()
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    enum UIAlertControllerStyle : Int {
        case ActionSheet
        case Alert
    }
    
    func alertControlLogin() {
    
    var loginTextField: UITextField?
    var passwordTextField: UITextField?
    let alertController = UIAlertController(title: "Bienvenue", message: "Entrez votre login et votre mot de passe", preferredStyle: .Alert)
    let ok = UIAlertAction(title: "OK", style: .Default, handler: { (action) -> Void in
        print("Ok Button Pressed")
    })
    let cancel = UIAlertAction(title: "Cancel", style: .Cancel) { (action) -> Void in
        print("Cancel Button Pressed")
    }
    alertController.addAction(ok)
    alertController.addAction(cancel)
    alertController.addTextFieldWithConfigurationHandler { (textField) -> Void in
    // Enter the textfiled customization code here.
    loginTextField = textField
    loginTextField?.placeholder = "Login"
    }
    alertController.addTextFieldWithConfigurationHandler { (textField) -> Void in
    // Enter the textfiled customization code here.
    passwordTextField = textField
    passwordTextField?.placeholder = "Mot de passe"
    passwordTextField?.secureTextEntry = true
    }
    
    presentViewController(alertController, animated: true, completion: nil)
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
