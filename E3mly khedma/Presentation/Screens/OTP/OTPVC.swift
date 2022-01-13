//
//  OTPVC.swift
//  E3mly khedma
//
//  Created by Ahmed Ashraf on 12/01/2022.
//

import UIKit

class OTPVC: UIViewController, UITextFieldDelegate {
    //MARK: -Outltes
    @IBOutlet weak var lblMassage: UILabel!
    @IBOutlet weak var txtOTP1: UITextField!
    @IBOutlet weak var txtOTP2: UITextField!
    @IBOutlet weak var txtOTP3: UITextField!
    @IBOutlet weak var txtOTP4: UITextField!
    @IBOutlet weak var viewBtn: BtnCircleNib!
    @IBOutlet weak var btnSendCodeAgain: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        addBottomLine(textField: txtOTP1)
        addBottomLine(textField: txtOTP2)
        addBottomLine(textField: txtOTP3)
        addBottomLine(textField: txtOTP4)
        txtOTP1.delegate = self
        txtOTP2.delegate = self
        txtOTP3.delegate = self
        txtOTP4.delegate = self
        setLocalization()

        
    }
    

    //MARK: -IBActions
    
    @IBAction func btnSendCodeAgain(_ sender: UIButton) {
    }
    
    
    //MARK: -Helper Functions
    func setupUI(){
        lblMassage.text = "Please enter the verification code sent to you in a text message to activate your account".localize
        txtOTP1.backgroundColor = .clear
        txtOTP2.backgroundColor = .clear
        txtOTP3.backgroundColor = .clear
        txtOTP4.backgroundColor = .clear
        txtOTP1.keyboardType = .numberPad
        txtOTP2.keyboardType = .numberPad
        txtOTP3.keyboardType = .numberPad
        txtOTP4.keyboardType = .numberPad
        viewBtn.image = UIImage(systemName: "arrow.right".localize)
        btnSendCodeAgain.setTitle("Send Code Again".localize, for: .normal)
    }
    func addBottomLine(textField: UITextField){
        let layer = CALayer()
        layer.backgroundColor = UIColor.lightGray.cgColor
        layer.frame = CGRect(x: 0.0, y: textField.frame.size.height - 2.0, width: textField.frame.size.width, height: 2.0)
        textField.layer.addSublayer(layer)
    }
    func setLocalization(){
        if LocalizationManager.currentLang == "ar"{
            txtOTP1.becomeFirstResponder()
            btnSendCodeAgain.titleLabel?.font = UIFont(name: "Cairo-Regular", size: 15)
        }
    }
    
}

extension OTPVC {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if ((textField.text?.count)! < 1) && (string.count > 0) {

            if textField == txtOTP1 {
                txtOTP2.becomeFirstResponder()
            }
            if textField == txtOTP2 {
                txtOTP3.becomeFirstResponder()
            }
            if textField == txtOTP3 {
                txtOTP4.becomeFirstResponder()
            }
            if textField == txtOTP1 {
                txtOTP4.resignFirstResponder()
            }
            textField.text = string
            return false
        }else if ((textField.text?.count)! >= 1) && (string.count == 0) {
            if textField == txtOTP2{
                txtOTP1.becomeFirstResponder()
            }
            if textField == txtOTP3{
                txtOTP2.becomeFirstResponder()
            }
            if textField == txtOTP4{
                txtOTP3.becomeFirstResponder()
            }
            if textField == txtOTP2{
                txtOTP1.resignFirstResponder()
            }
            textField.text = ""
            return false
        }else if (textField.text?.count)! >= 1 {
            textField.text = string
            return false
        }
        
        return true
    }
}
