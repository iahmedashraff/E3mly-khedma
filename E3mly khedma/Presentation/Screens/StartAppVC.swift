//
//  startAppVC.swift
//  E3mly khedma
//
//  Created by Ahmed Ashraf on 06/01/2022.
//

import UIKit

class StartAppVC: UIViewController {
    // MARK: - Outlets
    
    @IBOutlet weak var lblHelloMsg: UILabel!
    
    @IBOutlet weak var viewLogin: BtnPressedNib!
    @IBOutlet weak var viewSkip: BtnPressedNib!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        localization()
        tapGesture()
    }
    

    
    // MARK: - IBAction


    // MARK: - Helper Functions
    func tapGesture(){
        viewLogin.addAction = {
            let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LoginVC") as! LoginVC
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true, completion: nil)
        }
        viewSkip.addAction = {
            LocalizationManager.setLanguage()
        }
    }
    
    
    func setupUI(){
        viewLogin.text = "Log In"
        viewLogin.backGround = UIColor(hexString: "#FEBD63")
        viewLogin.titleColor = .white
       // viewLogin.fontName = "Cairo-SemiBold"
        
        viewSkip.text = "Skip"
        viewSkip.backGround = UIColor(hexString: "#413D7D")
        viewSkip.borderStyle = CGColor.init(red: 254, green: 189, blue: 99, alpha: 1)
        viewSkip.titleColor = UIColor(hexString: "#FEBD63")
       // viewSkip.fontName = "Cairo-SemiBold"
    }
    func localization(){
        viewLogin.text = "Log In".localize
        viewSkip.text = "Skip".localize
        lblHelloMsg.text = "Message".localize
    }
}
