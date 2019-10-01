//
//  JournalTableViewCell.swift
//  DontGiveApp
//
//  Created by Guilherme Dall Agnol on 01/10/19.
//  Copyright © 2019 Diego Klein. All rights reserved.
//

import UIKit
import CoreData

class JournalTableViewCell: UITableViewCell {

    @IBOutlet weak var journalImageView: UIImageView!
    @IBOutlet weak var emotionsLabel: UILabel!
    @IBOutlet weak var feelingLabel: UILabel!
    @IBOutlet weak var journalTextLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
