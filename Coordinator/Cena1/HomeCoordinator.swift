//
//  View1Cena1Coordinator.swift
//  Coordinator
//
//  Created by Resource on 03/02/20.
//  Copyright © 2020 Alessandro Teixeira Lima. All rights reserved.
//

import Foundation
import UIKit

final class HomeCoordinator: Coordinator {
    
    var navigationController: UINavigationController?
    var currentViewController: UIViewController?
    var childCoordinator: Coordinator?

    func start() -> UIViewController {
        currentViewController = createHomeViewController()
        return currentViewController!
    }
}

extension HomeCoordinator {
    private func createHomeViewController() -> HomeViewController {
        let homeViewController = HomeViewController.instantiate(viewController: "HomeViewController", from: "Cena1StoryBoard")
        return homeViewController
    }
}

extension HomeCoordinator: HomeCoordinatorDelegate {
    func wantsNavigateToCena2() {
        let  cena2Coordinator = Cena2Coordinator()
        cena2Coordinator.start(with: .push(inNavigation: navigationController))
        childCoordinator = cena2Coordinator
       
    }

}
