//
//  ViewControllerExtension.swift
//  iOSArchitecture_MVVM
//
//  Created by Mandeep Singh on 5/7/20.
//  Copyright © 2020 Surjeet Singh. All rights reserved.
//

import Foundation
import UIKit
import AVFoundation
import MobileCoreServices
import Photos

extension Sequence where Element: AdditiveArithmetic {
    func sum() -> Element {
        return reduce(.zero, +)
    }
}

extension UIViewController {
    
    func cameraAccess(completionHandler handler: @escaping (Bool) -> Void) {
        if AVCaptureDevice.authorizationStatus(for: .video) ==  .authorized {
               //already authorized
            handler(true)
        } else {
           AVCaptureDevice.requestAccess(for: .video, completionHandler: { (granted: Bool) in
               if granted {
                   //access allowed
                   handler(true)
               } else {
                   handler(false)
               }
           })
        }
    }
       
    func checkPhotoLibraryPermission(completionHandler handler: @escaping (Bool) -> Void) {
       let status = PHPhotoLibrary.authorizationStatus()
       switch status {
       case .authorized:
       //handle authorized status
           handler(true)

       case .denied, .restricted :
       //handle denied status
           handler(false)

       case .notDetermined:
           // ask for permissions
           PHPhotoLibrary.requestAuthorization { status in
               switch status {
               case .authorized:
               // as above
                   handler(true)
               case .denied, .restricted:
               // as above
                   handler(false)
               case .notDetermined:
                   // won't happen but still
                   handler(false)
               @unknown default:
                handler(false)
            }
           }
       @unknown default:
          handler(false)
        }
    }
    
    func delay(_ delay:Double, closure:@escaping ()->()) {
        DispatchQueue.main.asyncAfter(
            deadline: DispatchTime.now() + Double(Int64(delay * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC), execute: closure)
    }
}
