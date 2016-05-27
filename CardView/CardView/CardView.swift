//
//  CardView.swift
//  CardView
//
//  Created by ATSUSHI on 2016/05/27.
//  Copyright © 2016年 ATSUSHI. All rights reserved.
//

import UIKit

private let NibName = "CardView"

class CardView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setup()
    }
    
    func setup() {
        
        for view in self.subviews {
            view.removeFromSuperview()
        }
        
        let view = self.factory()
        view.frame = self.bounds
        self.addSubview(view)
        
    }
    
    func factory() -> UIView {
        let bundle = NSBundle(forClass: self.dynamicType)
        return UINib(nibName: NibName, bundle: bundle).instantiateWithOwner(self, options: nil).first as! UIView
    }
    
}
