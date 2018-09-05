//
//  SearchResponse.swift
//  GithubSearchRepository
//
//  Created by YOSUKE on 2018/09/05.
//  Copyright © 2018 YOSUKE. All rights reserved.
//

import Foundation

struct SearchResponse<Item: Decodable>: Decodable {
    let totalCount: Int
    let items: [Item]
    
    enum CodingKeys: String, CodingKey {
        case totalCount = "total_count"
        case items
    }
}
