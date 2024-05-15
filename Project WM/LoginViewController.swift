import UIKit

class LoginViewController: UIViewController {
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var usernameTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Thiết lập các thuộc tính cho textField
        usernameTextField.layer.borderColor = UIColor.purple.cgColor
        usernameTextField.layer.borderWidth = 3
        usernameTextField.layer.cornerRadius = 15.0
        passwordTextField.layer.borderColor = UIColor.purple.cgColor
        passwordTextField.layer.borderWidth = 3
        passwordTextField.layer.cornerRadius = 15.0
        
        
        // Tạo bảng user nếu chưa có
        SQLiteCommands.createUserTable()
        // Debugging: In ra giá trị của text fields
           print("Username: \(usernameTextField.text ?? "nil")")
           print("Password: \(passwordTextField.text ?? "nil")")
    }

    @IBAction func signInButton(_ sender: UIButton) {
        guard let username = usernameTextField.text, !username.isEmpty,
              let password = passwordTextField.text, !password.isEmpty else {
            showAlert(withTitle: "Error", message: "Please fill in all fields")
            return
        }

        if SQLiteCommands.verifyUser(username: username, password: password) {
          //  performSegue(withIdentifier: "home", sender: nil)
            navigateToTabBarController()
        } else {
            showAlert(withTitle: "Error", message: "Invalid username or password")
        }
    }
    func navigateToTabBarController() {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            if let tabBarController = storyboard.instantiateViewController(withIdentifier: "MainTabBarController") as? UITabBarController {
                tabBarController.modalPresentationStyle = .fullScreen
                present(tabBarController, animated: true, completion: nil)
            }
        }


    func showAlert(withTitle title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func signUpButton(_ sender: UIButton) {
        performSegue(withIdentifier: "signUp", sender: nil)
    }
}

