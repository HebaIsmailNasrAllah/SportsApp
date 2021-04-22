//
//  LeagueCollectionViewCell.swift
//  TryFunctionality
//
//  Created by Heba Ismail on 4/21/21.
//  Copyright © 2021 None. All rights reserved.
//

import UIKit

class LeagueCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var mainImg: UIImageView!
    
    @IBOutlet weak var mainlbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.frame = self.bounds
        self.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        // Initialization code
    }

}
