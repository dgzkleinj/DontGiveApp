//
//  ProfileViewController.swift
//  DontGiveApp
//
//  Created by Guilherme Dall Agnol on 27/09/19.
//  Copyright © 2019 Diego Klein. All rights reserved.
//

import UIKit
import CoreData

class ProfileViewController: UIViewController {

    @IBOutlet weak var journalTableView: UITableView!
    
    let coreDataManager = CoreDataManager()
    var journals = [JournalData]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        journalTableView.dataSource = self
        journalTableView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.journals = coreDataManager.fetchJournal()
        journalTableView.reloadData()
    }
    
    @IBAction func logoutAction(_ sender: UIButton) {
        UserDefaults.standard.set(false, forKey: "status")
        Switcher.updateRootVC()
    }
    
}

extension ProfileViewController : UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.journals.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "JournalTableViewCell") as? JournalTableViewCell else{
            fatalError("Deveria existir uma celula JournalTableViewCell")
        }
        let journal = self.journals[indexPath.row]
        cell.feelingLabel.text = journal.feeling
        cell.emotionsLabel.text = journal.emotions
        cell.journalTextLabel.text = journal.journalText
        if journal.feeling == "sad" {
            cell.backgroundColor = Colors.middleBlue
            cell.journalImageView.image = UIImage(named: "sad-face")
            
        }else if journal.feeling == "neutral" {
            cell.backgroundColor = Colors.juneBud
            cell.journalImageView.image = UIImage(named: "neutral-face")
            
        }else {
            cell.backgroundColor = Colors.beekeper
            cell.journalImageView.image = UIImage(named: "happy-face")
            
        }
        cell.feelingLabel.layer.borderWidth = 1
        cell.feelingLabel.layer.cornerRadius = cell.feelingLabel.frame.height / 2
        cell.emotionsLabel.layer.borderWidth = 1
        cell.emotionsLabel.layer.cornerRadius = cell.feelingLabel.frame.height / 2
        cell.journalTextLabel.layer.borderWidth = 1
        cell.journalTextLabel.layer.cornerRadius = cell.feelingLabel.frame.height / 2
        cell.layer.borderWidth = 1
        cell.layer.cornerRadius = 15
        
        return cell
    }
    
}
