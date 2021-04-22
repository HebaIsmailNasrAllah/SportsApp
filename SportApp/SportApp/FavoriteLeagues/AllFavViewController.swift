//
//  AllFavViewController.swift
//  SportApp
//
//  Created by Heba Ismail on 4/19/21.
//  Copyright © 2021 None. All rights reserved.
//

import UIKit

class AllFavViewController: UIViewController , UITableViewDataSource, UITableViewDelegate{
    
    

    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        // Do any additional setup after loading the view.
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
        return 5
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
        cell.leagueName.text = "Test"
        cell.leagueDetail.text = "123"
        cell.mainImg.image = UIImage(named: "imgPlaceHolder")
        cell.mainImg.layer.cornerRadius = cell.mainImg.frame.size.width/2
        return cell
       
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\nYou Clicked a row!")
        let vc = storyboard?.instantiateViewController(identifier: "AllLeagues") as? AllLeaguesViewController
        present(vc!, animated: true, completion: nil)
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    

}
