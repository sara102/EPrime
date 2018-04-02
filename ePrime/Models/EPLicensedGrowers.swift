//
//  EPLicensedGrowers.swift
//  ePrime
//
//  Created by Sara Abdulraheem on 3/28/18.
//  Copyright © 2018 singleclic. All rights reserved.
//

import UIKit
import AlamofireObjectMapper
import Alamofire
import ObjectMapper


let kLicensedGrowersURL:String = "http://13.74.158.217:8022/api/LicensedGrowers"

class EPLicensedGrowers: Mappable {
    var company:String?
    var exportName:String?
    var farmID:Int?
    var grower:String?
    var variety:String?
   
    required init?(map: Map){
    }
    
    func mapping(map: Map) {
        company <- map["Company"]
        exportName <- map["ExportName"]
        farmID <- map["FarmID"]
        grower <- map["Grower"]
        variety <- map["Variety"]
    }
    
    public class func fetchEPLicensedGrowers(completionHandler:@escaping ((_ licensedGrowers:Array<EPLicensedGrowers>?,_ errorMessage:String?) -> Void) ) -> Void
    {
        Alamofire.request(kLicensedGrowersURL).responseJSON { (response) in
            
            if response.response?.statusCode == 200
            {
                if let _ = response.result.value
                {
                    let growerslist: Array<EPLicensedGrowers> = Mapper<EPLicensedGrowers>().mapArray(JSONArray: response.result.value as! [[String : Any]])
                    completionHandler (growerslist,nil)
                }
                else
                {
                    completionHandler (nil,nil)
                }
            }
            else
            {
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
//                }
            }
            
    }
        
        
        
    }
}
