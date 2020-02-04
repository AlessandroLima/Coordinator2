//
//  Coordinator.swift
//  Coordinator
//
//  Created by Alessandro Teixeira Lima on 26/01/20.
//  Copyright © 2020 Alessandro Teixeira Lima. All rights reserved.
//

import UIKit

enum RootAnimationStyle {
    case reveal, present
}

enum PresentationType {
    case push(inNavigation: UINavigationController?)
    case modal(inViewController: UIViewController)
    case root(animationStyle: RootAnimationStyle)
}

protocol Coordinator: AnyObject {
    var navigationController: UINavigationController? { get set }
    var currentViewController: UIViewController? { get set }
    func start() -> UIViewController
    func start(with presentationType: PresentationType)
}

extension Coordinator {
    func start(with presentationType: PresentationType) {
        self.currentViewController = start()
        guard let currentViewController = self.currentViewController else {
            fatalError("You need to setup current view controller")
        }
        switch presentationType {
        case .push(inNavigation: let navigationController):
            self.navigationController = navigationController
            self.navigationController?.pushViewController(currentViewController,
                                                          animated: true)
        case .modal(inViewController: let parentViewController):
            navigationController = UINavigationController(rootViewController: currentViewController)
            parentViewController.present(navigationController!,
                                         animated: true)
        
        case .root(animationStyle: let style):
            navigationController = UINavigationController(rootViewController: currentViewController)
            (UIApplication.shared.delegate as? AppDelegate)?.setRootViewController(navigationController!, style: style)
            debugPrint("Change root vc")
        }
    }
}

protocol ParentCoordinator: Coordinator {
    var childCoordinator: Coordinator? { get set }
}
