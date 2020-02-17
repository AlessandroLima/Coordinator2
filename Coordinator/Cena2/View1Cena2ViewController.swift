//
//  View1Cena2.swift
//  Coordinator
//
//  Created by Alessandro Teixeira Lima on 26/01/20.
//  Copyright © 2020 Alessandro Teixeira Lima. All rights reserved.
//

import UIKit

class View1Cena2ViewController: UIViewController {
    
    
    @IBOutlet weak var messageTextField: UITextField!
    
    var changeLabel: ((String) -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func changeButton(_ sender: Any) {
        if let changeLabel = changeLabel{
            changeLabel("Mensagem: \(messageTextField.text)")
        }
    }
    
    

   
}
