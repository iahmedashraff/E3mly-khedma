//
//  NewPasswordVC.swift
//  E3mly khedma
//
//  Created by Ahmed Ashraf on 13/01/2022.
//

import UIKit

class NewPasswordVC: UIViewController {
    // MARK: - Constanse
    
    
    
    // MARK: - Outlets
    
    @IBOutlet weak var containrView: UIView!{
        didSet{
            containrView.layer.cornerRadius = 10
        }
    }
    @IBOutlet weak var viewPassword: PasswordTextNib!
    @IBOutlet weak var viewRepeatPassword: PasswordTextNib!
    @IBOutlet weak var viewDone: BtnCircleNib!
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        tapGes()
    }
    

   
    
    // MARK: - IBAction
    
    
    // MARK: - Helper Functions
    func tapGes(){
        
    }
    func setupUI(){
        viewDone.image = UIImage(systemName: "arrow.right".localize)
        viewPassword.placeHolder = "New Password".localize
        viewRepeatPassword.placeHolder = "Confirm you New Password".localize
    }
    func setAlligment(){
        if LocalizationManager.currentLang == "ar"{
            viewPassword.textField.textAlignment = .right
            viewRepeatPassword.textField.textAlignment = .right
        }
    }
}
