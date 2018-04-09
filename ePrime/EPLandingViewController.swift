//
//  EPLandingViewController.swift
//  ePrime
//
//  Created by Sara Abdulraheem on 3/12/18.
//  Copyright © 2018 singleclic. All rights reserved.
//

import UIKit
import SwiftQRScanner
import ARSLineProgress
import AVKit
class EPLandingViewController: UIViewController {

    @IBOutlet weak var scanQRCodeButton: UIButton!
    @IBOutlet weak var licensedGrowersButton: UIButton!
    
    
    var didFireDelegateOnce:Bool = false
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        didFireDelegateOnce = false

    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override var prefersStatusBarHidden: Bool {
        return true
    }

    @IBAction func licensedGrowersButtonAction(_ sender: Any) {
       
        ARSLineProgress.show()
        scanQRCodeButton.isEnabled = false
        licensedGrowersButton.isEnabled = false

        EPLicensedGrowers.fetchEPLicensedGrowers(completionHandler: { (data,errorMessage)  in
            ARSLineProgress.hide()
            self.scanQRCodeButton.isEnabled = true
            self.licensedGrowersButton.isEnabled = true
            if ( data != nil && errorMessage == nil)
            {
                let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                let epLicensedGrowersViewController = storyBoard.instantiateViewController(withIdentifier: "EPLicensedGrowersViewController") as! EPLicensedGrowersViewController
                epLicensedGrowersViewController.growersArray = data!
                self.navigationController?.pushViewController(epLicensedGrowersViewController, animated: true)
            }
            else  if errorMessage != nil && !(errorMessage!.isEmpty)
            {
                EPAlertHandler.sharedPresenterInstance().showOneButtonAlert(presentingViewController:self,alertMessage: errorMessage!, alertTitle: "", alertStyle: .default, buttonTitle: "OK", completionBlock: nil)
            }
            else
            {
                EPAlertHandler.sharedPresenterInstance().showOneButtonAlert(presentingViewController:self,alertMessage: "Sorry something went wrong please try again later", alertTitle: "", alertStyle: .default, buttonTitle: "OK", completionBlock: nil)
            }

        })

    }
    
    
    @IBAction func scanQRCodeButtonAction(_ sender: Any) {
      
        let cameraAuthorizationStatus = AVCaptureDevice.authorizationStatus(for:.video)
        
        switch cameraAuthorizationStatus {
            
        case .denied,
             .notDetermined,
             .restricted:
            
            AVCaptureDevice.requestAccess(for: .video) { granted in
                if granted {
                    DispatchQueue.main.async {
                        self.startScanningQRCode()
                    }
                } else {
                    DispatchQueue.main.async {
                        EPAlertHandler.sharedPresenterInstance().showOneButtonAlert(presentingViewController:self,alertMessage: "Please allow us to access your device camera in order to scan QR code", alertTitle: "", alertStyle: .default, buttonTitle: "OK", completionBlock: nil)
                    }
                }
            }
            break
            
        case .authorized:
            self.startScanningQRCode()
            
            break
            
            
            
            
            
        }
}
    func startScanningQRCode() -> Void {
        let scanner:QRCodeScannerController = QRCodeScannerController(cameraImage: UIImage(named:"camera"), cancelImage: UIImage(), flashOnImage: UIImage(named: ""), flashOffImage: UIImage(named: ""))
        scanner.delegate = self
        self.navigationController?.pushViewController(scanner, animated: true)
        scanner.title = "QR code Scanning"
        scanner.navigationController?.navigationItem.hidesBackButton = true
    }
}

extension EPLandingViewController: QRScannerCodeDelegate {
    
    func qrScanner(_ controller: UIViewController, scanDidComplete result: String) {
        if didFireDelegateOnce == false
        {
            didFireDelegateOnce  = true
            self.navigationController?.popViewController(animated: true)
            
            ARSLineProgress.show()
            scanQRCodeButton.isEnabled = false
            licensedGrowersButton.isEnabled = false
            EPPackStickerDetails.fetchEPPackStickerDetails(withQRCode: result) { (data,errorMessage) in
                
                ARSLineProgress.hide()
                self.scanQRCodeButton.isEnabled = true
                self.licensedGrowersButton.isEnabled = true
                if ((data) != nil && errorMessage == nil)
                {
                    let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                    let epPackStickerDetailsViewController = storyBoard.instantiateViewController(withIdentifier: "EPPackStickerDetailsViewController") as! EPPackStickerDetailsViewController
                    epPackStickerDetailsViewController.stickerDetials = data
                    self.navigationController?.pushViewController(epPackStickerDetailsViewController, animated: true)
                }
                else  if errorMessage != nil && !(errorMessage!.isEmpty)
                {
                    EPAlertHandler.sharedPresenterInstance().showOneButtonAlert(presentingViewController:self,alertMessage: errorMessage!, alertTitle: "", alertStyle: .default, buttonTitle: "OK", completionBlock: nil)
                }
                else
                {
                    EPAlertHandler.sharedPresenterInstance().showOneButtonAlert(presentingViewController:self,alertMessage: "Sorry something went wrong please try again later", alertTitle: "", alertStyle: .default, buttonTitle: "OK", completionBlock: nil)
                }
            }
        }
     
    }
    
    func qrScannerDidFail(_ controller: UIViewController, error: String) {
        
    }
    
    func qrScannerDidCancel(_ controller: UIViewController) {
    }
}

