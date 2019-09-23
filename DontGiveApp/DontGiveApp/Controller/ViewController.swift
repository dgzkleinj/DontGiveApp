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
        // Do any additional setup after loading the view.
        view.backgroundColor = UIColor.red
    }

    @IBAction func sadAction(_ sender: UIButton) {
    }
    
    @IBAction func neutralAction(_ sender: UIButton) {
    }
    
    @IBAction func happyAction(_ sender: UIButton) {
    }
}

