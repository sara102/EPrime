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
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

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
        EPLicensedGrowers.fetchEPLicensedGrowers(completionHandler: { (data,errorMessage)  in
            ARSLineProgress.hide()
            if ( data != nil && errorMessage == nil)
            {
                let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                let epLicensedGrowersViewController = storyBoard.instantiateViewController(withIdentifier: "EPLicensedGrowersViewController") as! EPLicensedGrowersViewController
                
                self.navigationController?.pushViewController(epLicensedGrowersViewController, animated: true)
            }
            else
            {
                let alert = UIAlertController(title: "", message: "Sorry something went wrong please try again.", preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
            
        })
       
    }
    
    
    @IBAction func scanQRCodeButtonAction(_ sender: Any) {
        
        DispatchQueue.main.async {
            let cameraAuthorizationStatus = AVCaptureDevice.authorizationStatus(for:.video)
            
            switch cameraAuthorizationStatus {
            case .denied,
                 .restricted:
                let alert = UIAlertController(title: "", message: "Hi there, we can't proceed in scanning the QR code without using your camera, please give us the camera permission from settings", preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                self.present(alert, animated: true, completion: nil)
                
                break
            case .authorized:
                
                let scanner:QRCodeScannerController = QRCodeScannerController(cameraImage: UIImage(named:"camera"), cancelImage: UIImage(), flashOnImage: UIImage(named: ""), flashOffImage: UIImage(named: ""))
                scanner.delegate = self
                self.navigationController?.pushViewController(scanner, animated: true)
                scanner.title = "QR code Scanning"
                scanner.navigationController?.navigationItem.hidesBackButton = true
                
                break
            case .notDetermined:
                AVCaptureDevice.requestAccess(for: .video) { granted in
                    if granted {
                        let scanner:QRCodeScannerController = QRCodeScannerController(cameraImage: UIImage(named:"camera"), cancelImage: UIImage(), flashOnImage: UIImage(named: ""), flashOffImage: UIImage(named: ""))
                        scanner.delegate = self
                        self.navigationController?.pushViewController(scanner, animated: true)
                        scanner.title = "QR code Scanning"
                        scanner.navigationController?.navigationItem.hidesBackButton = true
                        
                    } else {
                        let alert = UIAlertController(title: "", message: "Hi there, we can't proceed in scanning the QR code without using your camera, please give us the camera permission from settings", preferredStyle: UIAlertControllerStyle.alert)
                        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                        self.present(alert, animated: true, completion: nil)
                    }
                }
                break
            }
        }
       
  

    }
}


extension EPLandingViewController: QRScannerCodeDelegate {
    
    func qrScanner(_ controller: UIViewController, scanDidComplete result: String) {
        self.navigationController?.popViewController(animated: true)
        
        ARSLineProgress.show()
        EPPackStickerDetails.fetchEPPackStickerDetails(withQRCode: "10440726252590416") { (data) in
            ARSLineProgress.hide()

            if ((data) != nil)
            {
                let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                let epPackStickerDetailsViewController = storyBoard.instantiateViewController(withIdentifier: "EPPackStickerDetailsViewController") as! EPPackStickerDetailsViewController
                epPackStickerDetailsViewController.stickerDetials = data
                self.navigationController?.pushViewController(epPackStickerDetailsViewController, animated: true)
            }
            else
            {
                EPAlertHandler.sharedPresenterInstance().showOneButtonAlert(presentingViewController:self,alertMessage: "sorry something went wrong try again later", alertTitle: "", alertStyle: .default, buttonTitle: "OK", completionBlock: nil)
            }
        }
    }
    
    func qrScannerDidFail(_ controller: UIViewController, error: String) {
        
    }
    
    func qrScannerDidCancel(_ controller: UIViewController) {
    }
}

