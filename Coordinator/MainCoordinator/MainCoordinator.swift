//
//  MainCoordinator.swift
//  Coordinator
//
//  Created by Resource on 28/01/20.
//  Copyright © 2020 Alessandro Teixeira Lima. All rights reserved.
//


import UIKit

final class MainCoordinator: ParentCoordinator {
    var navigationController: UINavigationController?
    var currentViewController: UIViewController?
    var childCoordinator: Coordinator?
    
    func start() -> UIViewController {
        currentViewController = createMainViewController()
        return currentViewController!
    }
}

// MARK: Helpers
extension MainCoordinator {
    private func createMainViewController() -> UIViewController {
        let mainVc = HomeViewController.instantiate(from: "Cena1Storyboard")
        mainVc.coordinatorDelegate = self
        return mainVc
    }
}

extension MainCoordinator: MainCoordinatorDelegate {
    func wantsToNavigateToHome() {
        childCoordinator = HomeCoordinator()
        childCoordinator?.start(with: .push(inNavigation: navigationController))
    }
}
