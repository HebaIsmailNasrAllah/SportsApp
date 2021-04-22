//
//  AllSportsViewController.swift
//  SportApp
//
//  Created by Heba Ismail on 4/22/21.
//  Copyright © 2021 None. All rights reserved.
//

import UIKit

class AllSportsViewController: UIViewController , UICollectionViewDataSource, UICollectionViewDelegate ,
UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var collectionView1: UICollectionView!
    let leagueCellId = "LeagueCollectionViewCell"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView1.delegate = self
        collectionView1.dataSource = self
        
        let nibCell = UINib(nibName: leagueCellId, bundle: nil)
        collectionView1.register(nibCell, forCellWithReuseIdentifier: leagueCellId)

        collectionView1.reloadData()

        // Do any additional setup after loading the view.
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
           
               return CGSize(width: (collectionView1.frame.width/2)-6, height: collectionView1.frame.height/4)
       }
       
       func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
           let cell = collectionView.dequeueReusableCell(withReuseIdentifier: leagueCellId, for: indexPath) as! LeagueCollectionViewCell
           cell.mainImg.image = UIImage(named: "imgPlaceHolder")
           cell.mainlbl.text = "Hello!"
               
               return cell
           }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        let size = CGSize(width: 0, height: 30)
        return size
    }
    
    //to make a proper footer
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        let size = CGSize(width: 0, height: 30)
        return size
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            print("\nYou Clicked a row!")
            let vc = storyboard?.instantiateViewController(identifier: "AllLeagues") as? AllLeaguesViewController
            present(vc!, animated: true, completion: nil)
            
        
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
