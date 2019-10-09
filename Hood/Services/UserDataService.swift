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
    
    public private(set) var id = ""
    public private(set) var avatarColor = ""
    public private(set) var avatarName = ""
    public private(set) var email = ""
    public private(set) var name = ""
    
    func setUserData(id: String, avatarColor: String, avatarName: String, email: String, name: String) {
        self.id = id
        self.avatarColor = avatarColor
        self.avatarName = avatarName
        self.email = email
        self.name = name
    }
    
    func setAvatarName(avatarName: String, completion: @escaping CompletionHandler) {
        self.avatarName = avatarName
        completion(true)
    }
    
    func getAvatarName() -> String {
        return self.avatarName
    }
    
}
