//
//  NotificationVC.swift
//  iOSArchitecture_MVVM
//
//  Created by MyMac on 06/05/20.
//  Copyright © 2020 Surjeet Singh. All rights reserved.
//

import UIKit

class NotificationVC: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnEnableNotificationAction(_ sender: Any) {
        
        AppUser.shared.registerForPushNotifications()
    }
    
    @IBAction func btnSkipAction(_ sender: Any) {
        let LocationVC = self.storyboard?.instantiateViewController(withIdentifier: "LocationVC") as! LocationVC
        self.navigationController?.pushViewController(LocationVC, animated: true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
