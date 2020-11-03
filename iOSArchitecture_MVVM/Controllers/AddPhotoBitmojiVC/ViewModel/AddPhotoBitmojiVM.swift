//
//  AddPhotoBitmojiVM.swift
//  iOSArchitecture_MVVM
//
//  Created by MyMac on 12/05/20.
//  Copyright © 2020 Surjeet Singh. All rights reserved.
//

import UIKit

class AddPhotoBitmojiVM: BaseViewModel {
    
    // MARK: Variables
    var userService: UserServiceProtocol
    
    // MARK: Initialization
    // Putting dependency injection by paasing the service object in constructor and not giving the responsibility for the same to LoginViewModel
    init(userService: UserServiceProtocol) {
        self.userService = userService
    }
        
    // MARK: Services Methods
    func uploadProfilePic(profileImage : UIImage) {
        let imageData = profileImage.jpegData(compressionQuality: 0.1)
        if(imageData==nil)  { return }
        
        let file = File.init(name: "profile_pic", filename: "imageFile.jpeg", data: imageData)
        self.isLoading = true
        self.userService.uploadProfilePic(files: file, parameters: nil) { (result)  in
            self.isLoading = false
            switch result {
            case .success(let data):
                if let dataModel = data as? ProfilePicBaseModel {
                    //self.profileModel = dataModel
                }
            case .error(let message):
                self.errorMessage = message
            case .customError(_):
                break
            }
        }
    }
}
