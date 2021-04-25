//
//  AllSportsPresenter.swift
//  SportApp
//
//  Created by RahmaAyman on 4/22/21.
//  Copyright © 2021 None. All rights reserved.
//

import Foundation
class AllSportsPresenter{
    
    
    weak private var allSportsProtocol : AllSportsProtocol?
    
        func attachView(view: AllSportsProtocol) {
            allSportsProtocol = view
        }
        
        func detachView() {
            allSportsProtocol = nil
        }
        func getAllSports(){
    
            WebService.instance.getData(url: "https://www.thesportsdb.com/api/v1/json/1/all_sports.php") { (sportsResponse : SportsResponse?, error) in
                    if let error = error{
                        print(error)
                    }else{
                        guard let sports = sportsResponse else{
                            return
                        }
                        
                        print(sports.sports!.count)
                        self.allSportsProtocol!.setSports(sports: sports.sports!)
                        
                    }
                    
                
            }
           
        }
}
