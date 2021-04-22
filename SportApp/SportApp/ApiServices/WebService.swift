//
//  WebService.swift
//  SportApp
//
//  Created by RahmaAyman on 4/21/21.
//  Copyright © 2021 None. All rights reserved.
//

import Foundation
import Alamofire
class WebService{
    static let instance = WebService()
    

    func getData<T : Decodable>(url:String,completion: @escaping (T?,Error?)->Void){
        
        Alamofire.request(url).responseJSON {(response) in
            guard let data = response.data else{
                return
            }
            switch response.result{
              
            case .success(let val):
                do{
                   let myData = try JSONDecoder().decode(T.self, from: data)
                    
                     completion(myData,nil)
                }catch let jsonError{
                    print(jsonError)
                }
               
            case .failure(let error):
                completion(nil,error)
                //clousure hwa function ezan lazem anadeha
                //we 3ashan fih error f hakhaly el data el returned --> nil
                
            }
        }
    }
}
