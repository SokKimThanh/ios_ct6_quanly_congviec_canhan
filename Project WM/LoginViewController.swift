//
//  LoginViewController.swift
//  Project WM
//
//  Created by  vovanso on 09.05.2024.
//

import UIKit
class LoginViewController : UIViewController {
    @IBOutlet weak var passwordTextField: UITextField!
  
    @IBOutlet weak var usernameTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Thiet lap cac thuoc tinh cho textField
        usernameTextField.layer.borderColor = UIColor.purple.cgColor
        usernameTextField.layer.borderWidth = 3
        usernameTextField.layer.cornerRadius = 15.0
        passwordTextField.layer.borderColor = UIColor.purple.cgColor
        passwordTextField.layer.borderWidth = 3
        passwordTextField.layer.cornerRadius = 15.0
        
        
    }
  
    @IBAction func signInButton(_ sender: UIButton) {
        // kiem tra tai khoan va mat khau
//        guard let username = usernameTextField.text! , !username.isEmpty else{
//
//        }
        print("Called")
    }
    func showAlert (withTitle title:String,message:String)
    {
        
    }
}
