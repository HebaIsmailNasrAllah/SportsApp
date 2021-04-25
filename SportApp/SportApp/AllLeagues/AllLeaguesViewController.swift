//
//  AllLeaguesViewController.swift
//  SportApp
//
//  Created by Heba Ismail on 4/19/21.
//  Copyright © 2021 None. All rights reserved.
//

import UIKit
import SDWebImage

class AllLeaguesViewController: UIViewController ,UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    private let allLeguesPresenter = AllLeguesPresenter()
    var leguesToDisplay = [Countrys]()
    public var strSport = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view.
        allLeguesPresenter.attachView(view: self)
        allLeguesPresenter.getAllLegues(url:"https://www.thesportsdb.com/api/v1/json/1/search_all_leagues.php?s=\(strSport)")
    }
    override func viewWillAppear(_ animated: Bool) {
        allLeguesPresenter.getAllLegues(url: "https://www.thesportsdb.com/api/v1/json/1/search_all_leagues.php?s=\(strSport)")
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
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(leguesToDisplay.count)
        return leguesToDisplay.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
    
            let cell = Bundle.main.loadNibNamed("TableViewCell1", owner: self, options: nil)?.first as! TableViewCell1
        cell.leagueName.text = leguesToDisplay[indexPath.row].strLeague!
        print(leguesToDisplay[indexPath.row].strLeague!)
            cell.leagueDetail.text = ""
            cell.mainImg.image = UIImage(named: "imgPlaceHolder")
        let str = leguesToDisplay[indexPath.row].strBadge ?? "https://www.thesportsdb.com/images/sports/fighting.jpg"
        cell.mainImg!.sd_setImage(with: URL(string:str), placeholderImage: UIImage(named: "imgPlaceHolder"))

            cell.mainImg.layer.cornerRadius = cell.mainImg.frame.size.width/2

       //---------------------------
        cell.youtubeStr = leguesToDisplay[indexPath.row].strYoutube ?? ""
        NotificationCenter.default.addObserver(self, selector: #selector(displayNoLink), name: NSNotification.Name(rawValue: "displayNoLink"), object: nil)
            return cell
           
        }
        

    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            print("\nYou Clicked a row!")
            if NetworkMonitor.shared.isConnected {
                let vc = storyboard?.instantiateViewController(identifier: "LeagueDetails") as? leagueDetailsViewController
                
                //collecting Data
                let movingData = MyStoredFavorites()
                movingData.name = leguesToDisplay[indexPath.row].strLeague ?? " "
                movingData.leagueID =  leguesToDisplay[indexPath.row].idLeague ?? ""
                movingData.country =  leguesToDisplay[indexPath.row].strCountry ?? ""
                movingData.image =  leguesToDisplay[indexPath.row].strBadge ?? ""
                movingData.sport =  leguesToDisplay[indexPath.row].strSport ?? ""
                movingData.youTubeLink =  leguesToDisplay[indexPath.row].strYoutube ?? ""
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
        }}
        
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

}
extension AllLeaguesViewController : AllLeguesProtocol{
    func setLegues(Legues: [Countrys]) {
        self.leguesToDisplay = Legues
        self.tableView.reloadData()
    }
    
    
}
