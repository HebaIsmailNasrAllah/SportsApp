//
//  AllLeguesPresenter.swift
//  SportApp
//
//  Created by RahmaAyman on 4/21/21.
//  Copyright © 2021 None. All rights reserved.
//

import Foundation
class AllLeguesPresenter{
    
    weak private var allLegeusProtocol: AllLeguesProtocol?
    func attachView(view: AllLeguesProtocol) {
        allLegeusProtocol = view
    }
    
    func detachView() {
        allLegeusProtocol = nil
    }
    func getAllLegues(){
//        self.cartView?.startLoading()
//        cartService.getCarts { [weak self] carts in
//            self?.cartView?.finishLoading()
//            if carts.count == 0 {
//                self?.cartView?.setEmptyCarts()
//            } else {
//                let mappedCarts = carts.map({ data in
//                    return CartViewData(name: data.name , price: data.price)
//                })
//                self?.cartView?.setCarts(carts: mappedCarts)
//            }
//        }
       
            WebService.instance.getData(url: "https://www.thesportsdb.com/api/v1/json/1/search_all_leagues.php?s=Soccer") { (legueResponse : LeguesResponse?, error) in
                if let error = error{
                    print(error)
                }else{
                    guard let legues = legueResponse else{
                        return
                    }
                    
                    print(legues.countrys!.count)
                    self.allLegeusProtocol!.setLegues(Legues: legues.countrys!)
                    
                }
                
            
        }
       
    }
}
