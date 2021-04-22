//
//  ResultCollectionViewCell.swift
//  TryFunctionality
//
//  Created by Heba Ismail on 4/21/21.
//  Copyright © 2021 None. All rights reserved.
//

import UIKit

class ResultCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var teamsName: UILabel!
    
    @IBOutlet weak var teamsResult: UILabel!
    
    @IBOutlet weak var dateAndTime: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
