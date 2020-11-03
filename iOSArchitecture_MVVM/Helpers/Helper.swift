//
//  SpotlexHelper.swift
//  Spotlex
//
//  Created by Mandeep Singh on 1/9/20.
//  Copyright © 2020 Mandeep Singh. All rights reserved.
//

import Foundation
import UIKit
import IQKeyboardManagerSwift
import GoogleSignIn

struct Helper {
    
    static let shared = Helper()
    
    func setUpApp() {
        
        UINavigationBar.appearance().barTintColor = AppColor.blueColor
        UINavigationBar.appearance().tintColor = UIColor.white
//        UINavigationBar.appearance().isTranslucent = false
//        UINavigationBar.appearance().shadowImage = UIImage()
//        UINavigationBar.appearance().setBackgroundImage(UIImage(), for: .any, barMetrics: .default)

        sleep(2)
        //We are enabling the keyboard manager class by passing the true value
        IQKeyboardManager.shared.enable = true
        
        GIDSignIn.sharedInstance().clientID = AppKeys.kGoogleClientID


        if AppUser.defaults.bool(forKey: DefaultKeys.isAutoLogin) == true {
           // self.rootViewAfterSession()
        }
    }
        
    //MARK: set root View of current user session
     func rootViewAfterSession() {
         /*
         let homeStoryboard = UIStoryboard(name: Storyboards.main, bundle:nil)
          guard let navVC = homeStoryboard.instantiateViewController(withIdentifier: Identifiers.mainNavVC) as? UINavigationController else {
              print("Home VC not found")
              return
          }
          guard let homeVC = homeStoryboard.instantiateViewController(withIdentifier: HomeController.className) as? HomeController else {
              print("Home VC not found")
              return
          }
         navVC.viewControllers = [homeVC]
         navVC.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
         AppUser.shared.window?.rootViewController = navVC
         AppUser.shared.window?.makeKeyAndVisible()
         */
        
    }
    
    func destroySession() {
       
       self.removeLocalValues()
       let mainStoryboard = UIStoryboard(name: Storyboards.main, bundle:nil)
       guard let navVC = mainStoryboard.instantiateViewController(withIdentifier: Identifiers.mainNavVC) as? UINavigationController else {
            print("Home VC not found")
            return
        }
       navVC.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
       navVC.isNavigationBarHidden = false
       AppUser.shared.window?.rootViewController = navVC
       AppUser.shared.window?.makeKeyAndVisible()
    }
    
    private func removeLocalValues() {
        AppUser.defaults.removeObject(forKey: DefaultKeys.isAutoLogin)
        AppUser.defaults.removeObject(forKey: DefaultKeys.session)
        AppUser.defaults.removeObject(forKey: DefaultKeys.userToken)
    }
}


struct UserSession {
    
    static var userInfo : UserProfile? {
        get {
            guard let decoded  = AppUser.defaults.data(forKey: DefaultKeys.session) else { return nil }
            let decoder = JSONDecoder()
            guard let userModel = try? decoder.decode(UserProfile.self, from: decoded) else {
                return nil
            }
            return userModel
        } set {
            guard let value = newValue else { return }
            do {
                let genericModel = try JSONEncoder().encode(value)
                AppUser.defaults.set(genericModel, forKey: DefaultKeys.session)
                AppUser.defaults.synchronize()
            } catch let error {
                print(error.localizedDescription)
            }
        }
    }
    
    
    
    static var userToken : String? {
        get {
            guard let decoded  = AppUser.defaults.data(forKey: DefaultKeys.userToken) else { return nil }
            let decoder = JSONDecoder()
            guard let token = try? decoder.decode(String.self, from: decoded) else {
                return nil
            }
            return token
        } set {
            guard let value = newValue else { return }
            do {
                let genericModel = try JSONEncoder().encode(value)
                AppUser.defaults.set(genericModel, forKey: DefaultKeys.userToken)
                AppUser.defaults.synchronize()
            } catch let error {
                print(error.localizedDescription)
            }
        }
    }
 
}


