//
//  View1Cena1Coordinator.swift
//  Coordinator
//
//  Created by Resource on 03/02/20.
//  Copyright © 2020 Alessandro Teixeira Lima. All rights reserved.
//

import Foundation

import Foundation
import UIKit

final class HomeCoordinator: Coordinator {
    
    var navigationController: UINavigationController?
    var currentViewController: UIViewController?
    var childCoordinators: Coordinator?

    func start() -> UIViewController {
        currentViewController = createHomeViewController()
        return currentViewController!
    }
}

extension HomeCoordinator {
    private func createHomeViewController() -> HomeViewController {
        let homeViewController = HomeViewController.instantiate()
        //let viewModel = HomeViewModel()
        //viewModel.coordinatorDelegate = self
        //homeViewController.viewModel = viewModel
        return homeViewController
    }

}

