//
//  ChatVC.swift
//  Hood
//
//  Created by Nahid on 18/9/19.
//  Copyright © 2019 Nahid. All rights reserved.
//

import UIKit

class ChatVC: UIViewController {
    // Outlets
    @IBOutlet weak var menuButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        menuButton.addTarget(self.revealViewController(), action: #selector(SWRevealViewController.revealToggle(_:)), for: .touchUpInside)
        self.view.addGestureRecognizer(self.revealViewController()!.panGestureRecognizer())
        self.view.addGestureRecognizer(self.revealViewController()!.tapGestureRecognizer())
    }

}
