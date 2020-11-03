//
//  EnterEmailVC.swift
//  iOSArchitecture_MVVM
//
//  Created by MyMac on 08/05/20.
//  Copyright © 2020 Surjeet Singh. All rights reserved.
//

import UIKit

class EnterEmailVC: BaseViewController {

    @IBOutlet weak var emailTF: CustomTextField!
    @IBOutlet weak var errorView: UIView!
    @IBOutlet weak var errorLabel: UILabel!
    var UserInfoDict = KeyValue()
    
    lazy var viewModel: EnterEmailVM = {
        let obj = EnterEmailVM(userService: UserService())
        self.baseVwModel = obj
        return obj
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnContinueAction(_ sender: Any) {
        self.emailTF.resignFirstResponder()
        let validity = self.viewModel.validateEmail(self.emailTF.text ?? "")
        if validity.isValid {
            errorView.isHidden = true
            UserInfoDict.updateValue(self.emailTF.text ?? "", forKey: DefaultKeys.Email)
                        
            self.viewModel.socialSignup(social_provider: UserInfoDict[DefaultKeys.SocialProvider] as! String, social_id: UserInfoDict[DefaultKeys.SocialID] as! String, email: self.emailTF.text ?? "") { (isSuccess, message) in
                
                if isSuccess {
                    self.navigateToBirthdayVC()
                }
                else {
                    let configAlert: AlertUI = ("Alert", message)
                    //UIAlertController.showAlert(configAlert)
                    UIAlertController.showActionSheet(configAlert, sender: self, actions: AlertAction.okk) { (action) in
                        self.navigationController?.popViewController(animated: true)
                    }
                }
            }
        }
        else {
            errorView.isHidden = false
            errorLabel.text = validity.error
        }
    }
   
    private func navigateToBirthdayVC() {
        let birthdayVC = self.storyboard?.instantiateViewController(withIdentifier: BirthdayVC.className) as! BirthdayVC
        birthdayVC.UserInfoDict = UserInfoDict
        self.navigationController?.show(birthdayVC, sender: self)
    }
    
}
