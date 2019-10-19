//
//  UserDataService.swift
//  Hood
//
//  Created by Nahid on 4/10/19.
//  Copyright © 2019 Nahid. All rights reserved.
//

import Foundation

class UserDataService {
    
    static let instance = UserDataService()
    
//    public private(set) var id = ""
//    public private(set) var avatarColor = ""
//    public private(set) var avatarName = ""
//    public private(set) var email = ""
//    public private(set) var name = ""
    
    let defaults = UserDefaults.standard
    
    var id: String {
        get {
            return defaults.value(forKey: "id") as! String
        }
        set {
            defaults.set(newValue, forKey: "id")
        }
    }
    
    var avatarColor: String {
        get {
            return defaults.value(forKey: "avatarColor") as! String
        }
        set {
            defaults.set(newValue, forKey: "avatarColor")
        }
    }
    
    var avatarName: String {
        get {
            return defaults.value(forKey: "avatarName") as! String
        }
        set {
            defaults.set(newValue, forKey: "avatarName")
        }
    }
    
    var email: String {
        get {
            return defaults.value(forKey: "email") as! String
        }
        set {
            defaults.set(newValue, forKey: "email")
        }
    }
    
    var name: String {
        get {
            return defaults.value(forKey: "name") as! String
        }
        set {
            defaults.set(newValue, forKey: "name")
        }
    }
    
    func returnUIColor(components: String) -> UIColor {
        let scanner = Scanner(string: components)
        let skipped = CharacterSet(charactersIn: "[], ")
        let comma = CharacterSet(charactersIn: ",")
        scanner.charactersToBeSkipped = skipped
        print(components)
        
        var converted: NSString?
        var rFloat, gFloat, bFloat, aFloat: CGFloat
        
        scanner.scanUpToCharacters(from: comma, into: &converted)
        
        if let str = converted {
            let arr: [NSString] = str.components(separatedBy: " ") as [NSString]
            rFloat = CGFloat(arr[0].doubleValue)
            gFloat = CGFloat(arr[1].doubleValue)
            bFloat = CGFloat(arr[2].doubleValue)
            aFloat = CGFloat(arr[3].doubleValue)
            let newUIColor = UIColor(red: rFloat, green: gFloat, blue: bFloat, alpha: aFloat)
            return newUIColor
        }
        
        return UIColor.lightGray
    }
    
    func logoutUser() {
        self.id = ""
        self.avatarName = ""
        self.avatarColor = ""
        self.email = ""
        self.name = ""
        AuthService.instance.isLoggedIn = false
        AuthService.instance.userEmail = ""
        AuthService.instance.authToken = ""
    }
    
}
