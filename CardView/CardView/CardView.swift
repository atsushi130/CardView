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
    
    @IBOutlet var imageView: UIImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
}
