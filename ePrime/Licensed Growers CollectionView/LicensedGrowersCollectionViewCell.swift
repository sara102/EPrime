//
//  LicensedGrowersCollectionViewCell.swift
//  ePrime
//
//  Created by Sara Abdulraheem on 3/13/18.
//  Copyright © 2018 singleclic. All rights reserved.
//

import UIKit

class LicensedGrowersCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var growerNameLabel: UILabel!
    @IBOutlet weak var companyNameLabel: UILabel!
    @IBOutlet weak var exportCompanyLabel: UILabel!
    @IBOutlet weak var varietyLabel: UILabel!
    @IBOutlet weak var bridgeExportCompanyLabel: UILabel!
    override func awakeFromNib()
        {
        super.awakeFromNib()
            
        self.contentView.layer.masksToBounds = true
        self.contentView.layer.cornerRadius = 3.0
        self.contentView.layer.borderWidth = 1.0
        self.contentView.layer.borderColor = UIColor.clear.cgColor
        
        self.layer.shadowColor = UIColor.lightGray.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 2.0)
        self.layer.shadowRadius = 2.0
        self.layer.shadowOpacity = 1.0
        self.layer.masksToBounds = false

    }
  
}
