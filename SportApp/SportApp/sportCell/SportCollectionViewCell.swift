//
//  SportCollectionViewCell.swift
//  TryFunctionality
//
//  Created by Heba Ismail on 4/21/21.
//  Copyright © 2021 None. All rights reserved.
//

import UIKit

class SportCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var eventImg: UIImageView!
    
    @IBOutlet weak var eventName: UILabel!
    
    @IBOutlet weak var eventDate: UILabel!
    
    @IBOutlet weak var eventTime: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
