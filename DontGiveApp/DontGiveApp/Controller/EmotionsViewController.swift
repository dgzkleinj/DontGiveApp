//
//  EmotionsViewController.swift
//  DontGiveApp
//
//  Created by Guilherme Dall Agnol on 23/09/19.
//  Copyright © 2019 Diego Klein. All rights reserved.
//

import UIKit
import CoreData

class EmotionsViewController: UIViewController, UITextViewDelegate {

    @IBOutlet weak var emotionCollectionView: UICollectionView!
    @IBOutlet weak var journalTextView: UITextView!
    @IBOutlet weak var sendButton: UIButton!
    
    var selectedFeeling: String?
    var emotions: [String] = []
    var selectedEmotions: [String] = []
    var journals: [NSManagedObject] = []
    let coreDataManager = CoreDataManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        journalTextView.delegate = self
        
        emotionCollectionView.delegate = self
        emotionCollectionView.dataSource = self
        
        sendButton.layer.borderWidth = 1
        sendButton.layer.cornerRadius = sendButton.frame.height / 2
        
        journalTextView.layer.borderWidth = 1
        journalTextView.layer.cornerRadius = 15

        
        if selectedFeeling == "sad" {
            view.backgroundColor = Colors.middleBlue
            sendButton.backgroundColor = Colors.hintOfIcePack
            emotions = sadEmotions
        }else if selectedFeeling == "neutral" {
            view.backgroundColor = Colors.juneBud
            sendButton.backgroundColor = Colors.greenlandGreen
            emotions = neutralEmotions
        }else {
            view.backgroundColor = Colors.pinkGlamour
            sendButton.backgroundColor = Colors.turbo
            emotions = happyEmotions
        }
        
    }
    
    @IBAction func callCVVButton(_ sender: Any) {
        guard let number = URL(string: "tel://" + "188") else { return }
        UIApplication.shared.open(number)
    }
    
    
    //Botao cria uma journal e coloca no array journals
    @IBAction func sendJournalAction(_ sender: UIButton) {
        let journalToSave = Journal(date: Date(), feeling: selectedFeeling!, emotions: selectedEmotions, journalText: journalTextView.text!)
        
        coreDataManager.saveJournal(journalToSave)
        
        print(journalToSave)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return true
    }
    
    
}

extension EmotionsViewController : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return emotions.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "emotionCell", for: indexPath) as! EmotionCollectionViewCell
        let emotion = emotions[indexPath.row]
        cell.emotionNameLabel.text = emotion
        if selectedFeeling == "sad" {
            cell.backgroundColor = Colors.hintOfIcePack
        }else if selectedFeeling == "neutral" {
            cell.backgroundColor = Colors.greenlandGreen
        }else {
            cell.backgroundColor = Colors.turbo
        }
        cell.layer.cornerRadius = cell.frame.height / 2
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        let emotion = emotions[indexPath.row]
        if (!selectedEmotions.contains(emotion)) {
            selectedEmotions.append(emotion)
            if selectedFeeling == "sad" {
                cell?.backgroundColor = Colors.coastalBreeze
            }else if selectedFeeling == "neutral" {
                cell?.backgroundColor = Colors.middleBlue
            }else {
                cell?.backgroundColor = Colors.beekeper
            }
        }else{
            if let index = selectedEmotions.firstIndex(of: emotion) {
                selectedEmotions.remove(at: index)
                if selectedFeeling == "sad" {
                    cell?.backgroundColor = Colors.hintOfIcePack
                }else if selectedFeeling == "neutral" {
                    cell?.backgroundColor = Colors.greenlandGreen
                }else {
                    cell?.backgroundColor = Colors.turbo
                }
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
//        let totalCellWidth = 60 * collectionView.numberOfItems(inSection: 0)
//        let totalSpacingWidth = 10 * (collectionView.numberOfItems(inSection: 0) - 1)
//
//        let leftInset = (collectionView.layer.frame.size.width - CGFloat(totalCellWidth + totalSpacingWidth)) / 2
//        let rightInset = leftInset
        
        return UIEdgeInsets(top: 10, left: 40, bottom: 0, right: 40)
    }
}

