//
//  ChannelVC.swift
//  Hood
//
//  Created by Nahid on 18/9/19.
//  Copyright © 2019 Nahid. All rights reserved.
//

import UIKit

class ChannelVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.revealViewController()?.rearViewRevealWidth = self.view.frame.size.width - 60
    }
}
