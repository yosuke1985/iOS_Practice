//
//  User.swift
//  MVVM
//
//  Created by YOSUKE on 2018/07/28.
//  Copyright © 2018 YOSUKE. All rights reserved.
//

import Foundation

import Foundation

final class User {
    let id: Int
    let name: String
    let iconUrl: String
    let webURL: String
    
    init(attributes: [String: Any]) {
        id = attributes["id"] as! Int
        name = attributes["login"] as! String
        iconUrl = attributes["avatar_url"] as! String
        webURL = attributes["html_url"] as! String
    }
}
