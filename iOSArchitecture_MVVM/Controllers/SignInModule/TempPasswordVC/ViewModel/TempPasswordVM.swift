//
//  TempPasswordVM.swift
//  iOSArchitecture_MVVM
//
//  Created by Mandeep Singh on 5/12/20.
//  Copyright © 2020 Surjeet Singh. All rights reserved.
//

import UIKit

class TempPasswordVM: BaseViewModel {
    
    // MARK: Variables
    var userService: UserServiceProtocol
    
    var userEmail: String?
    
    // MARK: Initialization
    // Putting dependency injection by paasing the service object in constructor and not giving the responsibility for the same to LoginViewModel
    init(userService: UserServiceProtocol) {
        self.userService = userService
    }
    
    func validations(_ password: String?) {
        
       guard let userPass = password, userPass.count > 6 else {
           self.isValidationFailed = .password
           return
       }
    
        self.isSuccess = true

        let params = [Keys.password: userPass, Keys.email: self.userEmail ?? ""]
//        self.checkTempPasswordService(params)
    }
    
    private func checkTempPasswordService(_ params: KeyValue) {
        
        self.isLoading = true
        let parameter = [Keys.email: self.userEmail ?? ""]
       
          self.userService.forgotPassword(parameter) { (result) in
           self.isLoading = false

              switch result {
              case .success(_):
                   self.isSuccess = true
                   break
              case .error(let message):
                   self.errorMessage = message
              case .customError(let errorModel):
                   if let list = errorModel.message?.message {
                       self.serverValidations = list[0]
                   }
                  break
              }
        }
    }
    
    func generateTempPasswordService() {
        self.isLoading = true
        let parameter = [Keys.email: self.userEmail ?? ""]
        
           self.userService.forgotPassword(parameter) { (result) in
            self.isLoading = false

               switch result {
               case .success(_):
                    self.isSuccess = true
                    break
               case .error(let message):
                    self.errorMessage = message
               case .customError(let errorModel):
                    if let list = errorModel.message?.message {
                        self.serverValidations = list[0]
                    }
                   break
               }
         }
    }
    
}
