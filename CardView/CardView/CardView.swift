//
//  CardView.swift
//  CardView
//
//  Created by ATSUSHI on 2016/05/27.
//  Copyright © 2016年 ATSUSHI. All rights reserved.
//

import UIKit

class CardView: UIView {
    
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var userImageView: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var locationLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func setCardInfo(image: UIImage, userImage: UIImage, name: String) {
        self.imageView.image     = image
        self.userImageView.image = userImage
        self.nameLabel.text      = name
    }
}
