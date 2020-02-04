//
//  UIView+Extension.swift
//  Coordinator
//
//  Created by Resource on 03/02/20.
//  Copyright © 2020 Alessandro Teixeira Lima. All rights reserved.
//

import UIKit

extension UIView {
    static func instantiate(view: String? = nil,
                            from bundle: Bundle? = Bundle.main) -> Self {

        let viewController = view ?? String(describing: Self.self)

        let nib = UINib(nibName: viewController, bundle: bundle).instantiate(withOwner: nil, options: nil)[0] as! Self

        return nib
    }
}
