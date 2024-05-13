//
//  UIViewController.swift
//  Project WM
//
//  Created by  User on 11.05.2024.
//

import UIKit
extension UIViewController {
    func showError(_  title: String?, message: String) {
          let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
          let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
          alertController.addAction(okAction)
        present(alertController, animated: true,completion: nil)
    }
}
