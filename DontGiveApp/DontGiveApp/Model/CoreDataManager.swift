//
//  CoreDataManager.swift
//  DontGiveApp
//
//  Created by Guilherme Dall Agnol on 01/10/19.
//  Copyright © 2019 Diego Klein. All rights reserved.
//

import UIKit
import Foundation
import CoreData

struct  CoreDataManager{
    
    func saveJournal(_ journal: Journal) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate
            else {
                return
        }
        
        let context = appDelegate.persistentContainer.viewContext
        
        let entity = NSEntityDescription.entity(forEntityName: "JournalData", in: context)!
        
        let newJournal = NSManagedObject(entity: entity, insertInto: context)
        
        newJournal.setValue(journal.date, forKey: "date")
        newJournal.setValue(journal.emotions, forKey: "emotions")
        newJournal.setValue(journal.feeling, forKey: "feeling")
        newJournal.setValue(journal.journalText, forKey: "journalText")
        
        do {
            try context.save()
            print("Success")
        } catch {
            print("Error saving: \(error)")
        }
    }
    
    func fetchJournal() -> [JournalData] {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return []
        }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "JournalData")
        
        do {
            return try managedContext.fetch(fetchRequest) as? [JournalData] ?? []
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
            return []
        }
    }
    
    
}
