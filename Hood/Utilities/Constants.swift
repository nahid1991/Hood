//
//  Constants.swift
//  Hood
//
//  Created by Nahid on 21/9/19.
//  Copyright © 2019 Nahid. All rights reserved.
//

import Foundation

typealias CompletionHandler = (_ Success: Bool) -> ()

//URL constants
let BASE_URL = "https://hedwigchat2.herokuapp.com/v1/"
let URL_REGISTER = "\(BASE_URL)account/register"
let URL_LOGIN = "\(BASE_URL)account/login"
let URL_USER_ADD = "\(BASE_URL)user/add"

//Segues
let TO_LOGIN = "toLogin"
let TO_CREATE_ACCOUNT = "toCreateAccount"
let TO_AVATAR_PICKER = "toAvatarPicker"
let UNWIND = "unwindToChannel"
let UNWIND_TO_ACCOUNT_CREATE = "unwindToReg"

//User defaults
let TOKEN_KEY = "token"
let LOGGED_IN_KEY = "loggedIn"
let USER_EMAIL = "userEmail"
let CHOSEN_PROFILE_IMAGE = "chosenProfileImage"

//Header
let HEADER = [
    "Content-Type": "application/json; charset=utf-8",
]

