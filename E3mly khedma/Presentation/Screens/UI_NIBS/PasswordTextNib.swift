//
//  PasswordTextNib.swift
//  E3mly khedma
//
//  Created by Ahmed Ashraf on 05/01/2022.
//

import Foundation
import UIKit
@IBDesignable
class PasswordTextNib: UIView, UITextFieldDelegate{
    //MARK: -Constanse
    var placeHolder: String? {
        didSet {
            self.lblPlaceHolder.text = placeHolder
            self.textField.placeholder = placeHolder
        }
    }
    var text: String? {
        didSet {
            self.textField.text = text
        }
    }
    var keyboardType: UIKeyboardType? {
       didSet {
           self.textField.keyboardType = keyboardType ?? .default

           
       }
   }
    var isSecure: Bool? {
       didSet {
           self.textField.isSecureTextEntry = true
       }
   }
   
    
    //MARK: -Outlets
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var lblPlaceHolder: UILabel!{
        didSet{
            self.lblPlaceHolder.isHidden = true
        }
    }
    @IBOutlet weak var btnShowPassword: UIButton!{
        didSet{
            btnShowPassword.setTitle("", for: .normal)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        textField.delegate = self
        textFieldDidBeginEditing(textField)
        textFieldDidEndEditing(textField)
    }
    override init(frame: CGRect) {
            super.init(frame: frame)
            commit()
        }
        required init?(coder aDecoder: NSCoder) {
            super.init(coder: aDecoder)
            commit()
        }
    
    //MARK: -IBActions
    @IBAction func changedTextFiledValueForText(_ sender: UITextField) {
        text = textField.text
    }
    @IBAction func showPassword(_ sender: UIButton) {
        textField.isSecureTextEntry = !textField.isSecureTextEntry
    }
    
    //MARK: -HelperFunctions
    func textFieldDidBeginEditing(_ textField: UITextField) {
            textField.layer.cornerRadius = 5
            textField.layer.borderColor = UIColor(hexString: "#413D7D").cgColor
            textField.layer.borderWidth = 1.0
        isShowPlaceHolder(true)
        }

    func textFieldDidEndEditing(_ textField: UITextField) {
            textField.layer.cornerRadius = 5
            textField.layer.borderWidth = 0.0
        isShowPlaceHolder(false)
        }
                // For Making Animation to placeholder
    func isShowPlaceHolder(_ isShow: Bool) {
        UIView.animate(withDuration: 0.5) {
            self.lblPlaceHolder.isHidden = !isShow
        } completion: { com in
        }
    }
    func commit(){
          Bundle.main.loadNibNamed("PasswordTextNib", owner: self, options: nil)
          addSubview(contentView)
            contentView.frame = self.bounds
            contentView.autoresizingMask  = [.flexibleHeight,.flexibleWidth]
       
      }
}
