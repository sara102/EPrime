//
//  LicensedGrowersCollectionViewCell.swift
//  ePrime
//
//  Created by Sara Abdulraheem on 3/13/18.
//  Copyright © 2018 singleclic. All rights reserved.
//

import UIKit

class LicensedGrowersCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var contentStackView: UIStackView!
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
    
    public func setupGrowerCell(licensedGrowerItem:EPLicensedGrowers)
    {
        if (licensedGrowerItem.grower != nil && licensedGrowerItem.grower != "")
        {
            growerNameLabel.text = "\(licensedGrowerItem.grower ?? "")"
        }
        else
        {
            growerNameLabel.isHidden = true
        }
        
        
        
        if (licensedGrowerItem.company != nil && licensedGrowerItem.company != "")
        {
            companyNameLabel.text = "\(licensedGrowerItem.company ?? "")"
        }
        else
        {
            companyNameLabel.isHidden = true
        }
        
        
        
        if (licensedGrowerItem.exportName != nil && licensedGrowerItem.exportName != "")
        {
            exportCompanyLabel.text = "\(licensedGrowerItem.exportName!)"
        }
        else
        {
            exportCompanyLabel.isHidden = true
        }
         
        if (licensedGrowerItem.variety != nil && licensedGrowerItem.variety != "")
        {
            let varietyString:String = licensedGrowerItem.variety?.replacingOccurrences(of: ",", with: "\n") ?? ""
            varietyLabel.text = varietyString
        }
        else
        {
            varietyLabel.isHidden = true
        }
        
        
      
            bridgeExportCompanyLabel.isHidden = true

    }
  
}
