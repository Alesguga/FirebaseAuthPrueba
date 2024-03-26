//
//  AuthViewController.swift
//  FirebasePrueba
//
//  Created by ales on 25/3/24.
//

import UIKit
import FirebaseAuth
import Firebase
import FirebaseAnalyticsSwift

class AuthViewController: UIViewController {

    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var emailTF: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Pagina de auntenticación"
        // Do any additional setup after loading the view.
    }

    @IBAction func signUpButtonAction(_ sender: Any) {
        if let email = emailTF.text, let password = passwordTF.text{
            Auth.auth().createUser(withEmail: email, password: password){
            (result,error)in
                if let result = result, error == nil{
                    self .navigationController?
                         .pushViewController(HomeViewController(email:
                         result.user.email!, provider: .basic), animated: true)
                }else{
                    let alertController = UIAlertController(title: "Error",
                    message:
                    "Se ha producido un error registrando el usuario", preferredStyle: .alert)
                    alertController.addAction(UIAlertAction(title: "Aceptar", style: .default))
                    self.present(alertController, animated: true, completion: nil)
                }
            }
        }
    }
    
    @IBAction func loginButtonAction(_ sender: Any) {
    }
}

