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
    
    func getAllLegues(url : String){
            WebService.instance.getData(url: url) { (legueResponse : LeguesResponse?, error) in
                if let error = error{
                    print(error)
                }else{
                    guard let legues = legueResponse else{
                        return
                    }
                    
                    print(legues.countrys?.count ?? 0)
                    self.allLegeusProtocol!.setLegues(Legues: legues.countrys ?? [] )
                    
                }
                
            
        }
       
    }
}
