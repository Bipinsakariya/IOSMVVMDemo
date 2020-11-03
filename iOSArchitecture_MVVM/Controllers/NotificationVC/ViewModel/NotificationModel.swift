//
//  NotificationModel.swift
//  iOSArchitecture_MVVM
//
//  Created by MyMac on 06/05/20.
//  Copyright © 2020 Surjeet Singh. All rights reserved.
//

import Foundation

class NotificationModel: BaseViewModel {
    
    // MARK: Variables
      var userService: UserServiceProtocol
      
      // MARK: Initialization
      // Putting dependency injection by paasing the service object in constructor and not giving the responsibility for the same to LoginViewModel
      init(userService: UserServiceProtocol) {
          self.userService = userService
      }

}
