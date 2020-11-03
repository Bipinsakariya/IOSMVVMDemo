//
//  AddPhotoBitmojiVC.swift
//  iOSArchitecture_MVVM
//
//  Created by MyMac on 12/05/20.
//  Copyright © 2020 Surjeet Singh. All rights reserved.
//

import UIKit
import TOCropViewController
import SDWebImage

class AddPhotoBitmojiVC: BaseViewController {

    @IBOutlet weak var imgProfilePic: CustomImageView!
    var bitmojiURL = ""
    var userModel : User?
    
    lazy var viewModel: AddPhotoBitmojiVM = {
        let obj = AddPhotoBitmojiVM(userService: UserService())
        self.baseVwModel = obj
        return obj
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setUpView()
    }
    
    func setUpClosures() {
        
    }
    
    func setUpView() {
        self.setUpClosures()
    }
    
    private func notificationVC() {
        let notificationVC = self.storyboard?.instantiateViewController(withIdentifier: NotificationVC.className) as! NotificationVC
        self.navigationController?.pushViewController(notificationVC, animated: true)
    }
    
    @IBAction func btnAddBitmojiAction(_ sender: Any) {
        imgProfilePic.sd_imageIndicator = SDWebImageActivityIndicator.white
        imgProfilePic.sd_setImage(with: URL(string: bitmojiURL))
    }
    
    @IBAction func btnChoosePhotoAction(_ sender: Any) {
        self.chooseFromGallery()
    }
    
    @IBAction func btnTakePhotoAction(_ sender: Any) {
        self.takePhoto()
    }
        
    @IBAction func btnContinueAction(_ sender: Any) {
        self.notificationVC()
    }
    
    func takePhoto() {
        self.cameraAccess(completionHandler: { (isGranted) in
            DispatchQueue.main.async(execute: {

                if isGranted {
                    // Access allowed
                    self.getImage(fromSourceType: .camera)
                } else {
                    let configAlert: AlertUI = (AlertMessage.noCameraAccess, AlertMessage.noCamera)
                    UIAlertController.showAlert(configAlert)
                }
            })
        })
    }
    
    func chooseFromGallery() {
        self.checkPhotoLibraryPermission(completionHandler: { (isGranted) in
            DispatchQueue.main.async(execute: {
                if isGranted {
                    // Access allowed
                    self.getImage(fromSourceType: .photoLibrary)
                } else {
                    let configAlert: AlertUI = (AlertMessage.noGalleryAccess, AlertMessage.noPhoto)
                    UIAlertController.showAlert(configAlert)
                }
            })
        })
    }
}

extension AddPhotoBitmojiVC: UINavigationControllerDelegate, UIImagePickerControllerDelegate, TOCropViewControllerDelegate {
    
    //get image from source type
    func getImage(fromSourceType sourceType: UIImagePickerController.SourceType) {
           
       //Check is source type available
       if UIImagePickerController.isSourceTypeAvailable(sourceType) {
           
           let imagePickerController = UIImagePickerController()
           imagePickerController.delegate = self
           imagePickerController.sourceType = sourceType
           self.present(imagePickerController, animated: true, completion: nil)
       }
    }
       
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
       
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
       if let image = info[.originalImage] as? UIImage {
        
           let cropController = TOCropViewController(croppingStyle: .circular, image: image)
           cropController.delegate = self
           cropController.title = "Crop Image"
           let navigation = UINavigationController(rootViewController: cropController)

           picker.dismiss(animated: true, completion: {
               self.present(navigation, animated: true, completion: nil)
           })
       }
    }
    
    func cropViewController(_ cropViewController: TOCropViewController, didCropTo image: UIImage, with cropRect: CGRect, angle: Int) {
        self.updateImageViewWithImage(image, fromCropViewController: cropViewController)
    }
    
    func cropViewController(_ cropViewController: TOCropViewController, didFinishCancelled cancelled: Bool) {
        if cancelled {
            self.dismiss(animated: true, completion: nil)
        }
    }
       
    func updateImageViewWithImage(_ image: UIImage, fromCropViewController cropViewController: TOCropViewController) {
        dismiss(animated: true, completion: nil)

        DispatchQueue.main.async {
            self.imgProfilePic.image = image
        }
        
        //self.viewModel.uploadProfilePic(profileImage: image)
    }
}

