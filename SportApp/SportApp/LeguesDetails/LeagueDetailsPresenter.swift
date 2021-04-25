//
//  LeagueDetailsPresenter.swift
//  SportApp
//
//  Created by Heba Ismail on 4/23/21.
//  Copyright © 2021 None. All rights reserved.
//

import Foundation
import UIKit


class LeagueDetailsPresenter {
    weak private var leagueDetailsProtocol: LeagueDetailsProtocol?
    
    func attachView(view: LeagueDetailsProtocol) {
        leagueDetailsProtocol = view
    }
    
    func detachView() {
        leagueDetailsProtocol = nil
    }
    
    func getAllUpcoming(leagueID: String){
                WebService.instance.getData(url: "https://www.thesportsdb.com/api/v1/json/1/eventsround.php?id=\(leagueID)&r=10&s=2020-2021") { (upComingEventResponse : UpcomingEventsResponse?, error) in
                    if let error = error{
                        print(error)
                    }else{
                        guard let upComing = upComingEventResponse else{
                            return
                        }
                        
                        print(upComing.events?.count ?? 0 )
                        self.leagueDetailsProtocol?.setUpcomingEvents(allUpcomingEvents: upComing.events ?? [])
                        
                    }
                    
                
        }
        
    }
    func getAllLatestResults (leagueID: String){
        WebService.instance.getData(url: "https://www.thesportsdb.com/api/v1/json/1/eventspastleague.php?id=\(leagueID)") { (lastResultResponse : LastResultResponse?, error) in
                    if let error = error{
                            print(error)
                        }else{
                            guard let latestResult = lastResultResponse else{
                                return
                            }
                            
                        print(latestResult.events?.count ?? 0)
                            self.leagueDetailsProtocol?.setLatestResults(allLatestResults: latestResult.events ?? [])
                            
                        }
                        
                    
            }
        
    }
    func getAllTeamsInLeague (strCountry: String, sport: String){
        WebService.instance.getData(url: "https://www.thesportsdb.com/api/v1/json/1/search_all_teams.php?s=\(sport)&c=\(strCountry)" ) { (teamsResponse : TeamsResponse?, error) in
                 if let error = error{
                                print(error)
                    }else{
                                guard let allTeams = teamsResponse else{
                                    return
                                }
                                
                            print(allTeams.teams?.count ?? 0)
                            self.leagueDetailsProtocol?.setTeamsInLeague(allTeamsInLeague: allTeams.teams ?? [])
                            }
                }
        }
    
    func AddToFav(addedItem: MyStoredFavorites, myView: UIViewController){
        if(StoredFavorites.isElementInFav(idOfLeague: addedItem.leagueID) == true){
            showRepeatedAlert(myView: myView)
        }else {
            StoredFavorites.insertInCoreData(myStoredFav: addedItem)
        }
    }
    
    func showRepeatedAlert(myView: UIViewController) {
        let alert: UIAlertController = UIAlertController.init(title: "Item exist", message: "This item already exist in your Favorites", preferredStyle: UIAlertController.Style.alert)
        let actionOK = UIAlertAction.init(title: "OK", style: UIAlertAction.Style.cancel, handler: nil)
        alert.addAction(actionOK)
        myView.present(alert , animated: true)
        
    }
    
    
        
        
    
}
