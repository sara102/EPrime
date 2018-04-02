//
//  EPLicensedGrowersViewController.swift
//  ePrime
//
//  Created by Sara Abdulraheem on 3/13/18.
//  Copyright © 2018 singleclic. All rights reserved.
//

import UIKit

class EPLicensedGrowersViewController: UIViewController {
   
    var growersArray:Array<EPLicensedGrowers> = []
    
    
    
    @IBOutlet weak var growersCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupNavigationBar()

    }
  

    override var preferredStatusBarStyle: UIStatusBarStyle
    {
        return UIStatusBarStyle.lightContent
    }
    
    func setupNavigationBar () -> Void
    {
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
}

 extension EPLicensedGrowersViewController: UICollectionViewDelegateFlowLayout
{
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize.init(width: self.growersCollectionView.frame.size.width-20, height: 120.0)
    }

}
extension EPLicensedGrowersViewController: UICollectionViewDataSource
{
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:LicensedGrowersCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "growerCell", for: indexPath) as! LicensedGrowersCollectionViewCell
             cell.setupGrowerCell(licensedGrowerItem: growersArray[indexPath.row])
        return cell
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return growersArray.count
    }
    
}


