//
//  TeamDetailsViewController.swift
//  SportApp
//
//  Created by RahmaAyman on 4/18/21.
//  Copyright © 2021 None. All rights reserved.
//

import UIKit
import SDWebImage

class TeamDetailsViewController: UIViewController {

    @IBOutlet weak var teamImg: UIImageView!
    
    @IBOutlet weak var teamName: UILabel!
    
    @IBOutlet weak var sportName: UILabel!
    
    @IBOutlet weak var year: UILabel!
    
    @IBOutlet weak var staduimName: UILabel!
    
    @IBOutlet weak var countryName: UILabel!
    
    var selectedTeam = Teams()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        teamImg.sd_setImage(with: URL(string: selectedTeam.strTeamBadge ?? ""), placeholderImage: UIImage(named: "imgPlaceHolder"))
        
        teamName.text = selectedTeam.strTeam
        sportName.text = selectedTeam.strSport
        year.text = selectedTeam.intFormedYear
        staduimName.text = selectedTeam.strStadium
        countryName.text = selectedTeam.strCountry
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
