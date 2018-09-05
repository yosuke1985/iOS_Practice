//
//  GithubClientError.swift
//  GithubSearchRepository
//
//  Created by YOSUKE on 2018/09/05.
//  Copyright © 2018 YOSUKE. All rights reserved.
//

import Foundation

enum GithubClientError: Error {
    case connectionError(Error)
    case responseParseError(Error)
}
