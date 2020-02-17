//
//  HomeViewController.swift
//  Coordinator
//
//  Created by Alessandro Teixeira Lima on 26/01/20.
//  Copyright © 2020 Alessandro Teixeira Lima. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    let homeCoordinator = HomeCoordinator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        homeCoordinator.start()
        homeCoordinator.navigationController = self.navigationController
    }
    
    @IBAction func goToCena2(_ sender: Any) {
        homeCoordinator.wantsNavigateToCena2()
    }
    
    
    @IBAction func goToCena3(_ sender: Any) {
    
    }
    
}
