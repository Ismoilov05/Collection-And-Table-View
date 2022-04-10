//
//  AppDelegate.swift
//  Collection And Table View
//
//  Created by Abdulloh Murodilloyev on 24/03/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
       
        window = UIWindow()
        let vc = UINavigationController(rootViewController: MainVC(nibName: "MainVC", bundle: nil))
        window?.rootViewController = vc
        window?.makeKeyAndVisible()
        
        return true
    }



}

