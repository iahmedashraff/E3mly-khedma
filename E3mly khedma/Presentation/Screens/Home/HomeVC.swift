//
//  HomeVC.swift
//  E3mly khedma
//
//  Created by Ahmed Ashraf on 13/01/2022.
//

import UIKit

class HomeVC: UIViewController {
    //MARK: - Constase

    
    
    
    //MARK: - OutLets
    @IBOutlet weak var viewSideMenu: UIView!
    @IBOutlet weak var imgUser: UIImageView!
    @IBOutlet weak var lblWelcome: UILabel!
    @IBOutlet weak var lblWelcomeMessage: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var viewRequestService: UIView!
    @IBOutlet weak var lblRequestService: UILabel!
    @IBOutlet weak var sideMenuView: UIView!
    @IBOutlet weak var imageUser: UIImageView!
    @IBOutlet weak var lblUserName: UILabel!
    @IBOutlet weak var viewHome: UIView!
    @IBOutlet weak var viewUserProfile: UIView!
    @IBOutlet weak var viewOrders: UIView!
    @IBOutlet weak var viewServices: UILabel!
    @IBOutlet weak var viewNotifications: UIView!
    @IBOutlet weak var viewContactUs: UIView!
    @IBOutlet weak var viewSettings: UIView!
    @IBOutlet weak var viewLogOut: UIView!
    @IBOutlet weak var lblHome: UILabel!
    @IBOutlet weak var lblUserProfile: UILabel!
    @IBOutlet weak var lblOrders: UILabel!
    @IBOutlet weak var lblServices: UILabel!
    @IBOutlet weak var lblNotifications: UILabel!
    @IBOutlet weak var lblContactUs: UILabel!
    @IBOutlet weak var lblSettings: UILabel!
    @IBOutlet weak var lblLogOut: UILabel!
    @IBOutlet weak var sideConstrains: NSLayoutConstraint!
    @IBOutlet weak var btnCancelSideMenu: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        Localization()
        tepGes()
    }
    

    //MARK: - IBACtions
    
    @IBAction func closeSideMenu(_ sender: Any) {
        self.sideConstrains.constant = 0
        self.view.layoutIfNeeded()
    }
    
    
    
    //MARK: -HelperFunctions
    func setupUI(){
        viewRequestService.layer.cornerRadius = 10
        
    }
    func tepGes(){
        viewRequestService.addAction = {
            
        }
        viewSideMenu.addAction = {
            UIView.animate(withDuration: 0.7) {
                if self.sideConstrains.constant == 0 {
                    self.sideConstrains.constant = self.sideMenuView.frame.width
                }else{
                    self.sideConstrains.constant = 0
                }
                self.view.layoutIfNeeded()
            }
        }
        viewOrders.addAction = {
            let vc = UIStoryboard(name: "Orders", bundle: nil).instantiateViewController(withIdentifier: "OrdersVC") as! OrdersVC
            
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true, completion: nil)
        }
        
    }
    func Localization(){
        lblWelcome.text = "Hi Welcome !".localize
        lblWelcomeMessage.text = "Lorem Ipsum is simply dummy text of the printing and typesetting industry.".localize
        lblRequestService.text = "Request your service now".localize
        lblHome.text = "Home".localize
        lblUserProfile.text = "User Profile".localize
        lblOrders.text = "My Orders".localize
        lblServices.text = "My Services".localize
        lblNotifications.text = "Notifications".localize
        lblContactUs.text = "Contact us".localize
        lblSettings.text = "Settings".localize
        lblLogOut.text = "Log Out".localize
        btnCancelSideMenu.setTitle("", for: .normal)
    }
    
    
}


