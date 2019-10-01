//
//  LoginViewController.swift
//  DontGiveApp
//
//  Created by Guilherme Dall Agnol on 23/09/19.
//  Copyright © 2019 Diego Klein. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var signInButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameTextField.delegate = self
        passwordTextField.delegate = self
    }

    @IBAction func signInAction(_ sender: Any) {
        UserDefaults.standard.set(true, forKey: "status")
        Switcher.updateRootVC()
        
        let defaults = UserDefaults.standard
        let name = nameTextField.text
        defaults.set(name, forKey: "nameKey")
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return true
    }
}
