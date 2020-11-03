//
//  BirthdayVC.swift
//  iOSArchitecture_MVVM
//
//  Created by MyMac on 05/05/20.
//  Copyright © 2020 Surjeet Singh. All rights reserved.
//

import UIKit

class BirthdayVC: BaseViewController {

    @IBOutlet weak var lblInfo: UILabel!
    @IBOutlet weak var txtDay: UITextField!
    @IBOutlet weak var txtMonth: UITextField!
    @IBOutlet weak var txtYear: UITextField!
    @IBOutlet weak var lblError: UILabel!
    @IBOutlet weak var btnContinue: UIButton!
    var UserInfoDict = KeyValue()
    var userModel : User?
    
    lazy var viewModel: BirthdayModel = {
        let obj = BirthdayModel(userService: UserService())
        self.baseVwModel = obj
        return obj
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupScreenUI()
        // Do any additional setup after loading the view.
    }
    
    func setupScreenUI() {
        
        if let name = self.UserInfoDict[DefaultKeys.Firstname] as? String {
            self.lblInfo.text = "Hey \(name), when is your birthday?"
        }
                
        txtDay.delegate = self
        txtMonth.delegate = self
        txtYear.delegate = self
        self.hideNavigationBar(true, animated: true)
        self.view.layoutIfNeeded()
        lblError.isHidden = true
        let placeholderColorAttribute = [NSAttributedString.Key.foregroundColor: UIColor.white.withAlphaComponent(0.5)]
        txtDay.attributedPlaceholder = NSAttributedString(string: ConstantKeys.DD,
                                                          attributes: placeholderColorAttribute)
        txtMonth.attributedPlaceholder = NSAttributedString(string: ConstantKeys.MM,
        attributes: placeholderColorAttribute)
        txtYear.attributedPlaceholder = NSAttributedString(string: ConstantKeys.YYYY,
        attributes: placeholderColorAttribute)
    }
    
    @IBAction func btnContinueClick(_ sender: Any) {

        let validity = self.viewModel.validateBirthday(self.txtDay.text ?? "", mm: self.txtMonth.text ?? "", yyyy: self.txtYear.text ?? "")
        lblError.isHidden = validity.isValid
        lblError.text = validity.error
        if (validity.isValid) {
            
            self.txtDay.resignFirstResponder()
            self.txtYear.resignFirstResponder()
            self.txtMonth.resignFirstResponder()
            
            let socialType = UserInfoDict[DefaultKeys.SocialProvider] as! String
            if socialType == SocialType.Snapchat {
                //procee
                let addPhotoBitmojiVC = self.storyboard?.instantiateViewController(withIdentifier: AddPhotoBitmojiVC.className) as! AddPhotoBitmojiVC
                addPhotoBitmojiVC.bitmojiURL = UserInfoDict[DefaultKeys.Bitmoji] as! String
                addPhotoBitmojiVC.userModel = self.userModel
                self.navigationController?.show(addPhotoBitmojiVC, sender: self)
            }
            else {
                //procee
                let addPhotoVC = self.storyboard?.instantiateViewController(withIdentifier: AddPhotoVC.className) as! AddPhotoVC
                addPhotoVC.userModel = self.userModel
                self.navigationController?.show(addPhotoVC, sender: self)
            }
        }
    }
}

extension BirthdayVC: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        // get the current text, or use an empty string if that failed
        let currentText = textField.text ?? ""

        // attempt to read the range they are trying to change, or exit if we can't
        guard let stringRange = Range(range, in: currentText) else { return false }

        // add their new text to the existing text
        let updatedText = currentText.replacingCharacters(in: stringRange, with: string)

        if (textField == self.txtYear) {
            return updatedText.count <= 4
        }
        return updatedText.count <= 2
    }
}
