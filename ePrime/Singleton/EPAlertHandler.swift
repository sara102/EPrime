//
//  EPAlertHandler.swift
//  ePrime
//
//  Created by Sara Abdulraheem on 3/29/18.
//  Copyright © 2018 singleclic. All rights reserved.
//

import UIKit

class EPAlertHandler {
    
    //MARK: - Singleton
        private static var sharedAlertHandler: EPAlertHandler = {
        let presenter = EPAlertHandler()
        
        // Configuration
        // ...
        
        return presenter
    }()
    
    private init() {
        
    }
    
    
    public class func sharedPresenterInstance() -> EPAlertHandler {
        return sharedAlertHandler
    }
    
    
    public func showOneButtonAlert(presentingViewController:UIViewController, alertMessage:String,alertTitle:String,alertStyle:UIAlertActionStyle,buttonTitle:String,completionBlock:(()->Void)?) -> Void {
        
        let alert = UIAlertController(title: alertTitle, message: alertMessage, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: buttonTitle, style: alertStyle, handler: nil))
        presentingViewController.present(alert, animated: true, completion: completionBlock)
    }
}
