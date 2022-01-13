//
//  RegisterVC.swift
//  E3mly khedma
//
//  Created by Ahmed Ashraf on 11/01/2022.
//

import UIKit

class RegisterVC: UIViewController {
    //MARK: -Constanse
    
    //MARK: -Outlets
    @IBOutlet weak var contanirView: UIView!{
        didSet{
            contanirView.layer.cornerRadius = 10
        }
    }
    @IBOutlet weak var viewFirstName: TextFieldNib!
    @IBOutlet weak var viewLastName: TextFieldNib!
    @IBOutlet weak var viewEmail: TextFieldNib!
    @IBOutlet weak var viewPassword: PasswordTextNib!
    @IBOutlet weak var viewPasswordRepeat: PasswordTextNib!
    @IBOutlet weak var viewPhoneNumber: TextFieldNib!
    @IBOutlet weak var viewIDNumber: TextFieldNib!
    @IBOutlet weak var viewRegister: BtnCircleNib!
    @IBOutlet weak var lblHaveAccount: UILabel!
    @IBOutlet weak var btnLoginNow: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        SetAlligment()
    }
    

    //MARK: -IBActions
    
    @IBAction func btnLoginNow(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    
    //MARK: -Helper Functions
    func tapGes(){
        viewRegister.addAction = {
            let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "OTPVC") as! OTPVC
            
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true, completion: nil)
        }
    }
    func setupUI(){
        viewFirstName.placeHolder = "First Name".localize
        viewLastName.placeHolder = "Last Name".localize
        viewEmail.placeHolder = "Email Address".localize
        viewEmail.keyboardType = .emailAddress
        viewPassword.placeHolder = "Password".localize
        viewPassword.isSecure = true
        viewPasswordRepeat.placeHolder = "Password Again".localize
        viewPasswordRepeat.isSecure = true
        viewPhoneNumber.placeHolder = "Phone Number".localize
        viewPhoneNumber.keyboardType = .phonePad
        viewIDNumber.placeHolder = "Your National ID Number".localize
        viewIDNumber.keyboardType = .numberPad
        viewRegister.image = UIImage(systemName: "arrow.right".localize)
        lblHaveAccount.text = "Do You Have Account?".localize
        btnLoginNow.setTitle("Login Now".localize, for: .normal)
    }
    
    func SetAlligment(){
        if LocalizationManager.currentLang == "ar"{
            viewFirstName.textField.textAlignment = .right
            viewLastName.textField.textAlignment = .right
            viewEmail.textField.textAlignment = .right
            viewPassword.textField.textAlignment = .right
            viewPasswordRepeat.textField.textAlignment = .right
            viewPhoneNumber.textField.textAlignment = .right
            viewIDNumber.textField.textAlignment = .right
     
        }
    }

}
