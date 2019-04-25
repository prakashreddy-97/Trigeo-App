//
//  RegisterViewController.swift
//
//
//  Created by Apple on 18/04/19.
//  Copyright © 2019 OngoFramework. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {
    
    //MARK:- OUTLETS
    @IBOutlet weak var businessNameTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var mobileNumberTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var termsAndConditionButton: UIButton!
    @IBOutlet weak var businessNameLabel: UILabel!
    @IBOutlet weak var nameTopConstaint: NSLayoutConstraint!
    @IBOutlet weak var checkImageView: UIImageView!
    @IBOutlet weak var eyeImageView: UIImageView!
    
    //MARK:- View Controller Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.registerUser()
    }
    
    func registerUser() {
        
    }
    
    func loginUser() {
        
        Types.tryblock({ () -> Void in
            
            let user = self.getBackendless().userService.login("yernagulamahesh@gmail.com", password: "iAmWatchingU")
            print("User has been logged in (SYNC): \(user?.getProperty("phoneNumber"))")
        },
                       
                       catchblock: { (exception) -> Void in
                        print("Server reported an error: \(exception as! Fault)")
        })
    }
    
    func personalSelectionTextFieldsValidation() {
        if self.nameTextField.text?.isEmpty ?? true{
            self.showAlert(withTitle: "", andMessage: "Please Enter Your Name")
            return
        }else if self.mobileNumberTextField.text?.isEmpty ?? true{
            self.showAlert(withTitle: "", andMessage: "Please Enter Your Mobile Number")
            return
        }else if (self.mobileNumberTextField.text?.count ?? 0) < 10 {
            self.showAlert(withTitle: "", andMessage: "Please Enter Your 10 Digit Mobile Number")
            return
        }else if self.emailTextField.text?.isEmpty ?? true{
            self.showAlert(withTitle: "", andMessage: "Please Enter Your Email Address")
            return
        }else if !self.isValidEmail(testStr: self.emailTextField.text ?? "") {
            self.showAlert(withTitle: "", andMessage: "Please Enter Valid Email Address")
            return
        }else if self.passwordTextField.text?.isEmpty ?? true{
            self.showAlert(withTitle: "", andMessage: "Please Enter Your Password")
            return
        }
        else{
            self.sendDataToServerMethod(name: self.nameTextField.text ?? "", email: self.emailTextField.text ?? "", pasword: self.passwordTextField.text ?? "", mobile: self.mobileNumberTextField.text ?? "")
        }
        
    }
    
    //MARK:- Send Data To Server Method
    func sendDataToServerMethod(name:String,email:String,pasword:String,mobile:String)  {
        Types.tryblock({ () -> Void in
            let user = BackendlessUser()
            user.email = email as NSString
            user.password = pasword as NSString
            user.name = name as NSString
            let registeredUserData =    self.getBackendless().userService.register(user)
            print("User has been logged in (SYNC): \(registeredUserData)")
        },
                       
                       catchblock: { (exception) -> Void in
                        print("Server reported an error: \(exception)" )
                        self.showAlert(withTitle: "", andMessage: exception.debugDescription)
        })
    }
    
   
    
    func isValidEmail(testStr:String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: testStr)
    }
    
    //MARK:- Create Account Button Action
    @IBAction func createAccountButtonAction(_ sender: Any) {
        
    }
    
    //MARK:- Hide Unhide Button Action
    @IBAction func hideUnhidePasswordBtnAction(_ sender: UIButton) {
        if self.eyeImageView.image == ASImages.EyeIcon {
            self.passwordTextField.isSecureTextEntry = true
            self.eyeImageView.image = ASImages.EyeCancelIcon
        }else{
            self.passwordTextField.isSecureTextEntry = false
            self.eyeImageView.image = ASImages.EyeIcon
        }
    }

    //MARK:- Terms and Conditions Button Action
    @IBAction func termsAndConditionsBtnAction(_ sender: Any) {
      /* if self.checkImageView.image == ASImages.UnCheckMark {
            self.checkImageView.image = ASImages.CheckMark
        }else{
            self.checkImageView.image = ASImages.UnCheckMark
        } */
    }
    
    //MARK:- login Button Action
    @IBAction func loginButtonAction(_ sender: Any) {
      self.navigationController?.popViewController(animated: true)
    }
}

//MARK:- TextField Delegate Methods
extension RegisterViewController:UITextFieldDelegate{
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField == self.mobileNumberTextField{
            if range.location > 9{
                textField.resignFirstResponder()
                return false
            }
            return true
            
        }
        return true
    }
}

enum segmentSelection:Int{
    case Business = 0,Personal
}
