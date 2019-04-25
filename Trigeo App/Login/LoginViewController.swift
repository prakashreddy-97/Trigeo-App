//
//  ViewController.swift
//  AirShare
//
//  Created by Apple on 17/04/19.
//  Copyright © 2019 OngoFramework. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    //MARK:- IBOutlets
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var passwordLabel: UILabel!
    @IBOutlet weak var forgotButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var securityButton: UIButton!
    @IBOutlet weak var eyeImageView: UIImageView!
    
    @IBOutlet weak var emailAddressView: UIView!
    @IBOutlet weak var passwordView: UIView!
    //MARK:- Variables
    
    // ViewDidLoad Method
    override func viewDidLoad() {
        super.viewDidLoad()
        self.emailAddressView.layer.cornerRadius = 8.0
        self.emailAddressView.layer.borderWidth = 1
        self.emailAddressView.layer.borderColor = ASColors.appBlueColor.cgColor
        self.passwordView.layer.cornerRadius = 8.0
        self.passwordView.layer.borderWidth = 1
        self.passwordView.layer.borderColor = ASColors.appBlueColor.cgColor
      
    }

    //MARK:- Security Button Tapped
    @IBAction func securityButtonTapped(_ sender: UIButton) {
        if self.eyeImageView.image == ASImages.EyeIcon {
            self.passwordTextField.isSecureTextEntry = true
            self.eyeImageView.image = ASImages.EyeCancelIcon
        }else{
            self.passwordTextField.isSecureTextEntry = false
            self.eyeImageView.image = ASImages.EyeIcon
        }
    }
    
    //MARK:- Forgot Button Tapped
    @IBAction func forgotButtonTapped(_ sender: UIButton) {
    
    }
    
    //MARK:- Login Button Tapped
    @IBAction func loginButtonTapped(_ sender: UIButton) {
        self.loginValidationMethod(email: self.emailTextField.text ?? "", password: self.passwordTextField.text ?? "")
    }
    
    //MARK:- Login Validation Method
    func loginValidationMethod(email:String,password:String)  {
        if email != "" && password != "" {
           // if email.isValidEmail() {
                self.sendLoginDataToServer(email: email, password: password)
//            }else {
//                self.showAlert(withTitle: ProjectName, andMessage: Pleaseentervalidemail)
//            }
        }else {
           // self.showAlert(withTitle: ProjectName, andMessage: Pleasefilltherequiredfields)
        }
    }
    
    //MARK:- Post Login Data To Server Method
    func sendLoginDataToServer(email:String,password:String) {
        Types.tryblock({ () -> Void in
           
            
            if let registeredUserData =    self.getBackendless().userService.login(email,password:password){
                guard let registerVC = StoryBoards.mainStoryBoard.instantiateViewController(withIdentifier: "RegisterViewController") as? RegisterViewController else {
                    return
                }            }
//            print("User has logged (SYNC): \(registeredUserData)")
        },
                       
                       catchblock: { (exception) -> Void in
                        print("Server reported an error: \(exception)" )
                        self.showAlert(withTitle: "", andMessage: exception.debugDescription)
        })
    }
    
    //MARK:- Register Button Tapped
    @IBAction func registerButtonTapped(_ sender: UIButton) {
        guard let registerVC = StoryBoards.mainStoryBoard.instantiateViewController(withIdentifier: "RegisterViewController") as? RegisterViewController else {
            return
        }
        self.navigationController?.pushViewController(registerVC, animated: true)
    }
    
}


































struct StoryBoards {
    static let mainStoryBoard = UIStoryboard(name: "Main", bundle: nil)
    static let DashStoryBoard = UIStoryboard(name: "Dash", bundle: nil)
}

