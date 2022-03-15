//
//  ViewController.swift
//  Christina App
//
//  Created by Charles Roberts on 3/8/22.
//

import UIKit
import Firebase

class ViewController: UIViewController {
        
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let getstureRecognizer = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        view.addGestureRecognizer(getstureRecognizer)
    }

    @objc func hideKeyboard() {
        view.endEditing(true)
    }
    
    @IBAction func signInClicked(_ sender: Any) {
        
        if emailTextField.text != "" && passwordTextField.text != "" {
            Auth.auth().signIn(withEmail: emailTextField.text!, password: passwordTextField.text!) { (authdata, error) in
                
                if error != nil {
                    self.makeAlert(title: "Error", message: error?.localizedDescription ?? "Firebase Error")
                } else {
                    self.performSegue(withIdentifier: "toMainVC", sender: nil)
                }
                
            }
        } else {
            makeAlert(title: "Error", message: "Please fill in both Email and Password fields.")
        }
    }
    
    @IBAction func signUpClicked(_ sender: Any) {
        
        if emailTextField.text != "" && passwordTextField.text != "" {
            Auth.auth().createUser(withEmail: emailTextField.text!, password: passwordTextField.text!) { (authdata, error) in
                
                if error != nil {
                    self.makeAlert(title: "Error", message: error?.localizedDescription ?? "Firebase Error")
                } else {
                    self.performSegue(withIdentifier: "toMainVC", sender: nil)
                }
                
                
            }
        } else {
            makeAlert(title: "Error", message: "Please fill in both Email and Password fields.")
            
        }
        
        
    }
    
    func makeAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(okButton)
        self.present(alert, animated: true, completion: nil)
        
    }
}

