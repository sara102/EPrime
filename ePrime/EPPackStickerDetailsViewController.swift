//
//  EPPackStickerDetailsViewController.swift
//  ePrime
//
//  Created by Sara Abdulraheem on 3/19/18.
//  Copyright © 2018 singleclic. All rights reserved.
//

import UIKit

class EPPackStickerDetailsViewController: UIViewController {
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var packageWeightLabel: UILabel!
    @IBOutlet weak var numberOfTreesLabel: UILabel!
    @IBOutlet weak var FarmNameLabel: UILabel!
    var data = [String: String]()
    var stickerDetials:EPPackStickerDetails?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.normalizeApiDataToUIData()
        self.setupUI()

    }
    func normalizeApiDataToUIData () -> Void
    {
        
        if stickerDetials?.CountryRegionID != nil && stickerDetials?.CountryRegionID?.description != ""
        {
            data["Country region id"] =  stickerDetials?.CountryRegionID?.description
        }
        
        if stickerDetials?.CountryRegionNameEn != nil && stickerDetials?.CountryRegionNameEn! != ""
        {
            data["Country region name"] =  stickerDetials?.CountryRegionNameEn!
        }
        
        if stickerDetials?.ExportName != nil && stickerDetials?.ExportName! != ""
        {
            data["Export name"] =  stickerDetials?.ExportName!
        }
        
        if stickerDetials?.GrowerName != nil && stickerDetials?.GrowerName! != ""
        {
            data["Grower name"] =  stickerDetials?.GrowerName!
        }
        
        
        if stickerDetials?.PackingTypeName != nil && stickerDetials?.PackingTypeName! != ""
        {
            data["Packing type name"] =  stickerDetials?.PackingTypeName!
        }
        
        if stickerDetials?.PlotName_EN != nil && stickerDetials?.PlotName_EN! != ""
        {
            data["Plot name"] =  stickerDetials?.PlotName_EN!
        }
        
        if stickerDetials?.PlotSize != nil && stickerDetials?.PlotSize?.description != ""
        {
            data["Plot size"] =  stickerDetials?.PlotSize?.description
        }
        
        if stickerDetials?.SupplierNameEn != nil && stickerDetials?.SupplierNameEn! != ""
        {
            data["Supplier name"] =  stickerDetials?.SupplierNameEn!
        }
        
        if stickerDetials?.VarietyNameEn != nil && stickerDetials?.VarietyNameEn! != ""
        {
            data["Variety name"] =  stickerDetials?.VarietyNameEn!
        }

    }
    func setupUI()-> Void
    {
        self.containerView.clipsToBounds = false
        self.containerView.layer.masksToBounds = false
        self.containerView.layer.shadowColor = UIColor.lightGray.cgColor
        self.containerView.layer.shadowOffset = CGSize(width: 0, height: 2.0)
        self.containerView.layer.shadowRadius = 5.0
        self.containerView.layer.shadowOpacity = 1.0
        
        self.containerView.clipsToBounds = true
        self.containerView.layer.masksToBounds = true

        self.containerView.layer.cornerRadius = 5.0
        self.containerView.layer.borderWidth = 2.0
        self.containerView.layer.borderColor = UIColor.clear.cgColor
     
       
       
        
        self.FarmNameLabel.text = stickerDetials?.FarmNameEn ?? ""
        self.numberOfTreesLabel.text = stickerDetials?.NoOfTree != nil ? stickerDetials?.NoOfTree!.description : ""
        self.packageWeightLabel.text = stickerDetials?.PackWeight != nil ? stickerDetials?.PackWeight!.description : ""

    }

}
extension EPPackStickerDetailsViewController:UITableViewDelegate
{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 30
    }
}

extension EPPackStickerDetailsViewController:UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.keys.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "stickerCell") as! EPPackStickerCellTableViewCell
    
        
        let arr = Array(data.keys)
        let key = arr[indexPath.row]

        cell.setupCell(key: key , value: data[key]!)

        return cell
        
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
}
