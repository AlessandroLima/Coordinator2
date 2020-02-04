//
//  Cena2Coordinator.swift
//  Coordinator
//
//  Created by Resource on 04/02/20.
//  Copyright © 2020 Alessandro Teixeira Lima. All rights reserved.
//

import UIKit

final class Cena2Coordinator: Coordinator{
    
    var navigationController: UINavigationController?
    var currentViewController: UIViewController?
    
    func start() -> UIViewController {
        currentViewController = createCena2ViewController()
        return currentViewController!
    }
     
}

extension Cena2Coordinator{
    
     private func createCena2ViewController() -> View1Cena2ViewController {
        let view1Cena2ViewController = View1Cena2ViewController.instantiate()
        return view1Cena2ViewController
     }
    
}
