//
//  LoginViewController.swift
//  DontGiveApp
//
//  Created by Guilherme Dall Agnol on 23/09/19.
//  Copyright © 2019 Diego Klein. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var signInButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func signInAction(_ sender: Any) {
        UserDefaults.standard.set(true, forKey: "status")
        Switcher.updateRootVC()
        
    }
    
    @IBAction func signUpAction(_ sender: UIButton) {
        let defaults = UserDefaults.standard
        let name = nameTextField.text ?? ""
        defaults.set(name, forKey: "nameKey")
    }
    
}
