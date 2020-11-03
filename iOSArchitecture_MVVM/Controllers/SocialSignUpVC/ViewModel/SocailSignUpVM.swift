//
//  SocailSignUpVM.swift
//  iOSArchitecture_MVVM
//
//  Created by MyMac on 07/05/20.
//  Copyright © 2020 Surjeet Singh. All rights reserved.
//

import UIKit

class SocailSignUpVM: BaseViewModel {
    
    // MARK: Variables
    var userService: UserServiceProtocol
    var userModel: User?

    // MARK: Initialization
    // Putting dependency injection by paasing the service object in constructor and not giving the responsibility for the same to LoginViewModel
    init(userService: UserServiceProtocol) {
        self.userService = userService
    }
    
    func socialSignup(social_provider: String,  social_id: String,  email: String, completion: @escaping ResponseBlock) {
        
        let parameter = [DefaultKeys.SocialProvider: social_provider,
                         DefaultKeys.SocialID: social_id,
                         DefaultKeys.Email: email] as KeyValue
        self.isLoading = true
        
        self.userService.SocialSignup(parameter) { (result) in
            self.isLoading = false
            switch result {
            case .success(let data):
                if let user = data as? User {
                    self.userModel = user
                }
                completion(true, "")
            case .error(let message):
                completion(false, message)
            case .customError(let errorModel):
                if let message = errorModel.message?.message {
                    completion(false, message[0])
                }
            }
        }
    }
    
    func socialLogin(social_provider: String, social_id: String, completion: @escaping ResponseBlock) {
        
        let parameter = [DefaultKeys.SocialProvider: social_provider,
                         DefaultKeys.SocialID: social_id] as KeyValue
        
        self.isLoading = true
        
        self.userService.SocialLogin(parameter) { (result) in
            self.isLoading = false
            switch result {
            case .success(let data):
                if let user = data as? User {
                    self.userModel = user
                }
                completion(true, "")
            case .error(let message):
                completion(false, message)
            case .customError(let errorModel):
                if let message = errorModel.message?.message {
                    completion(false, message[0])
                }
            }
        }
    }
    
}
