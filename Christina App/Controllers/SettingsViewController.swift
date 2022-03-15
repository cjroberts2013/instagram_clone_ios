//
//  SettingsViewController.swift
//  Christina App
//
//  Created by Charles Roberts on 3/9/22.
//

import UIKit
import Firebase
class SettingsViewController: UIViewController {    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    @IBAction func closeClicked(_ sender: Any) {
        dismiss(animated: true)
    }
    
    @IBAction func logoutClicked(_ sender: Any) {
        do {
            try Auth.auth().signOut()
            performSegue(withIdentifier: "ViewController", sender: nil)
        } catch {
            print("Error signing out: \(error.localizedDescription)")
        }
    }
}
