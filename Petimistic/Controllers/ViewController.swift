import UIKit
import Firebase

class ViewController: UIViewController {

    @IBOutlet weak var userNameTextfield: UITextField!
    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func signIn(_ sender: Any) {
        if userNameTextfield.text != "" && emailTextfield.text != ""
            && passwordTextfield.text != "" {
            Auth.auth().createUser(withEmail: emailTextfield.text!, password: passwordTextfield.text!) {
                (authdataresult, error) in
                    if error != nil {
                        self.alertWarning(titleInput: "Uyarı", messageInput: error?.localizedDescription ?? "Hata!!!")
                    } else {
                        self.performSegue(withIdentifier: "toFeedVC", sender: nil)
                    }
                
            }
            
        } else {
            alertWarning(titleInput: "Uyarı", messageInput: "Username, E-mail ve Password boş bırakılamaz")
        }
    }
    
    @IBAction func logIn(_ sender: Any) {
        if userNameTextfield.text != "" && emailTextfield.text != ""
            && passwordTextfield.text != "" {
            Auth.auth().signIn(withEmail: emailTextfield.text!, password: passwordTextfield.text!) {
                (authdataresult, error) in
                    if error != nil {
                        self.alertWarning(titleInput: "Uyarı", messageInput: error?.localizedDescription ?? "Kayıt Olun")
                    } else {
                        self.performSegue(withIdentifier: "toFeedVC", sender: nil)
                    }
                
            }
            
        } else {
            alertWarning(titleInput: "Uyarı", messageInput: "Username, E-mail ve Password boş bırakılamaz")
        }
    }
    
    func alertWarning(titleInput: String, messageInput: String){
        let alert = UIAlertController(title: titleInput, message: messageInput, preferredStyle: UIAlertController.Style.alert)
        let ok = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default)
        alert.addAction(ok)
        self.present(alert, animated: true)
    }
}

