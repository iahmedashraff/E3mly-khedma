//
//  btnCircleNib.swift
//  E3mly khedma
//
//  Created by Ahmed Ashraf on 05/01/2022.
//

import Foundation
import UIKit

@IBDesignable
class BtnCircleNib:UIView{
    //MARK: -Constanse
    var image: UIImage? {
        didSet{
            self.btn.setImage(image, for: .normal)
            
        }
    }
    
    //MARK: -Outlets
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var btn: UIButton!{
        didSet{
            btn.layer.cornerRadius = layer.frame.size.height / 2
            btn.setTitle("", for: .normal)
        }
    }
    
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
          Bundle.main.loadNibNamed("BtnCircleNib", owner: self, options: nil)
          addSubview(contentView)
            contentView.frame = self.bounds
            contentView.autoresizingMask  = [.flexibleHeight,.flexibleWidth]
       
      }
}
