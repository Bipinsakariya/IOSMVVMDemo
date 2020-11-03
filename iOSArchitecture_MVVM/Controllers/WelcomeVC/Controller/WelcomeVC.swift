//
//  WelcomeVC.swift
//  iOSArchitecture_MVVM
//
//  Created by MyMac on 05/05/20.
//  Copyright © 2020 Surjeet Singh. All rights reserved.
//

import UIKit

class WelcomeVC: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func btnGetStartedAction(_ sender: Any) {
        let signUpVC = self.storyboard?.instantiateViewController(withIdentifier: SocialSignUpVC.className) as! SocialSignUpVC
        signUpVC.isForLogin = false //false for signup
        let navigation = UINavigationController(rootViewController: signUpVC)
        navigation.modalPresentationStyle = .overCurrentContext
        navigation.modalTransitionStyle = .crossDissolve
        self.present(navigation, animated: true, completion: nil)
    }
            
    @IBAction func btnLoginAction(_ sender: Any) {
        let signUpVC = self.storyboard?.instantiateViewController(withIdentifier: SocialSignUpVC.className) as! SocialSignUpVC
        signUpVC.isForLogin = true //false for signup
        let navigation = UINavigationController(rootViewController: signUpVC)
        navigation.modalPresentationStyle = .overCurrentContext
        navigation.modalTransitionStyle = .crossDissolve
        self.present(navigation, animated: true, completion: nil)
    }
}
