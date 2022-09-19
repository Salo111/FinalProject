//
//  SignUpViewController.swift
//  FinalProject
//
//  Created by salo khizanishvili on 05.09.22.
//

import UIKit
import Firebase

class SignUpViewController: UIViewController {

    @IBOutlet weak var EmailTxtField: UITextField!
    @IBOutlet weak var PasswordTxtField: UITextField!
    @IBOutlet weak var ConfirmPassTxtField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func SignUpBtn(_ sender: UIButton) {
        guard let email = EmailTxtField.text else { return }
        guard let password = PasswordTxtField.text else { return }
        guard let confirmedPass = ConfirmPassTxtField.text else { return }
        
        let myPassword = password
        var intExists = ""
        let range = myPassword.rangeOfCharacter(from: CharacterSet.decimalDigits)
        if range != nil {
            intExists = "we have int in password"
        }
        
        Auth.auth().createUser(withEmail: email, password: password) {_,_ in
            if(self.PasswordTxtField.text != self.ConfirmPassTxtField.text){
                self.alert(messageText: "passwords doesn't match")
            }
            else if(password == "" || confirmedPass == "" || email == ""){
                self.alert(messageText: "Please fill in all textfields")
            }
            else if(myPassword.count < 8 || intExists != "we have int in password"){
                self.alert(messageText: "This Password Is Not Secure")
            }
            else{ self.performSegue(withIdentifier: "goToFirstPage", sender: self)
            }
        }
    }
    
    func alert(messageText: String) {
        let alert = UIAlertController(title: "⚠️", message: messageText, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .cancel))
        present(alert, animated: true)
    }
}

