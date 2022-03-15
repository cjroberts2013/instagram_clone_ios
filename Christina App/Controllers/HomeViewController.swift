//
//  HomeViewController.swift
//  Christina App
//
//  Created by Charles Roberts on 3/9/22.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func settingsClicked(_ sender: Any) {
        print("Settings button clicked")
        performSegue(withIdentifier: "toSettingsVC", sender: HomeViewController.self)
    }
}
