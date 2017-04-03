//
//  EspaceViewController.swift
//  FoodTracker
//
//  Created by Pierre pc. CHARVOZ on 24/11/2016.
//  Copyright © 2016 Pierre pc. CHARVOZ. All rights reserved.
//

import UIKit

class EspaceViewController: UIViewController {
    
    
    
    @IBOutlet weak var loginTF: UITextField!
    
    @IBOutlet weak var mdpTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        configureCustomTextField()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func connexion(sender: AnyObject) {
        
        txtPasswordError()
    }
    
    
    @IBAction func compteButton(sender: UIButton) {
        
    }
    
    
    //configuration des zones de textes pour ajouter des pictos
    
    func configureCustomTextField() {
        // Ajout d'un picto login dans le champ texte login
        //définition de l'image 
        let loginImage = UIImage(named: "login")!
        
        //définition d'un conteneur pour l'image
        let loginImageView = UIImageView(frame: CGRect(x:0, y:0, width: 20, height: 20))
        loginImageView.image = loginImage
        
        //Ajout d'un conteneur d'image à gauche de la zone texte
        loginTF.leftView = loginImageView
        loginTF.leftViewMode = .Always
        
        //Paramètrage de la zone
        loginTF.placeholder = NSLocalizedString("login", comment: "") // texte affiché tant qu'aucune saisie n'est effectuée
        loginTF.autocorrectionType = .No    //pas de correction automatique
        loginTF.returnKeyType = .Done       //parametrage de la touche retour sur Done
        
        //Ajout d'un picto login dans le champ texte password 
        
        let txtPasswordImage = UIImage(named: "lock")!
        let txtPasswordImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        txtPasswordImageView.image = txtPasswordImage
        
        mdpTF.leftView = txtPasswordImageView
        mdpTF.leftViewMode = .Always
        mdpTF.placeholder = NSLocalizedString("Mot de passe", comment: "")
        mdpTF.autocorrectionType = .No
        mdpTF.returnKeyType = .Done
    }
    
    func txtPasswordError () {
        let errorImage = UIImage(named: "Erreur")!
        let errorImageButton = UIButton(type: .Custom)
        errorImageButton.bounds = CGRect(x: 0, y: 0, width: 22, height: 16)
        errorImageButton.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 6)
        errorImageButton.setImage(errorImage, forState: .Normal)
        errorImageButton.addTarget(self, action: #selector(EspaceViewController.passwordButtonClicked), forControlEvents: .TouchUpInside)
        mdpTF.rightView = errorImageButton
        mdpTF.rightViewMode = .Always
    }
    
    func passwordButtonClicked() {
        mdpTF.textColor = UIColor.redColor()
        let alertController = UIAlertController(title: "Bonjour", message: "Entrez vos identifiants", preferredStyle: UIAlertControllerStyle.Alert)

        
        let callAction = UIAlertAction(title: "Call", style: .Default, handler: {
            action in
            let alertMessage = UIAlertController(title: "Service Indisponible", message: "Désolé, le service est indisponible. Réessayez plus tard.", preferredStyle: .Alert)
            alertMessage.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
            self.presentViewController(alertMessage, animated: true, completion: nil)
            }
        )
        alertController.addAction(callAction)
        
        /*AlertController *alertController= [UIAlertController
        alertControllerwithTitle:alertTitle
        message:alertMessage
            preferredStyle:UIAlertControllerStyleAlert];
        alertView.title = "Sign Up !!"
        alertView.message = "Vous devez vous identifier"
        alertView.delegate = self
        alertView.addButtonWithTitle("ok")
        alertView.show()*/
    }

    //@IBAction func seConnecter(sender: AnyObject) {}
        
        
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
