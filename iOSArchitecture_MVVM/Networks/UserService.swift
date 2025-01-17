//
//  LoginAPIManager.swift
//  iOSArchitecture
//
//  Created by Amit on 23/02/18.
//  Copyright © 2018 smartData. All rights reserved.
//

import Foundation
import UIKit

protocol UserServiceProtocol {
    func doLogin(email: String, password: String, completion:@escaping (Result<Any>) -> Void)
    func resendOTP(_ params: KeyValue, completion:@escaping (Result<Any>) -> Void)
    func verifyOTP(_ params: KeyValue, completion:@escaping (Result<Any>) -> Void)
    func registerNumber(_ params: KeyValue, completion:@escaping (Result<Any>) -> Void)
    func createUsername(_ params: KeyValue, completion:@escaping (Result<Any>) -> Void)
    func uploadProfilePic(files: File, parameters: [String: Any]?, completion: @escaping (Result<Any>) -> Void)
    func SocialSignup(_ params: KeyValue, completion: @escaping (Result<Any>) -> Void)
    func SocialLogin(_ params: KeyValue, completion: @escaping (Result<Any>) -> Void)
    func checkUsername(_ params: KeyValue, completion: @escaping (Result<Any>) -> Void)
    func checkEmail(_ params: KeyValue, completion: @escaping (Result<Any>) -> Void)
    func manualLogin(_ params: KeyValue, completion: @escaping (Result<Any>) -> Void)
    func forgotPassword(_ params: KeyValue, completion: @escaping (Result<Any>) -> Void)
    func resendTemporyPassword(_ params: KeyValue, completion: @escaping (Result<Any>) -> Void)
    func verifyTemporyPassword(_ params: KeyValue, completion: @escaping (Result<Any>) -> Void)

}

public class UserService: APIService, UserServiceProtocol {
    
    func verifyTemporyPassword(_ params: KeyValue, completion: @escaping (Result<Any>) -> Void) {
        let serviceConfig: Service.config = (.POST, Config.verifyTempPassword, false)
        super.startService(config: serviceConfig, parameters: params, files: nil, modelType: MessageBase.self) { (result) in
            DispatchQueue.main.async {
                switch result {
                case .success(let data):
                    if let userModel = data {
                        // Parse Here
                     completion(.success(userModel))
                    }
                case .error(let message):
                     completion(.error(message))
                 case .customError(let errorModel):
                     completion(.customError(errorModel))
                }
            }
         }
    }
    
    func resendTemporyPassword(_ params: KeyValue, completion: @escaping (Result<Any>) -> Void) {
        let serviceConfig: Service.config = (.POST, Config.resendTempPassword, false)
        super.startService(config: serviceConfig, parameters: params, files: nil, modelType: MessageBase.self) { (result) in
            DispatchQueue.main.async {
                switch result {
                case .success(let data):
                    if let userModel = data {
                        // Parse Here
                     completion(.success(userModel))
                    }
                case .error(let message):
                     completion(.error(message))
                 case .customError(let errorModel):
                     completion(.customError(errorModel))
                }
            }
         }
    }
    
    func forgotPassword(_ params: KeyValue, completion: @escaping (Result<Any>) -> Void) {
        let serviceConfig: Service.config = (.POST, Config.forgotPassword, false)
        super.startService(config: serviceConfig, parameters: params, files: nil, modelType: MessageBase.self) { (result) in
            DispatchQueue.main.async {
                switch result {
                case .success(let data):
                    if let userModel = data {
                        // Parse Here
                     completion(.success(userModel))
                    }
                case .error(let message):
                     completion(.error(message))
                 case .customError(let errorModel):
                     completion(.customError(errorModel))
                }
            }
         }
    }
    
    func manualLogin(_ params: KeyValue, completion: @escaping (Result<Any>) -> Void) {
       let serviceConfig: Service.config = (.POST, Config.login, false)
       super.startService(config: serviceConfig, parameters: params, files: nil, modelType: UserBaseModel.self) { (result) in
           DispatchQueue.main.async {
               switch result {
               case .success(let data):
                   if let userModel = data {
                       // Parse Here
                    completion(.success(userModel))
                   }
               case .error(let message):
                    completion(.error(message))
                case .customError(let errorModel):
                    completion(.customError(errorModel))
               }
           }
        }
    }
   
    func doLogin(email: String, password: String, completion: @escaping (Result<Any>) -> Void) {
        let param = [Keys.email: email, Keys.password: password]
           let serviceConfig: Service.config = (.POST, Config.login, false)
           super.startService(config: serviceConfig, parameters: param, files: nil, modelType: User.self) { (result) in
               DispatchQueue.main.async {
                   switch result {
                   case .success(let data):
                       if let userModel = data {
                           // Parse Here
                        completion(.success(userModel))
                       }
                   case .error(let message):
                        completion(.error(message))
                    case .customError(let errorModel):
                                      completion(.customError(errorModel))
                   }
               }
        }
    }
    
    func registerNumber(_ params: KeyValue, completion: @escaping (Result<Any>) -> Void) {
        
       let serviceConfig: Service.config = (.POST, Config.registerUser, false)
       super.startService(config: serviceConfig, parameters: params, files: nil, modelType: MessageBase.self) { (result) in
           DispatchQueue.main.async {
               switch result {
               case .success(let data):
                   if let userModel = data {
                       // Parse Here
                    completion(.success(userModel))
                   }
               case .error(let message):
                    completion(.error(message))
                 case .customError(let errorModel):
                    completion(.customError(errorModel))
               }
           }
       }
    }
    
    func createUsername(_ params: KeyValue, completion: @escaping (Result<Any>) -> Void) {
        let serviceConfig: Service.config = (.POST, Config.createUsername, false)
         super.startService(config: serviceConfig, parameters: params, files: nil, modelType: UserBaseModel.self) { (result) in
            DispatchQueue.main.async {
                switch result {
                case .success(let data):
                    if let userModel = data {
                        // Parse Here
                        completion(.success(userModel))
                    }
                case .error(let message):
                    completion(.error(message))
                 case .customError(let errorModel):
                    completion(.customError(errorModel))
                }
            }
        }
    }
    
    func uploadProfilePic(files: File, parameters: [String : Any]?, completion: @escaping (Result<Any>) -> Void) {
        
        let serviceConfig : Service.config = (.POST, Config.getuserProfile, true)

         super.startService(config: serviceConfig, parameters: parameters, files: [files], modelType: ProfilePicBaseModel.self) { (result) in
               DispatchQueue.main.async {
                   switch result {
                      case .success(let data):
                          if let userModel = data {
                              // Parse Here
                              completion(.success(userModel))
                          }
                      case .error(let message):
                          completion(.error(message))
                     case .customError(let errorModel):
                        completion(.customError(errorModel))
                  }
             }
         }
    }
    
    func verifyOTP(_ params: KeyValue, completion: @escaping (Result<Any>) -> Void) {
        let serviceConfig: Service.config = (.POST, Config.verifyOTPCode, false)
         super.startService(config: serviceConfig, parameters: params, files: nil, modelType: VerifiedBase.self) { (result) in
            DispatchQueue.main.async {
                switch result {
                case .success(let data):
                    if let userModel = data {
                        // Parse Here
                        completion(.success(userModel))
                    }
                case .error(let message):
                    completion(.error(message))
                case .customError(let errorModel):
                    completion(.customError(errorModel))
                }
            }
        }
    }
    
    func SocialSignup(_ params: KeyValue, completion: @escaping (Result<Any>) -> Void) {
                
        let serviceConfig: Service.config = (.POST, Config.registerUser, false)
        
        super.startService(config: serviceConfig, parameters: params, files: nil, modelType: User.self) { (result) in
            DispatchQueue.main.async {
                switch result {
                case .success(let data):
                    if let userModel = data {
                        // Parse Here
                        completion(.success(userModel))
                    }
                case .error(let message):
                    completion(.error(message))
                case .customError(let errorModel):
                    completion(.customError(errorModel))
                }
            }
        }
    }
    
    func SocialLogin(_ params: KeyValue, completion: @escaping (Result<Any>) -> Void) {
                
        let serviceConfig: Service.config = (.POST, Config.login, false)
        
        super.startService(config: serviceConfig, parameters: params, files: nil, modelType: User.self) { (result) in
            DispatchQueue.main.async {
                switch result {
                case .success(let data):
                    if let userModel = data {
                        // Parse Here
                        completion(.success(userModel))
                    }
                case .error(let message):
                    completion(.error(message))
                case .customError(let errorModel):
                    completion(.customError(errorModel))
                }
            }
        }
    }
    
    func resendOTP(_ params: KeyValue, completion: @escaping (Result<Any>) -> Void) {
        let serviceConfig : Service.config = (.POST, Config.regenerateOTPCode, false)

        super.startService(config: serviceConfig, parameters: params, files: nil, modelType: MessageBase.self) { (result) in
              DispatchQueue.main.async {
                  switch result {
                     case .success(let data):
                         if let userModel = data {
                             // Parse Here
                             completion(.success(userModel))
                         }
                     case .error(let message):
                         completion(.error(message))
                    case .customError(let errorModel):
                        completion(.customError(errorModel))
                 }
            }
        }
    }
    
    func checkUsername(_ params: KeyValue, completion: @escaping (Result<Any>) -> Void) {
        let serviceConfig : Service.config = (.POST, Config.checkUsername, false)

        super.startService(config: serviceConfig, parameters: params, files: nil, modelType: MessageBase.self) { (result) in
              DispatchQueue.main.async {
                  switch result {
                     case .success(let data):
                         if let userModel = data {
                             // Parse Here
                             completion(.success(userModel))
                         }
                     case .error(let message):
                         completion(.error(message))
                    case .customError(let errorModel):
                        completion(.customError(errorModel))
                 }
            }
        }
    }
    
    func checkEmail(_ params: KeyValue, completion: @escaping (Result<Any>) -> Void) {
        let serviceConfig : Service.config = (.POST, Config.checkEmail, false)

        super.startService(config: serviceConfig, parameters: params, files: nil, modelType: MessageBase.self) { (result) in
              DispatchQueue.main.async {
                  switch result {
                     case .success(let data):
                         if let userModel = data {
                             // Parse Here
                             completion(.success(userModel))
                         }
                     case .error(let message):
                         completion(.error(message))
                    case .customError(let errorModel):
                        completion(.customError(errorModel))
                 }
            }
        }
    }
  
}
