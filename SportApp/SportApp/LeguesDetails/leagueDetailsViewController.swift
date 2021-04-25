//
//  leagueDetailsViewController.swift
//  SportApp
//
//  Created by Heba Ismail on 4/20/21.
//  Copyright © 2021 None. All rights reserved.
//

import UIKit
import SDWebImage

class leagueDetailsViewController: UIViewController ,UICollectionViewDataSource, UICollectionViewDelegate ,
UICollectionViewDelegateFlowLayout {
    
    var myStoredData = MyStoredFavorites()
    
    @IBOutlet weak var collectionView1: UICollectionView!
    @IBOutlet weak var collectionView2: UICollectionView!
    @IBOutlet weak var collectionView3: UICollectionView!
    
    @IBOutlet weak var leagueName: UILabel!
    
    
    let leagueCellId = "LeagueCollectionViewCell"
    let resultCellId = "ResultCollectionViewCell"
    let teamCellId = "TeamCollectionViewCell"
    let sportCellId = "SportCollectionViewCell"
    
    //Coming From Previous Screen
//    var strCountry = "spain"
//    var leagueID = "4328"
//    var sport = "soccer"
    
    private let leagueDetailsPresenter = LeagueDetailsPresenter()
    var upComingEvents = [UpcomingEvents]()
    var latestResults = [Events]()
    var allTeamsInLeague = [Teams]()

    override func viewDidLoad() {
        super.viewDidLoad()
        leagueName.text = myStoredData.name
        collectionView1.delegate = self
        collectionView1.dataSource = self
        
        collectionView2.delegate = self
        collectionView2.dataSource = self
        
        collectionView3.delegate = self
        collectionView3.dataSource = self
        
     //   let nibCell = UINib(nibName: leagueCellId, bundle: nil)
     //   collectionView1.register(nibCell, forCellWithReuseIdentifier: leagueCellId)
        
        let nibCell2 = UINib(nibName: resultCellId, bundle: nil)
        collectionView2.register(nibCell2, forCellWithReuseIdentifier: resultCellId)
        
        let nibCell3 = UINib(nibName: teamCellId, bundle: nil)
        collectionView3.register(nibCell3, forCellWithReuseIdentifier: teamCellId)
        
        let nibCell4 = UINib(nibName: sportCellId, bundle: nil)
        collectionView1.register(nibCell4, forCellWithReuseIdentifier: sportCellId)
        
        //allLeguesPresenter.attachView(view: self)
        //allLeguesPresenter.getAllLegues()
        leagueDetailsPresenter.attachView(view : self)
        leagueDetailsPresenter.getAllLatestResults(leagueID: myStoredData.leagueID)
        leagueDetailsPresenter.getAllTeamsInLeague(strCountry: myStoredData.country , sport: myStoredData.sport)
        leagueDetailsPresenter.getAllUpcoming(leagueID: myStoredData.leagueID)
        
        collectionView1.reloadData()
        collectionView2.reloadData()
        collectionView3.reloadData()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func addToFavorite(_ sender: UIButton) {
        //This object should be sent from previous screen
        leagueDetailsPresenter.AddToFav(addedItem: myStoredData, myView: self)
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if (collectionView == collectionView1){
            if(upComingEvents.count != 0){
                return upComingEvents.count
            } else{
                let event = UpcomingEvents()
                upComingEvents.append(event)
                upComingEvents.append(event)
                return upComingEvents.count
            }
        }else if (collectionView == collectionView2) {
            return latestResults.count
        }else {
            return allTeamsInLeague.count
        }
    }
   
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if (collectionView == collectionView1){
            return CGSize(width: collectionView1.frame.width/2, height: collectionView.frame.height-10)
            
        }else if (collectionView == collectionView2) {
            return CGSize(width: collectionView2.frame.width, height: collectionView2.frame.height/2)
        }else {
            return CGSize(width: collectionView3.frame.height, height: collectionView3.frame.height)
        }
    }
    //Heba Will Start Rendering Each cell
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if (collectionView == collectionView1){
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: sportCellId, for: indexPath) as! SportCollectionViewCell
           
            cell.eventImg.image = UIImage(named: "fans")
            cell.eventDate.text = upComingEvents[indexPath.row].dateEvent ?? "No upcoming Event"
            cell.eventTime.text = upComingEvents[indexPath.row].strTime ?? " "
            cell.eventName.text =  upComingEvents[indexPath.row].strEvent ?? " "
            return cell
            
        }else if (collectionView == collectionView2) {
         let cell = collectionView.dequeueReusableCell(withReuseIdentifier: resultCellId, for: indexPath) as! ResultCollectionViewCell
            
//            cell.teamsName.text = (latestResults[indexPath.row].strHomeTeam ?? "") + "VS." + (latestResults[indexPath.row].strAwayTeam ?? "")
//            cell.dateAndTime.text = "\(latestResults[indexPath.row].dateEvent ?? "") &  \(latestResults[indexPath.row].strTime ?? "")"
//            cell.teamsResult.text = "\(latestResults[indexPath.row].intHomeScore ?? "") : \(latestResults[indexPath.row].intAwayScore ?? "")"
            cell.teamsHome.text = latestResults[indexPath.row].strHomeTeam ?? ""
            cell.teamAway.text =
                latestResults[indexPath.row].strAwayTeam ?? ""
            cell.dateAndTime.text =
                latestResults[indexPath.row].dateEvent ?? ""
            cell.teamsResult.text =
            " \(latestResults[indexPath.row].intHomeScore ?? "")  VS.   \(latestResults[indexPath.row].intAwayScore ?? "")"
            cell.teamHomeImg.image = UIImage(named: "team")
            cell.teamHomeImg.layer.cornerRadius =  cell.teamHomeImg.frame.width/2
            cell.teamAwayImg.image =  UIImage(named: "team")
            cell.teamAwayImg.layer.cornerRadius =  cell.teamAwayImg.frame.width/2
            return cell
        }else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: teamCellId, for: indexPath) as! TeamCollectionViewCell
            
            cell.mainImg.sd_setImage(with: URL(string: allTeamsInLeague[indexPath.row].strTeamBadge ?? ""), placeholderImage: UIImage(named: "imgPlaceHolder"))
            //cell.backgroundColor = UIColor.blue
            cell.layer.cornerRadius = collectionView3.frame.height/2
            
            return cell
        }
        
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if(collectionView == collectionView3){
            //Will Start from Here
            let vc = storyboard?.instantiateViewController(identifier: "TeamDetails") as? TeamDetailsViewController
                        
                        //collecting Data
            let chosenTeam = allTeamsInLeague[indexPath.row]
                        
                        //sendingData
            vc!.selectedTeam = chosenTeam
    
            present(vc!, animated: true, completion: nil)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }

}

extension leagueDetailsViewController : LeagueDetailsProtocol {
    func setUpcomingEvents(allUpcomingEvents: [UpcomingEvents]) {
        self.upComingEvents = allUpcomingEvents
        self.collectionView1.reloadData()
    }
    
    func setLatestResults(allLatestResults: [Events]) {
        self.latestResults = allLatestResults
        self.collectionView2.reloadData()
    }
    
    func setTeamsInLeague(allTeamsInLeague: [Teams]) {
        self.allTeamsInLeague = allTeamsInLeague
        self.collectionView3.reloadData()
    }

}
