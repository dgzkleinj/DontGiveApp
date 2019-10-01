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
    var userName: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let defaults = UserDefaults.standard
        if let value = defaults.string(forKey: "nameKey") {
            //let name = try! JSONDecoder().decode(String.self, from: value)
            userName = value
        }
//       helloNameLabel.text = "Olá, \(userName ?? "Forasteiro")"
    }

    @IBAction func sadAction(_ sender: UIButton) {
        performSegue(withIdentifier: "feelingsSegue", sender: "sad")
    }
    
    @IBAction func neutralAction(_ sender: UIButton) {
        performSegue(withIdentifier: "feelingsSegue", sender: "neutral")
    }
    
    @IBAction func happyAction(_ sender: UIButton) {
        performSegue(withIdentifier: "feelingsSegue", sender: "happy")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let nextVC = segue.destination as? EmotionsViewController
        let feeling = sender as? String
        
        nextVC?.selectedFeeling = feeling
    }
}

