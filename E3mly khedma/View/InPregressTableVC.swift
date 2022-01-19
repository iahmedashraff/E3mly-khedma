//
//  InPregressTableVC.swift
//  E3mly khedma
//
//  Created by Ahmed Ashraf on 19/01/2022.
//

import UIKit

class InPregressTableVC: UITableViewCell {
    //MARK: -Constanse
    var item: OrderModel? {
        didSet {
            self.lblServiceName.text = item?.orderName
            self.lblDescription.text = item?.orderDescription
            self.lblDate.text = item?.date
            self.lblLocation.text = item?.location
            self.lblDuration.text = item?.Duration
        }
    }
    
    
    //MARK: -OutLets
    @IBOutlet weak var backView: UIView!{
        didSet{
            backView.layer.cornerRadius = 10
            backView.layer.shadowColor = UIColor.lightGray.cgColor
            backView.layer.shadowOffset = CGSize(width: 3, height: 3)
            backView.layer.shadowOpacity = 0.7
            backView.layer.shadowRadius = 4.0

        }
    }
    
    @IBOutlet weak var lblServiceName: UILabel!
    
    @IBOutlet weak var lblDescription: UILabel!
    @IBOutlet weak var viewTime: UIView!{
        didSet{
            viewTime.layer.cornerRadius = 8
            viewTime.layer.masksToBounds = true
            viewTime.layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner]
        }
    }
    @IBOutlet weak var lblDuration: UILabel!

    @IBOutlet weak var viewCalender: UIView!{
        didSet{
            viewCalender.layer.cornerRadius = viewCalender.frame.size.height / 2
        }
    }
    
    @IBOutlet weak var lblDate: UILabel!
    
    @IBOutlet weak var viewDuration: UIView!{
        didSet{
            viewDuration.layer.cornerRadius = viewDuration.frame.size.height / 2
        }
        }
    
    @IBOutlet weak var viewMaps: UIView!{
        didSet{
            viewMaps.layer.cornerRadius = viewMaps.frame.size.height / 2
        }
    }
    @IBOutlet weak var lblLocation: UILabel!
    @IBOutlet weak var lblApplicants: UILabel!
    @IBOutlet weak var viewTelephone: UIView!{
        didSet{
            viewTelephone.layer.cornerRadius = viewTelephone.frame.size.height / 2
        }
    }
    @IBOutlet weak var btnDone: UIButton!{
        didSet{
            btnDone.layer.cornerRadius = 5
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
