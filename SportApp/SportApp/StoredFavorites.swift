//
//  StoredFavorites.swift
//  TryFunctionality
//
//  Created by Heba Ismail on 4/24/21.
//  Copyright © 2021 None. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class StoredFavorites {
    
    static func insertInCoreData(myStoredFav : MyStoredFavorites)  {
        
          let appDelegate = UIApplication.shared.delegate as! AppDelegate
          let managedContext = appDelegate.persistentContainer.viewContext
          let entity = NSEntityDescription.entity(forEntityName: "Favorites", in: managedContext)
          let favorite = NSManagedObject(entity: entity!, insertInto: managedContext)
            favorite.setValue(myStoredFav.name, forKey: "name")
            favorite.setValue(myStoredFav.image, forKey: "image")
            favorite.setValue(myStoredFav.sport, forKey: "sport")
            favorite.setValue(myStoredFav.country, forKey: "country")
            favorite.setValue(myStoredFav.leagueID, forKey: "leagueID")
            favorite.setValue(myStoredFav.youTubeLink, forKey: "youTubeLink")
          do{
              try managedContext.save()
              print("\nSaved Row in Core Data")

          }catch let error as NSError{
              print("\n\(error)")
              }
      }
      
    static func fetchFromCoreData()-> Array <MyStoredFavorites>{
          var arr: Array <MyStoredFavorites> = []
          let appDelegate = UIApplication.shared.delegate as! AppDelegate
          let managedContext = appDelegate.persistentContainer.viewContext
          let fetchRequest = NSFetchRequest <NSManagedObject>(entityName: "Favorites")
          var arrManagedObj : Array <NSManagedObject> = []
           
          do{
              arrManagedObj = try managedContext.fetch(fetchRequest)
              var i = 0
              //arr = []
              while (i < arrManagedObj.count){
                let element = arrManagedObj[i]
                let stFav = MyStoredFavorites()
                stFav.name = element.value(forKey: "name") as! String
                stFav.image = element.value(forKey: "image") as! String
                stFav.country = element.value(forKey: "country") as! String
                stFav.leagueID = element.value(forKey: "leagueID") as! String
                stFav.youTubeLink = element.value(forKey: "youTubeLink") as! String
                stFav.sport = element.value(forKey: "sport") as! String
      
                  arr.append(stFav)
                  //tableView.reloadData()
                  i = i+1
                  print("\nExecuted Row\(i) in Core Data")
              }
          }catch let error as NSError{
              print("\n\(error)")
          }
          return arr
      }
    
    static func isElementInFav (idOfLeague: String ) -> Bool {
        var flag : Bool = false
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let managedObjectContext = appDelegate.persistentContainer.viewContext
        let userFetchRequest = NSFetchRequest <NSManagedObject> (entityName : "Favorites")
        userFetchRequest.predicate = NSPredicate (format: "leagueID == %@", idOfLeague)
        do {
            let league = try managedObjectContext.fetch(userFetchRequest)
            if(league.count != 0){
                flag = true
            }else {
                flag = false
            }
        
        } catch let error as NSError{
            print ("\nItem Not exist. \(error), \(error.userInfo)")
        }
        return flag
    }
    
    static func deleteLeague ( idOfLeague : String){
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let managedObjectContext = appDelegate.persistentContainer.viewContext
        let userFetchRequest = NSFetchRequest <NSManagedObject> (entityName : "Favorites")
        //userFetchRequest.returnsObjectsAsFaults = false
        userFetchRequest.predicate = NSPredicate.init(format: "leagueID == %@", idOfLeague)
        do
        {
            let league = try managedObjectContext.fetch(userFetchRequest)
            if(league.count > 0 ){
                for managedObject in league
                {
                    let managedObjectData:NSManagedObject = managedObject
                    managedObjectContext.delete(managedObjectData)
                    appDelegate.saveContext()
//                    do{
//                    try managedObjectContext.save()
//                    }catch let error as NSError {
//                        print (error)
//                    }
                }
            }else{
                
            }
            print("\nSuccessfully Deleted")
            
        } catch let error as NSError {
            print("Detele all data in error : \(error) \(error.userInfo)")
        }
        
    }
    
    static func removeFromDB(id:String) {
            
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let managedContext = appDelegate.persistentContainer.viewContext

              
        let fetch = NSFetchRequest<NSManagedObject>(entityName: "Favorites")
                              
                   do{
                    let favorites = try
                        managedContext.fetch(fetch)
                           print("fetch")
                                   
                       for item in favorites {
                        if item.value(forKey: "leagueID") as! String? == id  {
                           managedContext.delete(item)
                           }
                           
                       }
                      try  managedContext.save()
                                   
                                  }catch {
                                    print("un fetch")
                                  }
                 
        
        }
}
