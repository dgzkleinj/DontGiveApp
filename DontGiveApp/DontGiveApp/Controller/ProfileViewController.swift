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
        
        return cell
    }
    
}
