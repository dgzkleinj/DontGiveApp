//
//  ProfileViewController.swift
//  DontGiveApp
//
//  Created by Guilherme Dall Agnol on 27/09/19.
//  Copyright © 2019 Diego Klein. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func logoutAction(_ sender: UIButton) {
        UserDefaults.standard.set(false, forKey: "status")
        Switcher.updateRootVC()
    }
    
 
}
