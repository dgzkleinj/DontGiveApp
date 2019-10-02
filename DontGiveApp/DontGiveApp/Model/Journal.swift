//
//  Journal.swift
//  DontGiveApp
//
//  Created by Guilherme Dall Agnol on 23/09/19.
//  Copyright © 2019 Diego Klein. All rights reserved.
//

import Foundation
import CoreData

struct Journal {
    var date: Date!
    var feeling: String
    var emotions: String
    var journalText: String
}

var journals: [JournalData] = []

let happyEmotions = ["Hopeful", "Joyful", "Satisfied", "Confident", "Excited", "Relieved"]
let neutralEmotions = ["Relieved", "Satisfied", "Apathic", "Detached", "Mellow"]
let sadEmotions = ["Afraid", "Angry", "Lonely", "Depressed", "Melancholic", "Stressed", "Guilt"]
