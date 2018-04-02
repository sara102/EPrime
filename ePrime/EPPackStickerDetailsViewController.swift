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
    @IBOutlet weak var growerLabel: UILabel!
    @IBOutlet weak var targetMarket: UILabel!
    @IBOutlet weak var FarmNameLabel: UILabel!
    var keys:[String] = []
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
        

        if (stickerDetials?.FarmNameEn != nil && stickerDetials?.FarmNameEn! != ""  ) && (stickerDetials?.ExportName != nil)
        {
            data["Farm Name"] =  stickerDetials?.FarmNameEn!
            keys.append("Farm Name")
        }
        
        if stickerDetials?.VarietyNameEn != nil && stickerDetials?.VarietyNameEn! != ""
        {
            data["Variety Name"] =  stickerDetials?.VarietyNameEn!
            keys.append("Variety Name")
            
        }
        
        if stickerDetials?.PackWeight != nil && stickerDetials?.PackWeight?.description != ""
        {
            data["Package Weight"] =  (stickerDetials?.PackWeight?.description)! + " KG"
            keys.append("Package Weight")
            
        }
        
        
        if stickerDetials?.PlotName_EN != nil && stickerDetials?.PlotName_EN! != ""
        {
            data["Plot Name"] =  stickerDetials?.PlotName_EN!
            keys.append("Plot Name")

        }
        
        if stickerDetials?.PlotSize != nil && stickerDetials?.PlotSize?.description != ""
        {
            data["Plot Size"] =  (stickerDetials?.PlotSize?.description)! + " Feddan"
            keys.append("Plot Size")

        }
        if stickerDetials?.NoOfTree != nil && stickerDetials?.NoOfTree?.description != ""
        {
            data["Number Of Vines"] =  stickerDetials?.NoOfTree?.description
            keys.append("Number Of Vines")

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
     
       if stickerDetials?.ExportName != nil  && stickerDetials?.ExportName! != ""
       {
         self.FarmNameLabel.text = stickerDetials?.ExportName!
       }
       else
       {
         self.FarmNameLabel.text = stickerDetials?.FarmNameEn ?? ""
       }
        
        self.targetMarket.text = stickerDetials?.CountryRegionNameEn != nil ? stickerDetials?.CountryRegionNameEn!.description : ""
        self.growerLabel.text = stickerDetials?.GrowerName != nil ? stickerDetials?.GrowerName! : ""

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
    
        
        
        let key = keys[indexPath.row]

        cell.setupCell(key: key , value: data[key]!)

        return cell
        
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
}
