//
//  LoginViewController.swift
//  ChitChaT
//
//  Created by Disha Limbani on 2024-01-23.
//

import UIKit
//import FirebaseCore
//import FirebaseFirestore
import FirebaseAuth

class LoginViewController: UIViewController {

    @IBOutlet weak var passwordTextfield: UITextField!
    @IBOutlet weak var emailTextfield: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func onClickBtnLogin(_ sender: UIButton) {
        if let email = emailTextfield.text, let password = passwordTextfield.text {
            Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
              guard let strongSelf = self else { return }
                if let e = error {
                    print(e)
                }else{
                    self?.performSegue(withIdentifier: "LoginToChat", sender: self)
                }
               
            }
        }
       
    }
}
