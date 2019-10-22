//
//  AddChannelVC.swift
//  Hood
//
//  Created by Nahid on 22/10/19.
//  Copyright © 2019 Nahid. All rights reserved.
//

import UIKit

class AddChannelVC: UIViewController {
    // Outlets
    @IBOutlet weak var nameTxt: UITextField!
    @IBOutlet weak var descTxt: UITextField!
    @IBOutlet weak var bgView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    @IBAction func closeModalPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func createChannelPressed(_ sender: Any) {
    }
    
    func setupView() {
        nameTxt.attributedPlaceholder = NSAttributedString(string: "name", attributes: [NSAttributedString.Key.foregroundColor: SMACK_PLACEHOLDER_COLOR])
        descTxt.attributedPlaceholder = NSAttributedString(string: "description", attributes: [NSAttributedString.Key.foregroundColor: SMACK_PLACEHOLDER_COLOR])
        let tap = UITapGestureRecognizer(target: self, action: #selector(AddChannelVC.closeTap))
        view.addGestureRecognizer(tap)
    }
            
    @objc func closeTap() {
        self.dismiss(animated: true, completion: nil)
    }
}
