//
//  FavoritePresenter.swift
//  SportApp
//
//  Created by Heba Ismail on 4/25/21.
//  Copyright © 2021 None. All rights reserved.
//

import Foundation

class FavoritePresenter {
  
    
    weak private var favoriteProtocol : FavoriteProtocol?
    
    
    func attachView(view: FavoriteProtocol) {
        favoriteProtocol = view
    }
    
    func detachView() {
        favoriteProtocol = nil
    }
    
    func getAllData()  {
        let arr : [MyStoredFavorites] = StoredFavorites.fetchFromCoreData()
        favoriteProtocol?.setAllFavorite(allfav: arr)
    }
    
    func deleteFavorite(fav: MyStoredFavorites){
       // StoredFavorites.deleteLeague(idOfLeague: fav.leagueID)
        StoredFavorites.removeFromDB(id: fav.leagueID)
        favoriteProtocol?.deleteFavorite(fav: fav)
    }
    
    
}
