//
//  UIViewControllerExtension.swift
//  GeckoApp
//
//  Created by Denis Vásquez on 8/27/20.
//  Copyright © 2020 Denis Vásquez. All rights reserved.
//

import Foundation
import UIKit

/// Allows handling alerts in views
extension UIViewController {
    func alerts(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
