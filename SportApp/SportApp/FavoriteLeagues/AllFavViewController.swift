//
//  AllFavViewController.swift
//  SportApp
//
//  Created by Heba Ismail on 4/19/21.
//  Copyright © 2021 None. All rights reserved.
//

import UIKit
import CoreData

class AllFavViewController: UIViewController , UITableViewDataSource, UITableViewDelegate{
    
    

    @IBOutlet var tableView: UITableView!
    private let favoritePresenter = FavoritePresenter()
    var favoritesToDisplay = [MyStoredFavorites]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        favoritePresenter.attachView(view: self)
        // Do any additional setup after loading the view.
        favoritePresenter.getAllData()
        self.tableView.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        favoritePresenter.getAllData()
        self.tableView.reloadData()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favoritesToDisplay.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
//        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableCell
//        cell.leagueName.text = "Some League Name"
//        cell.leagueDetails.text = "1997"
//        cell.leagueImg.image = UIImage(named: "imgPlaceHolder")
//        cell.leagueImg.layer.cornerRadius = cell.leagueImg.frame.size.width/2
//
        let cell = Bundle.main.loadNibNamed("TableViewCell1", owner: self, options: nil)?.first as! TableViewCell1
        cell.leagueName.text = favoritesToDisplay [indexPath.row].name
        cell.leagueDetail.text = ""
        let str = favoritesToDisplay [indexPath.row].image
        cell.mainImg.sd_setImage(with: URL(string: str), placeholderImage: UIImage(named: "imgPlaceHolder"))
        cell.mainImg.layer.cornerRadius = cell.mainImg.frame.size.width/2
        //==================
        cell.youtubeStr = favoritesToDisplay [indexPath.row].youTubeLink ?? ""
              NotificationCenter.default.addObserver(self, selector: #selector(displayNoLink), name: NSNotification.Name(rawValue: "displayNoLink"), object: nil)
        
        return cell
       
    }
  
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    @objc func displayNoLink(){
                      let alert : UIAlertController = UIAlertController(title: "Alert", message: "Sorry! Link Not Found", preferredStyle: .alert)
                      alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (action) in
                          print("ok")
                      }))
                      self.present(alert, animated: true, completion: nil)
      }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\nYou Clicked a row!")
                if NetworkMonitor.shared.isConnected {
                    let vc = storyboard?.instantiateViewController(identifier: "LeagueDetails") as? leagueDetailsViewController
                    
                    //collecting Data
                    var movingData = MyStoredFavorites()
                    movingData = favoritesToDisplay [indexPath.row]
//                    movingData.name = leguesToDisplay[indexPath.row].strLeague ?? " "
//                    movingData.leagueID =  leguesToDisplay[indexPath.row].idLeague ?? ""
//                    movingData.country =  leguesToDisplay[indexPath.row].strCountry ?? ""
//                    movingData.image =  leguesToDisplay[indexPath.row].strBadge ?? ""
//                    movingData.sport =  leguesToDisplay[indexPath.row].strSport ?? ""
//                    movingData.youTubeLink =  leguesToDisplay[indexPath.row].strYoutube ?? ""
                    print("Name : \(movingData.name) , leagueID: \(movingData.leagueID)")
                    //print()
                    //sendingData
                    vc!.myStoredData = movingData
        
                    present(vc!, animated: true, completion: nil)
                }else{
                    let alert : UIAlertController = UIAlertController(title: "Alert", message: "You Are Offline! Please Turn On The Internet", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (action) in
                        print("ok")
                    }))
                    self.present(alert, animated: true, completion: nil)
            }
    }
    
    
   func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
      if editingStyle == .delete {
          // Delete the row from the data source
          tableView.deleteRows(at: [indexPath], with: .fade)
        //favoritePresenter.deleteFavorite(fav: favoritesToDisplay[indexPath.row])
        deleteFavorite(fav: favoritesToDisplay[indexPath.row])
        favoritesToDisplay.remove(at: indexPath.row)
        //favoritePresenter.getAllData()
        //=========================
        //Edition
//        let appDelegate = UIApplication.shared.delegate as! AppDelegate
//        let managedContext = appDelegate.persistentContainer.viewContext
//
//
//        let fetch = NSFetchRequest<NSManagedObject>(entityName: "Favorites")
//
//                   do{
//                    let favorites = try
//                        managedContext.fetch(fetch)
//                           print("fetch")
//
//                       for item in favorites {
//                        if item.value(forKey: "leagueID") as! String? ==  favoritesToDisplay[indexPath.row].leagueID {
//                           managedContext.delete(item)
//                           }
//
//                       }
//                      try  managedContext.save()
//
//                                  }catch {
//                                    print("un fetch")
//                                  }
//
//
//
//
        
        self.tableView.reloadData()
      } else if editingStyle == .insert {
          // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
      }
  }

}

extension AllFavViewController : FavoriteProtocol {
    func setAllFavorite(allfav: [MyStoredFavorites]) {
        favoritesToDisplay = allfav
        self.tableView.reloadData()
    }
    
    func deleteFavorite(fav: MyStoredFavorites) {
        favoritePresenter.deleteFavorite(fav: fav)
        //self.tableView.reloadData()

    }
    
    
    
}
