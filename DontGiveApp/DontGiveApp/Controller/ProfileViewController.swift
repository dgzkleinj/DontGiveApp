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

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var journalTableView: UITableView!
    @IBOutlet weak var profileInformationView: UIView!
    @IBOutlet weak var tableTitleView: UIView!
    @IBOutlet weak var logOutButton: UIButton!
    
    let coreDataManager = CoreDataManager()
    var journals = [JournalData]()
    var name: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Perfil"
        
        journalTableView.dataSource = self
        journalTableView.delegate = self
        
        let defaults = UserDefaults.standard
        if let value = defaults.string(forKey: "nameKey") {
            name = value
        }
        nameLabel?.text = "Nome:  \(name)"
        
        profileInformationView.layer.borderWidth = 1
        profileInformationView.layer.cornerRadius = 10
        profileInformationView.backgroundColor  = Colors.soaringEagle

        tableTitleView.layer.borderWidth = 1
        tableTitleView.layer.cornerRadius = tableTitleView.frame.height / 3
        tableTitleView.backgroundColor  = Colors.soaringEagle
        
        logOutButton.layer.cornerRadius = logOutButton.frame.height / 2
        logOutButton.backgroundColor = Colors.soaringEagle
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.journals = coreDataManager.fetchJournal().sorted(by: { (journal1, journal2) -> Bool in
            guard let date1 = journal1.date, let date2 = journal2.date else { return false }
            return date1 > date2
        })
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
        
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yy"
        
        let journal = self.journals[indexPath.row]
        
        let date = formatter.string(from: journal.date!)
        
        cell.dateLabel.text = date
        cell.emotionsLabel.text = journal.emotions
        cell.journalTextLabel.text = journal.journalText
        if journal.feeling == "sad" {
            cell.backgroundColorView.backgroundColor = Colors.middleBlue
            cell.journalImageView.image = UIImage(named: "sad-face-2")
            cell.feelingLabel.text = "Triste"
        }else if journal.feeling == "neutral" {
            cell.backgroundColorView.backgroundColor  = Colors.juneBud
            cell.journalImageView.image = UIImage(named: "neutral-face-2")
            cell.feelingLabel.text = "Neutro"
        }else {
            cell.backgroundColorView.backgroundColor  = Colors.pinkGlamour
            cell.journalImageView.image = UIImage(named: "happy-face-2")
            cell.feelingLabel.text = "Feliz"
        }
        cell.dateLabel.layer.borderWidth = 1
        cell.dateLabel.layer.cornerRadius = cell.feelingLabel.frame.height / 2
        cell.feelingLabel.layer.borderWidth = 1
        cell.feelingLabel.layer.cornerRadius = cell.feelingLabel.frame.height / 2
        cell.emotionsLabel.layer.borderWidth = 1
        cell.emotionsLabel.layer.cornerRadius = cell.feelingLabel.frame.height / 2
        cell.journalTextLabel.layer.borderWidth = 1
        cell.journalTextLabel.layer.cornerRadius = cell.feelingLabel.frame.height / 2
        cell.backgroundColorView.layer.borderWidth = 1
        cell.backgroundColorView.layer.cornerRadius = 15
        
        return cell
    }
    
}
