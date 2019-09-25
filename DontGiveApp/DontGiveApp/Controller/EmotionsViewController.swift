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
    
    var selectedFeeling: String?
    var emotions: [String] = []
    var selectedEmotions: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        emotionCollectionView.delegate = self
        emotionCollectionView.dataSource = self
        
        if selectedFeeling == "sad" {
            emotions = sadEmotions
        }else if selectedFeeling == "neutral" {
            emotions = neutralEmotions
        }else {
            emotions = happyEmotions
        }
    }
    
}


extension EmotionsViewController : UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return emotions.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "emotionCell", for: indexPath) as! EmotionCollectionViewCell
        let emotion = emotions[indexPath.row]
        cell.emotionNameLabel.text = emotion
        cell.backgroundColor = .red
//        cell.backgroundColor = indexPath.row % 2 == 0 ? .red : .cyan
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        let emotion = emotions[indexPath.row]
        if (!selectedEmotions.contains(emotion)) {
            selectedEmotions.append(emotion)
            cell?.backgroundColor = .cyan
        }else{
            if let index = selectedEmotions.firstIndex(of: emotion) {
                selectedEmotions.remove(at: index)
                cell?.backgroundColor = .red
            }
        }

    }
    

    
    
}
