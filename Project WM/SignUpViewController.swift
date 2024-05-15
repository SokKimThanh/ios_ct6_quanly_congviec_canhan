import UIKit

class SignUpViewController: UIViewController {
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var confirmpasswordTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Thiết lập các thuộc tính cho text field
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
        guard let username = usernameTextField.text, !username.isEmpty,
              let password = passwordTextField.text, !password.isEmpty,
              let confirmPassword = confirmpasswordTextField.text, !confirmPassword.isEmpty else {
            showAlert(withTitle: "Error", message: "Please fill in all fields")
            return
        }

        guard password == confirmPassword else {
            showAlert(withTitle: "Error", message: "Passwords do not match")
            return
        }

        if SQLiteCommands.insertUser(username: username, password: password) {
            showAlert(withTitle: "Success", message: "User registered successfully") {
                self.dismiss(animated: true, completion: nil)
            }
        } else {
            showAlert(withTitle: "Error", message: "Username already exists")
        }
    }

    func showAlert(withTitle title: String, message: String, completion: (() -> Void)? = nil) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            completion?()
        }
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }

    @IBAction func signInButton(_ sender: UIButton) {
        performSegue(withIdentifier: "signIn", sender: nil)
    }
}


