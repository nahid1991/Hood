//
//  CreateAccntVC.swift
//  Hood
//
//  Created by Nahid on 21/9/19.
//  Copyright © 2019 Nahid. All rights reserved.
//

import UIKit

class CreateAccntVC: UIViewController, AvatarControllerVCDelegate {

    // Outlets
    @IBOutlet weak var userNameTxt: UITextField!
    @IBOutlet weak var emailTxt: UITextField!
    @IBOutlet weak var passwordTxt: UITextField!
    @IBOutlet weak var userImg: UIImageView!
    var instanceOfAvatarControllerVC: AvatarControllerVC!
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    // Variable
    var avatarName = "profileDefault"
    var avatarColor = "[0.5, 0.5, 0.5, 1]"
    var bgColor: UIColor?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
    }
    
    @IBAction func closeButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: UNWIND, sender: nil)
    }
    
    @IBAction func pickAvatarPressed(_ sender: Any) {
        performSegue(withIdentifier: TO_AVATAR_PICKER, sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toAvatarPicker" {
            let destinationVC = segue.destination as? AvatarControllerVC
            destinationVC?.delegate = self
        }
    }
    
    func setProfilePic(image: String) {
        userImg.image = UIImage(named: image)
        self.avatarName = image
    }
    
    @IBAction func pickBgColorPressed(_ sender: Any) {
        let r = CGFloat(arc4random_uniform(255)) / 255
        let g = CGFloat(arc4random_uniform(255)) / 255
        let b = CGFloat(arc4random_uniform(255)) / 255
        
        bgColor = UIColor(red: r, green: g, blue: b, alpha: 1)
        avatarColor = "[\(r) \(g) \(b) 1]"
        UIView.animate(withDuration: 1) {
            self.userImg.backgroundColor = self.bgColor
        }
    }
    
    @IBAction func createAccntPressed(_ sender: Any) {
        spinner.isHidden = false
        spinner.startAnimating()
        guard let name = userNameTxt.text, userNameTxt.text != "" else { return }
        guard let email = emailTxt.text, emailTxt.text != "" else { return }
        guard let password = passwordTxt.text, passwordTxt.text != "" else { return }
        
        AuthService.instance.registerUser(username: name, email: email, password: password) { (success) in
            if success {
                AuthService.instance.loginUser(email: email, password: password) { (success) in
                    if success {
                        AuthService.instance.createUser(name: name, email: email, avatarName: self.avatarName, avatarColor: self.avatarColor) { (success) in
                            if success {
                                self.spinner.isHidden = true
                                self.spinner.stopAnimating()
                                self.performSegue(withIdentifier: UNWIND, sender: nil)
                                NotificationCenter.default.post(name: NOTIF_USER_DATA_DID_CHANGE, object: nil)
                            }
                        }
                    }
                }
            }
        }
    }
    
    func setupView() {
        spinner.isHidden = true
        userNameTxt.attributedPlaceholder = NSAttributedString(string: "username", attributes: [NSAttributedString.Key.foregroundColor: SMACK_PLACEHOLDER_COLOR])
        emailTxt.attributedPlaceholder = NSAttributedString(string: "email", attributes: [NSAttributedString.Key.foregroundColor: SMACK_PLACEHOLDER_COLOR])
        passwordTxt.attributedPlaceholder = NSAttributedString(string: "password", attributes: [NSAttributedString.Key.foregroundColor: SMACK_PLACEHOLDER_COLOR])
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(CreateAccntVC.handleTap))
        view.addGestureRecognizer(tap)
    }
    
    @objc func handleTap() {
        view.endEditing(true)
    }
}
