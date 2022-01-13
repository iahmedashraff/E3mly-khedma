//
//  LoginVC.swift
//  E3mly khedma
//
//  Created by Ahmed Ashraf on 05/01/2022.
//

import UIKit

class LoginVC: UIViewController {
    //MARK: -Constanse
    
    
    //MARK: -Outlets
    
    @IBOutlet weak var contanirView: UIView!{
        didSet{
            contanirView.layer.cornerRadius = 10
        }
    }
    @IBOutlet weak var viewEmail: TextFieldNib!
    @IBOutlet weak var viewPassword: PasswordTextNib!
    @IBOutlet weak var btnForgetPassword: UIButton!
    @IBOutlet weak var viewLogin: BtnCircleNib!
    @IBOutlet weak var lblDonotHaveAcc: UILabel!
    @IBOutlet weak var btnRegesterNow: UIButton!
    @IBOutlet var backViewPopUp2: UIView!{
        didSet{
            backViewPopUp2.layer.cornerRadius = 10
            
        }
    }
    @IBOutlet weak var backViewPopUp: UIView!{
        didSet{
            backViewPopUp.layer.cornerRadius = 10
            
        }
    }
    @IBOutlet weak var lblPopUp: UILabel!
    @IBOutlet weak var viewPopUpDone: BtnCircleNib!
    @IBOutlet weak var viewPopUpEmail: TextFieldNib!
    @IBOutlet var blurView: UIVisualEffectView!
    @IBOutlet var popUpView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        tapGesture()
        SetAlligment()
    }
    

    //MARK: -IBActions
    @IBAction func btnForgetPasswordPressed(_ sender: Any) {
        animateIN(desiredView: blurView)
        animateIN(desiredView: popUpView)
    }
    @IBAction func btnRegester(_ sender: UIButton) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "RegisterVC") as! RegisterVC
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
    }
    //MARK: -HelperFunction
    func tapGesture(){
        viewPopUpDone.addAction = {
//            let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ForgetPassOTPVC") as! ForgetPassOTPVC
//            
//            vc.modalPresentationStyle = .fullScreen
//            self.present(vc, animated: true, completion: nil)
            
            self.animateOut(desiredView: self.popUpView)
            self.animateOut(desiredView: self.blurView)
            
        }
    }
    func setupUI(){
        //NIBs

        btnForgetPassword.setTitle("Forget Password?".localize, for: .normal)
        btnRegesterNow.setTitle("Register Now".localize, for: .normal)
        viewEmail.placeHolder = "Email Address".localize
        
        viewEmail.keyboardType = .emailAddress
        viewPassword.placeHolder = "Password".localize
        viewPassword.isSecure = true
        viewLogin.image = UIImage(systemName: "arrow.right".localize)
        //Localization
        lblDonotHaveAcc.text = "Don`t Have Account ?".localize
        viewPopUpDone.image = UIImage(systemName: "arrow.right".localize)
        lblPopUp.text = "Enter your email and a verification code will be sent to you".localize
        viewPopUpEmail.placeHolder = "Email Address".localize
        //PopUP
        
        blurView.bounds = self.view.bounds
        popUpView.bounds = CGRect(x: 0, y: 0, width: self.view.bounds.width * 0.9, height: self.view.bounds.height * 0.4)
    }
    func SetAlligment(){
        if LocalizationManager.currentLang == "ar"{
            viewEmail.textField.textAlignment = .right
            viewPassword.textField.textAlignment = .right
            viewPopUpEmail.textField.textAlignment = .right
            btnForgetPassword.titleLabel?.font = UIFont(name: "Cairo-Regular", size: 15)
            btnRegesterNow.titleLabel?.font = UIFont(name: "Cairo-Regular", size: 15)
        }
    }
    func animateIN(desiredView: UIView){
        let backgroundView = self.view!
        backgroundView.addSubview(desiredView)
        
        
        desiredView.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
        desiredView.alpha = 0
        desiredView.center = backgroundView.center
        
        UIView.animate(withDuration: 0.3) {
            desiredView.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
            desiredView.alpha = 1
        }
    }
    func animateOut(desiredView: UIView){
        UIView.animate(withDuration: 0.3) {
            desiredView.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
            desiredView.alpha = 0
        }completion: { _ in
            desiredView.removeFromSuperview()
        }
    }
}
