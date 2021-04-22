//
//  TableViewCell1.swift
//  SportApp
//
//  Created by Heba Ismail on 4/20/21.
//  Copyright © 2021 None. All rights reserved.
//

import UIKit

class TableViewCell1: UITableViewCell {

    var youtubeStr:String = ""

    @IBOutlet weak var mainImg: UIImageView!
    
    @IBOutlet weak var leagueName: UILabel!
    
    @IBOutlet weak var leagueDetail: UILabel!
    
    @IBOutlet weak var youtubeIcon: UIButton!
    
    
    @IBAction func goToTrailer(_ sender: UIButton) {
    }
}
