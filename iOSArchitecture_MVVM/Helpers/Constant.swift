//
//  Constant.swift
//  iOSArchitecture
//
//  Created by Amit Shukla on 05/07/18.
//  Copyright © 2018 smartData. All rights reserved.
//

import Foundation
import UIKit


typealias KeyValue  =  [String : Any]
typealias ResponseBlock = ((_ isSuccess: Bool, _ message: String) -> Void)

struct AppKeys {
    static let kGoogleClientID = "667053744720-0pi3l8gaf1bsnt4e0d0qmqp5s1b4658j.apps.googleusercontent.com"
}


struct AppColor {
    static let backgroundColor       =     UIColor.init("#2E2E39")
    static let cellBackgroundColor   =     UIColor.init("#3B3B4B")
    static let yellowColor           =     UIColor.init("#FCDA6A")
    static let whiteColor            =     UIColor.init("#FFFFFF")
    static let blackColor            =     UIColor.init("#1F1F27")
    static let grayColor             =     UIColor.init("#424242")
    static let blueColor             =     UIColor.init("#191434")
    static let orangeColor           =     UIColor.orange
    static let textfieldColor        =     UIColor.init("#302C49")
    static let greenColor            =     UIColor.init("#41DAA8")
}

struct AlertMessage {
    
    static let invalidURL               = "Invalid server url"
    static let lostInternet             = "It seems you are offline, Please check your Internet connection."
    static let invalidEmail             = "Please enter a valid email address"
    static let invalidPassword          = "Oops, the password need to be between 6-24 characters."
    static let invalidPhoneNumber       = "Oops! That is an invalid number. Try again."
    static let validNumber              = "Enter Valid Number"
    static let alreadyTakenUsername     = "Oops, looks like that username is \nalready taken."
    static let limitUsername            = "Oops, the username can't exceed 18 characters."
    static let emptyUsername            = "Please enter username."
    static let emptyPassword            = "Please enter password."
    static let limitPassword            = "Oops, the password must be greater than 6 characters."
    static let emptyConPassword         = "Please enter confirm password."
    static let limitConPassword         = "Oops, the confirm password must be greater than 6 characters."
    static let passwordMismatch         = "Oops, those passwords don't match."
    static let noCameraAccess           = "Unable to access the Camera";
    static let noGalleryAccess          = "Unable to access the Gallery";
    static let noPhoto                  = "To enable access, go to Settings > Privacy > Photos and turn on Photos access for this app.";
    static let noCamera                 = "To enable access, go to Settings > Privacy > Camera and turn on Camera access for this app.";
    static let futureDate               = "Future date is not allowed."
    static let invalidDate              = "Please enter valid date."
    static let emptyDate                = "Please enter date."
    static let emptyEmail               = "Please enter email address."
    static let emailExists              = "User with this email already exists."
    static let usernameExists           = "User with this username already exists."
    static let accountCreation          = "Your account has been created successfully. \nWe have sent an email verification on your email id."
    static let loginMsg                 = "Successfully Login."

}

struct DefaultKeys {
    static let isAutoLogin              = "isAutoLogin"
    static let session                  = "session"
    static let userToken                = "token"
    static let userid                   = "userID"
    static let pushToken                = "pushToken"
    static let SocialProvider           = "social_provider"
    static let SocialID                 = "social_id"
    static let Email                    = "email"
    static let Firstname                = "firstname"
    static let Lastname                 = "lastname"
    static let isForLogin               = "isForLogin"
    static let Bitmoji                  = "bitmoji"
}

struct Storyboards {
    static let main                     = "Main"
    static let home                     = "Home"
    static let socialSignUp             = "SocialSignUp"
}

struct AppFont {
    static let MuseoSansCyrl_900 = "MuseoSansCyrl-900"
    static let MuseoSansCyrl_500 = "MuseoSansCyrl-500"
    static let MuseoSansCyrl_700 = "MuseoSansCyrl-700"
    
    static func MuseoSansCyrl_900(fontSize: CGFloat) -> UIFont {
        return UIFont(name:self.MuseoSansCyrl_900 , size: fontSize)!
    }
    
    static func MuseoSansCyrl_500(fontSize: CGFloat) -> UIFont {
       return UIFont(name:self.MuseoSansCyrl_500 , size: fontSize)!
    }
   
    static func MuseoSansCyrl_700(fontSize: CGFloat) -> UIFont {
       return UIFont(name:self.MuseoSansCyrl_700 , size: fontSize)!
    }
}

struct AppUser {
     static let defaults            =      UserDefaults.standard
     static let shared              =      UIApplication.shared.delegate as! AppDelegate
}

struct Identifiers {
    static let mainNavVC            = "mainNavigationVC"
}

struct Segues {
    static let otpSegue             = "otpSegue"
    static let usernameSegue        = "usernameSegue"
    static let webViewSegue         = "showWebViewSegue"
    static let photoSegue           = "uploadPhotoSegue"
    static let forgotPassword       = "forgotPasswordSegue"
    static let verifyTempPassword       = "verifyTempPasswordSegue"
    static let generateNewPassword       = "generateNewPasswordSegue"
}

struct ConstantKeys {
    static let appName                  = "Lotta Wins"
    static let camera                   = "Camera"
    static let photo                    = "Photo"
    static let cancel                   = "Cancel"
    static let referImage               = "ReferImage"
    static let referName                = "ReferName"
    static let fieldName                = "ReferfieldName"
    static let showEye                  = "showEye"
    static let deviceType               = "iOS"
    static let DD                       = "DD"
    static let MM                       = "MM"
    static let YYYY                     = "YYYY"
    static let dateFormat               = "dd-MM-yyyy"
}

struct SocialType {
    static let Apple         = "Apple"
    static let Google        = "Google"
    static let Snapchat      = "Snapchat"
}
