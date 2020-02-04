//
//  UIViewController + Extension.swift
//  Coordinator
//
//  Created by Resource on 28/01/20.
//  Copyright © 2020 Alessandro Teixeira Lima. All rights reserved.
//

import UIKit

extension UIViewController {
//    var mainMenuViewController: MainViewController? {
//        return parent as? MainViewController
//    }

    // Workaround while we don't have coordinator system in the entire application
    var mainCoordinator: MainCoordinator? {
        return (UIApplication.shared.delegate as? AppDelegate)?.coordinator as? MainCoordinator
    }

    var currentCoordinator: Coordinator? {
        return (UIApplication.shared.delegate as? AppDelegate)?.coordinator
    }

    var appDelegate: AppDelegate? {
        return UIApplication.shared.delegate as? AppDelegate
    }

    static func instantiate(viewController: String? = nil,
                            from storyboard: String? = nil) -> Self {
        let viewController = viewController ?? String(describing: Self.self)
        let storyboard = storyboard ?? String(describing: Self.self)

        let vc = UIStoryboard(name: storyboard,
                              bundle: Bundle.main)
        guard let vcInstance = vc.instantiateViewController(withIdentifier: viewController) as? Self else {
            fatalError("Invalid instance of invalid ViewController name")
        }
        return vcInstance
    }
}

