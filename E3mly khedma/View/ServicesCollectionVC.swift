//
//  ServicesCollectionVC.swift
//  E3mly khedma
//
//  Created by Ahmed Ashraf on 13/01/2022.
//

import UIKit

class ServicesCollectionVC: UICollectionViewCell {
    
    @IBOutlet weak var backView: UIView!
    
    @IBOutlet weak var contanirView: UIView!{
        didSet{
            contanirView.layer.cornerRadius = 10
            contanirView.layer.shadowColor = UIColor.lightGray.cgColor
            contanirView.layer.shadowOffset = CGSize(width: 3, height: 3)
            contanirView.layer.shadowOpacity = 0.3
            contanirView.layer.shadowRadius = 4.0
        }
    }
    
}
