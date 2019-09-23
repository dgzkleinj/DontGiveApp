//
//  ViewController.swift
//  DontGiveApp
//
//  Created by Diego Klein on 19/09/19.
//  Copyright © 2019 Diego Klein. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var helloNameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func sadAction(_ sender: UIButton) {
        performSegue(withIdentifier: "sadSegue", sender: nil)
    }
    
    @IBAction func neutralAction(_ sender: UIButton) {
        performSegue(withIdentifier: "neutralSegue", sender: nil)
    }
    
    @IBAction func happyAction(_ sender: UIButton) {
        performSegue(withIdentifier: "happySegue", sender: nil)
    }
}

