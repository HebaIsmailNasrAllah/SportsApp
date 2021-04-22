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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view.
        allLeguesPresenter.attachView(view: self)
        allLeguesPresenter.getAllLegues()
    }
    override func viewWillAppear(_ animated: Bool) {
        allLeguesPresenter.getAllLegues()
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
            
    //        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableCell
    //        cell.leagueName.text = "Some League Name"
    //        cell.leagueDetails.text = "1997"
    //        cell.leagueImg.image = UIImage(named: "imgPlaceHolder")
    //        cell.leagueImg.layer.cornerRadius = cell.leagueImg.frame.size.width/2
    //
            let cell = Bundle.main.loadNibNamed("TableViewCell1", owner: self, options: nil)?.first as! TableViewCell1
        cell.leagueName.text = leguesToDisplay[indexPath.row].strLeague!
        print(leguesToDisplay[indexPath.row].strLeague!)
            cell.leagueDetail.text = ""
            cell.mainImg.image = UIImage(named: "imgPlaceHolder")
        let str = leguesToDisplay[indexPath.row].strBadge!
        cell.mainImg!.sd_setImage(with: URL(string:str), placeholderImage: UIImage(named: "imgPlaceHolder"))
//        cell.mainImg.image.sd_setImage(with: URL(string: ""), placeholderImage: UIImage(named: "imgPlaceHolder))
            cell.mainImg.layer.cornerRadius = cell.mainImg.frame.size.width/2
//        let url : String = leguesToDisplay[indexPath.row].strYoutube!
        /*cell.youtubeIcon.addTarget(self, action: #selector(self.goToYouTube(url: url)), for: .touchUpInside)*/
       //---------------------------
        cell.youtubeStr = leguesToDisplay[indexPath.row].strYoutube!
//        cell.youtubeIcon.addTarget(self, action: #selector(cell.youtubBtn(_:)), for: .touchUpInside)
            return cell
           
        }
        
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            print("\nYou Clicked a row!")
            if NetworkMonitor.shared.isConnected {
                let vc = storyboard?.instantiateViewController(identifier: "leagueDetails") as? leagueDetailsViewController
                present(vc!, animated: true, completion: nil)
            }else{
                let alert : UIAlertController = UIAlertController(title: "Alert", message: "You Are Offline! Please Turn On The Internet", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (action) in
                    print("ok")
                }))
                self.present(alert, animated: true, completion: nil)
            }
            //
//            let url : String =  leguesToDisplay[indexPath.row].strYoutube! //leguesToDisplay[indexPath.row].strYoutube!
            
            
        }
        
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 120
        }
    
    
    @objc func goToYouTube(url : String){
//        let url : String = "www.youtube.com/channel/UCG5qGWdu8nIRZqJ_GgDwQ-w"
        if url != "" {
            UIApplication.shared.open(NSURL(string: "https://\(url)")! as URL, options: [:], completionHandler: nil)
        }else{
            let alert : UIAlertController = UIAlertController(title: "Alert", message: "Sorry! Link Not Found", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (action) in
                print("ok")
            }))
            self.present(alert, animated: true, completion: nil)
        }
        
    }

}
extension AllLeaguesViewController : AllLeguesProtocol{
    func setLegues(Legues: [Countrys]) {
        self.leguesToDisplay = Legues
        self.tableView.reloadData()
    }
    
    
}
