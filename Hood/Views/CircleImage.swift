//
//  CircleImage.swift
//  Hood
//
//  Created by Nahid on 13/10/19.
//  Copyright © 2019 Nahid. All rights reserved.
//

import UIKit

@IBDesignable
class CircleImage: UIImageView {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }
    
    func setupView() {
        self.layer.cornerRadius = self.frame.width / 2
        self.clipsToBounds = true
    }
    
    override class func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
    }

}
