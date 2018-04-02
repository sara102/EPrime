//
//  EPPackStickerDetails.swift
//  ePrime
//
//  Created by Sara Abdulraheem on 3/18/18.
//  Copyright © 2018 singleclic. All rights reserved.
//

import UIKit
import AlamofireObjectMapper
import Alamofire
import ObjectMapper

let kPackStickerURL:String = "http://13.74.158.217:8022/api/PackStickerDetails/"

class EPPackStickerDetails: Mappable {
    var PlotNameEn:String?
    var FarmNameEn:String?
    var VarietyNameEn:String?
//    var PackingTypeName:String?
    var PackWeight:Float?
//    var SupplierNameEn:String?
    var CountryRegionNameEn:String?
    var PlotSize:Float?
    var NoOfTree:Float?
    var PlotName_EN:String?
    var GrowerName:String?
    var ExportName:String?
    var NoDataMessage:String?

    required init?(map: Map){
    }
    
    func mapping(map: Map) {
        PlotNameEn <- map["PlotNameEn"]
        FarmNameEn <- map["FarmNameEn"]
        VarietyNameEn <- map["VarietyNameEn"]
//        PackingTypeName <- map["PackingTypeName"]
        PackWeight <- map["PackWeight"]
//        SupplierNameEn <- map["SupplierNameEn"]
        CountryRegionNameEn <- map["CountryRegionNameEn"]
        PlotSize <- map["PlotSize"]
        NoOfTree <- map["NoOfTree"]
        PlotName_EN <- map["PlotName_EN"]
        GrowerName <- map["GrowerName"]
        ExportName <- map["ExportName"]
        NoDataMessage <- map["NoDataMessage"]

    }
    public class func fetchEPPackStickerDetails(withQRCode:String,completionHandler:@escaping ((_ stickerDetails:EPPackStickerDetails?,_ errorMessage:String?) -> Void) ) -> Void
    {
        let url = kPackStickerURL + withQRCode
        Alamofire.request(url).responseJSON { (response) in
            if response.response?.statusCode == 200 {
                if let _ = response.result.value
                {
                    let stickerDetails: EPPackStickerDetails = Mapper<EPPackStickerDetails>().map(JSON:response.result.value as! [String:Any])!
                    if stickerDetails.NoDataMessage != nil && !(stickerDetails.NoDataMessage?.isEmpty)!
                    {
                        completionHandler (nil,stickerDetails.NoDataMessage)

                    }
                    else
                    {
                        completionHandler (stickerDetails,nil)

                    }
                }
                else
                {
                    completionHandler (nil,nil)
                }
            }
            else {
//                if let _ = response.result.value
//                {
//                    let error = (response.result.value  as? [String : String])
//                    if let _ = error
//                    {
//                        completionHandler (nil,error!["Message"] ?? nil)
//                    }
//                    else
//                    {
//                        completionHandler (nil,nil)
//                    }
//                }
//                else
//                {
                    completionHandler (nil,nil)
               // }
        }


        
        
    }
    }
}
