import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let env = NSProcessInfo.processInfo().environment
        usernameField.text = env["GITHUB_USER"]
        passwordField.text = env["GITHUB_PASS"]
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        usernameField.becomeFirstResponder()
    }
    
    @IBAction func cancel(sender: AnyObject) {
        dismissViewControllerAnimated(true) { }
    }
    
    @IBAction func moveToPassword() {
        passwordField.becomeFirstResponder()
    }
    
    @IBAction func logIn() {
        guard let username = usernameField.text else {
            usernameField.becomeFirstResponder()
            return
        }
        guard let password = passwordField.text else {
            passwordField.becomeFirstResponder()
            return
        }
        
        GithubAPI.logIn(username: username, password: password)
        dismissViewControllerAnimated(true) { }
    }
}
