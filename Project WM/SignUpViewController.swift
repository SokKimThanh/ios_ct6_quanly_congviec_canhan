//
//  SignUpViewController.swift
//  Project WM
//
//  Created by  vovanso on 09.05.2024.
//

import UIKit

class SignUpViewController: UIViewController {
    
    @IBOutlet weak var usernameTextField: UITextField!
    
    @IBOutlet weak var confirmpasswordTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Thiet lap cac thuoc tinh cho text field
        usernameTextField.layer.borderColor = UIColor.black.cgColor
        usernameTextField.layer.borderWidth = 3
        usernameTextField.layer.cornerRadius = 14.0
        passwordTextField.layer.borderColor = UIColor.black.cgColor
        passwordTextField.layer.borderWidth = 3
        passwordTextField.isSecureTextEntry = true
        passwordTextField.layer.cornerRadius = 14.0
        confirmpasswordTextField.layer.borderColor = UIColor.black.cgColor
        confirmpasswordTextField.layer.borderWidth = 3
        confirmpasswordTextField.layer.cornerRadius = 14.0
        confirmpasswordTextField.isSecureTextEntry = true
        
        
        
        
    }
    
    @IBAction func signUpButton(_ sender: UIButton) {
        func showAlert(withTitle title: String, message: String) {
              let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
              let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
              alertController.addAction(okAction)
              present(alertController, animated: true, completion: nil)
        }
        // kiem tra tai khoan va mat khau
        guard let username = usernameTextField.text , !username.isEmpty else{
            showAlert(withTitle: "Error", message: "Enter username please")
            return
        }
        guard let password = usernameTextField.text , !password.isEmpty else{
            showAlert(withTitle: "Error", message: "Enter password please")
            return
        }
        guard let confirmpassword = confirmpasswordTextField.text , !confirmpassword.isEmpty else {
            showAlert(withTitle: "Error", message: "Please confirm your password")
            return
        }
        // Luu tai khoan nguoi dung vao co so du lieu
        let userDefault = UserDefaults.standard
        if let _ = userDefault.string(forKey: username){
            showAlert(withTitle: "Warming", message: "Username already exists")
            return
        }
        else {
            userDefault.set(password, forKey: username)
            // Hien thi thong bao dang ky thanh cong
            showAlert(withTitle: "Notifitions", message: "Sign Up Success")
            usernameTextField.text = ""
            passwordTextField.text = ""
            confirmpasswordTextField.text = ""
            
        }
      
    }
    
    @IBAction func signInButton(_ sender: UIButton) {
        performSegue(withIdentifier: "signIn", sender: nil)
    }
    
    
}
