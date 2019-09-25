//
//  EmotionsViewController.swift
//  DontGiveApp
//
//  Created by Guilherme Dall Agnol on 23/09/19.
//  Copyright © 2019 Diego Klein. All rights reserved.
//

import UIKit

class EmotionsViewController: UIViewController {

    @IBOutlet weak var emotionCollectionView: UICollectionView!
    @IBOutlet weak var journalTextField: UITextField!
    @IBOutlet weak var sendButton: UIButton!
    
    var selectedFeeling: String?
    var emotions: [String] = []
    var selectedEmotions: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        emotionCollectionView.delegate = self
        emotionCollectionView.dataSource = self
        sendButton.layer.borderWidth = 2
        sendButton.layer.borderColor = Colors.beekeper.cgColor
        sendButton.layer.cornerRadius = sendButton.frame.height / 2
        
        if selectedFeeling == "sad" {
            emotions = sadEmotions
        }else if selectedFeeling == "neutral" {
            emotions = neutralEmotions
        }else {
            emotions = happyEmotions
        }
        
    }
    
    //Botao cria uma journal e coloca no array journals
    @IBAction func sendJournalAction(_ sender: UIButton) {
        let journal = Journal(date: Date(), feeling: selectedFeeling!, emotions: selectedEmotions, journalText: journalTextField.text!)
        journals.append(journal)
        print(journal)
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
            cell.backgroundColor = Colors.blurple
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
                cell?.backgroundColor = Colors.exodusFruit
            }else if selectedFeeling == "neutral" {
                cell?.backgroundColor = Colors.middleBlue
            }else {
                cell?.backgroundColor = Colors.beekeper
            }
        }else{
            if let index = selectedEmotions.firstIndex(of: emotion) {
                selectedEmotions.remove(at: index)
                if selectedFeeling == "sad" {
                    cell?.backgroundColor = Colors.blurple
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
