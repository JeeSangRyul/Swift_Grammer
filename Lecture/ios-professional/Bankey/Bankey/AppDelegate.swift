//
//  AppDelegate.swift
//  Bankey
//
//  Created by 지상률 on 2022/10/04.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    //No storyboard를 할 경우 설정해줘야한다.
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.backgroundColor = .systemBackground
        window?.rootViewController = LoginViewController()
        
        
        return true
    }
}

