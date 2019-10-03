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

let happyEmotions = ["Esperançoso", "Alegre", "Satisfeito", "Confiante", "Entusiasmado", "Grato", "Motivado", "Corajoso"]
let neutralEmotions = ["Aliviado", "Apático", "Desconectado", "Consciente", "Satisfeito", "Receoso"]
let sadEmotions = ["Com medo", "Com raiva", "Solitário", "Deprimido", "Melancólico", "Estressado", "Culpado", "Decepcionado"]
