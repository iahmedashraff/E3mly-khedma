//
//  BtnPressedNib.swift
//  E3mly khedma
//
//  Created by Ahmed Ashraf on 05/01/2022.
//

import Foundation
import UIKit

@IBDesignable
class BtnPressedNib:UIView{
    //MARK: -Constanse
    var text: String? {
        didSet{
            self.btn.setTitle(text, for: .normal)
        }
    }
    var titleColor: UIColor? {
        didSet{
            self.btn.setTitleColor(titleColor, for: .normal)
            
        }
    }
    var backGround: UIColor? {
        didSet{
            self.btn.backgroundColor = backGround
            self.btn.layer.cornerRadius = 15
            self.btn.setTitleColor(UIColor.init(hexString: "#FEBD63"), for: .highlighted)
        }
    }
    var borderStyle: CGColor? {
        didSet{
            self.btn.layer.borderColor = UIColor.init(hexString: "#FEBD63").cgColor
            self.btn.layer.borderWidth = 2
            self.btn.setTitleColor(UIColor.white, for: .highlighted)
        }
    }
    var fontName: String? {
        didSet{
            self.btn.titleLabel?.font = UIFont(name: fontName!, size: 40)
        }
    }
    
    
   
    //MARK: -Outlets
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var btn: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    override init(frame: CGRect) {
            super.init(frame: frame)
            commit()
        }
        required init?(coder aDecoder: NSCoder) {
            super.init(coder: aDecoder)
            commit()
        }
    
    
    
    //MARK: -HelperFunctions
    func commit(){
          Bundle.main.loadNibNamed("BtnPressedNib", owner: self, options: nil)
          addSubview(contentView)
            contentView.frame = self.bounds
            contentView.autoresizingMask  = [.flexibleHeight,.flexibleWidth]
            contentView.isUserInteractionEnabled = false

      }
    
}


