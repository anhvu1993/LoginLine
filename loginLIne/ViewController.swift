//
//  ViewController.swift
//  loginLIne
//
//  Created by Bui Van Tuan on 7/4/19.
//  Copyright © 2019 Nguyen khac vu. All rights reserved.
//

import UIKit
import LineSDK

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        LineSDKLogin.sharedInstance().delegate = self
    }

    @IBAction func onLoginLineButtonClicked(_ sender: Any) {
        LineSDKLogin.sharedInstance().start()
    }
    
    @IBAction func offLoginLineClick(_ sender: Any) {
       LineSDKAPILogoutCompletion.self
    }
    
}

extension ViewController: LineSDKLoginDelegate {
    func didLogin(_ login: LineSDKLogin, credential: LineSDKCredential?, profile: LineSDKProfile?, error: Error?) {
        if error != nil {
            print("error \(error?.localizedDescription)")
        } else {
            let accessToken = credential?.accessToken?.accessToken ?? ""
            let userId = profile?.userID ?? ""
            print(userId)
            let displayName = profile?.displayName ?? ""
            print(displayName)
            let statusMessage = profile?.statusMessage ?? ""
            let pictureUrl = profile?.pictureURL ?? URL(string: "")
        }
    }
}
