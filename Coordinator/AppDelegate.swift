//
//  AppDelegate.swift
//  Coordinator
//
//  Created by Alessandro Teixeira Lima on 26/01/20.
//  Copyright © 2020 Alessandro Teixeira Lima. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var coordinator: Coordinator?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

extension AppDelegate{
    func setRootViewController(_ viewController: UIViewController, style: RootAnimationStyle = .present) {
        guard let rootViewController = window?.rootViewController,
            let currentView = rootViewController.view.snapshotView(afterScreenUpdates: false)
                ?? rootViewController.view.snapshotView(afterScreenUpdates: true) else {
                    return
        }
        window?.addSubview(currentView)
        let height = rootViewController.view.bounds.height
        rootViewController.removeFromParent()
        rootViewController.view.removeFromSuperview()
        window?.rootViewController = viewController

        switch style {
        case .present:
            viewController.view.transform = CGAffineTransform.identity.translatedBy(x: 0, y: height)
            UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseInOut, animations: {
                viewController.view.transform = .identity
            }, completion: { _ in
                currentView.removeFromSuperview()
            })
        case .reveal:
            window?.addSubview(currentView)
            UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseInOut, animations: {
                currentView.transform = CGAffineTransform.identity.translatedBy(x: 0, y: height)
            }, completion: { _ in
                currentView.removeFromSuperview()
            })
        }
    }

}

