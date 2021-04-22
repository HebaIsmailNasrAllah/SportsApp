//
//  leagueDetailsViewController.swift
//  SportApp
//
//  Created by Heba Ismail on 4/20/21.
//  Copyright © 2021 None. All rights reserved.
//

import UIKit

class leagueDetailsViewController: UIViewController ,UICollectionViewDataSource, UICollectionViewDelegate ,
UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var collectionView1: UICollectionView!
    @IBOutlet weak var collectionView2: UICollectionView!
    @IBOutlet weak var collectionView3: UICollectionView!
    
    let leagueCellId = "LeagueCollectionViewCell"
    let resultCellId = "ResultCollectionViewCell"
    let teamCellId = "TeamCollectionViewCell"
    let sportCellId = "SportCollectionViewCell"
    

    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView1.delegate = self
        collectionView1.dataSource = self
        
        collectionView2.delegate = self
        collectionView2.dataSource = self
        
        collectionView3.delegate = self
        collectionView3.dataSource = self
        
     //   let nibCell = UINib(nibName: leagueCellId, bundle: nil)
     //   collectionView1.register(nibCell, forCellWithReuseIdentifier: leagueCellId)
        
        let nibCell2 = UINib(nibName: resultCellId, bundle: nil)
        collectionView2.register(nibCell2, forCellWithReuseIdentifier: resultCellId)
        
        let nibCell3 = UINib(nibName: teamCellId, bundle: nil)
        collectionView3.register(nibCell3, forCellWithReuseIdentifier: teamCellId)
        
        let nibCell4 = UINib(nibName: sportCellId, bundle: nil)
        collectionView1.register(nibCell4, forCellWithReuseIdentifier: sportCellId)
        
        

        collectionView1.reloadData()
        collectionView2.reloadData()
        collectionView3.reloadData()
        
        // Do any additional setup after loading the view.
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    //Modification starts here
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if (collectionView == collectionView1){
            return CGSize(width: collectionView1.frame.width/3, height: collectionView.frame.height-10)
            
        }else if (collectionView == collectionView2) {
            return CGSize(width: collectionView2.frame.width, height: collectionView2.frame.height/2)
        }else {
            return CGSize(width: collectionView3.frame.height, height: collectionView3.frame.height)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if (collectionView == collectionView1){
        //let cell = collectionView.dequeueReusableCell(withReuseIdentifier: leagueCellId, for: indexPath) as! LeagueCollectionViewCell
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: sportCellId, for: indexPath) as! SportCollectionViewCell
        //cell.mainImg.image = UIImage(named: "imgPlaceHolder")
          //  cell.mainlbl.text = "Hello!"
            cell.eventImg.image = UIImage(named: "imgPlaceHolder")
            cell.eventDate.text = "Date"
            cell.eventTime.text = "Time"
            cell.eventName.text = "Name"
            return cell
        }else if (collectionView == collectionView2) {
         let cell = collectionView.dequeueReusableCell(withReuseIdentifier: resultCellId, for: indexPath) as! ResultCollectionViewCell
            
            cell.teamsName.text = "teams"
            cell.dateAndTime.text = "Date and Time"
            cell.teamsResult.text = "The latest Results"
            return cell
        }else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: teamCellId, for: indexPath) as! TeamCollectionViewCell
            
            cell.mainImg.image = UIImage(named: "imgPlaceHolder")
            //cell.backgroundColor = UIColor.blue
            cell.layer.cornerRadius = collectionView3.frame.height/2
            
            return cell
        }
        
        
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
