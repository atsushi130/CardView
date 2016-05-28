//
//  CardView.swift
//  CardView
//
//  Created by ATSUSHI on 2016/05/27.
//  Copyright © 2016年 ATSUSHI. All rights reserved.
//

import UIKit

typealias CardInformation = (image: UIImage, userImage: UIImage, name: String, location: String)

class CardView: UIView {
    
    @IBOutlet var imageView:     UIImageView!
    @IBOutlet var userImageView: UIImageView!
    @IBOutlet var nameLabel:     UILabel!
    @IBOutlet var locationLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func setCardInformation(cardInformation: CardInformation) {
        self.imageView.image     = cardInformation.image
        self.userImageView.image = cardInformation.userImage
        self.nameLabel.text      = cardInformation.name
        self.locationLabel.text  = cardInformation.location
    }
}
