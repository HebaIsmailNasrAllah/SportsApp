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
    
    
   func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
       UISwipeActionsConfiguration(actions: [UIContextualAction(style: .destructive, title: "Delete", handler: { (action, view, bool) in

        self.showAlert(index: indexPath.row)
        
       })])
   }
    func showAlert(index : Int) {
        let alert : UIAlertController = UIAlertController(title: "Delete?", message: "Do you want to delete this legue", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (action) in
            self.favoritePresenter.deleteFavorite(fav: self.favoritesToDisplay[index])
             self.favoritesToDisplay.remove(at: index)
                self.tableView.reloadData()
            
                print("ok")
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (action) in
            print("Cancel")
        }))
        
      self.present(alert, animated: true, completion: nil)
    }

}

extension AllFavViewController : FavoriteProtocol {
    func setAllFavorite(allfav: [MyStoredFavorites]) {
        favoritesToDisplay = allfav
        self.tableView.reloadData()
    }
    
    
}
