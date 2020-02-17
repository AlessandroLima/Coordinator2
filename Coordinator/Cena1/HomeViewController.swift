//
//  HomeViewController.swift
//  Coordinator
//
//  Created by Alessandro Teixeira Lima on 26/01/20.
//  Copyright © 2020 Alessandro Teixeira Lima. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var messageLabel: UILabel!
    
    weak var homeCoordinatorDelegate : HomeCoordinatorDelegate?
    var chieldCoordinator: Coordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func goToCena2(_ sender: Any) {
        homeCoordinatorDelegate?.wantsNavigateToCena2()
    }
    
    
    @IBAction func goToCena3(_ sender: Any) {
        
    }
    
}

extension HomeViewController{
    func setup(message: String){
        messageLabel.text = message
    }
}
