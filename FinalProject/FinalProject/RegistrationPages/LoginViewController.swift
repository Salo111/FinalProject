//
//  LoginViewController.swift
//  FinalProject
//
//  Created by salo khizanishvili on 05.09.22.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {

    @IBOutlet weak var EmailTxtFld: UITextField!
    @IBOutlet weak var PasswordTxtFld: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

    
    }
    
    @IBAction func LogInBtn(_ sender: UIButton) {
        guard let email = EmailTxtFld.text else {return}
        guard let password = PasswordTxtFld.text else {return}
        
        Auth.auth().signIn(withEmail: email, password: password) { firebaseResult, error in
            if let err = error{
                self.alert()
            }
            else{
                self.performSegue(withIdentifier: "goToFirstPage", sender: self)
            }
        }
    }
    
    
    var NumberOfClicks = 0
    @IBAction func VisiblePassword(_ sender: Any) {
        NumberOfClicks += 1
        if(NumberOfClicks % 2 == 1){
            PasswordTxtFld.isSecureTextEntry = false
        }
        else{
            PasswordTxtFld.isSecureTextEntry = true
        }
    }
    
    func alert() {
        let alert = UIAlertController(title: "⚠️", message: "Password or Email you entered is incorrect", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .cancel))
        present(alert, animated: true)
    }
    
}
