//
//  Repository.swift
//  GithubSearchRepository
//
//  Created by YOSUKE on 2018/09/05.
//  Copyright © 2018 YOSUKE. All rights reserved.
//

import Foundation

struct Repository: Decodable{
    let id: Int
    let name: String
    let fullName: String
    let owner: User
    
    enum CodingKeys: String, CodingKey{
        case id
        case name
        case fullName = "full_name"
        case owner
    }
}
