//
//  ResultCollectionViewCell.swift
//  TryFunctionality
//
//  Created by Heba Ismail on 4/21/21.
//  Copyright © 2021 None. All rights reserved.
//

import UIKit

class ResultCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var teamsHome: UILabel!
    
    @IBOutlet weak var teamAway: UILabel!
    
    @IBOutlet weak var teamsResult: UILabel!
    
    @IBOutlet weak var dateAndTime: UILabel!
    
    @IBOutlet weak var teamAwayImg: UIImageView!
    
    
    @IBOutlet weak var teamHomeImg: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
