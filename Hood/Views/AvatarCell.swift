//
//  AvatarCell.swift
//  Hood
//
//  Created by Nahid on 5/10/19.
//  Copyright © 2019 Nahid. All rights reserved.
//

import UIKit

enum AvatarType {
    case dark
    case light
}

class AvatarCell: UICollectionViewCell {
    
    @IBOutlet weak var avatarimg: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.setupView()
    }
    
    func configureCell(index: Int, type: AvatarType) {
        if type == AvatarType.dark {
            avatarimg.image = UIImage(named: "dark\(index)")
            self.layer.backgroundColor = UIColor.lightGray.cgColor
            self.clipsToBounds = true
        } else {
            avatarimg.image = UIImage(named: "light\(index)")
            self.layer.backgroundColor = UIColor.gray.cgColor
            self.clipsToBounds = true
        }
    }
    
    func setupView() {
        self.layer.backgroundColor = UIColor.lightGray.cgColor
        self.layer.cornerRadius = 10
        self.clipsToBounds = true
    }
    
}
