//
//  API.swift
//  MVVM
//
//  Created by YOSUKE on 2018/07/28.
//  Copyright © 2018 YOSUKE. All rights reserved.
//

import Foundation

class API {
    
    func getUsers(success: @escaping ([User]) -> Void,
                  failure: @escaping (Error) -> Void) {
        let requestURL = URL(string: "https://api.github.com/users")
        guard let url = requestURL else {
            failure(APIError.invalidURL)
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.timeoutInterval = 10
        
        let task = URLSession.shared.dataTask(with: request)
        { (data, response, error) in
            /*
             Errorがあったら、ErrorをClosureで返す
             */
            if let error = error {
                DispatchQueue.main.async {
                    failure(error)
                }
                return
            }
            
            /*
             dataがなかったら、APIError.unknown ErrorをClosureで返す
             */
            guard let data = data else {
                DispatchQueue.main.async {
                    failure(APIError.unknown)
                }
                return
            }
            
            /*
             レスポンスのデータ型が不正だったら、
             APIError.invalidResponse ErrorをClosureで返す
             */
            guard
                let jsonOptional = try? JSONSerialization.jsonObject(with: data, options: []),
                let json = jsonOptional as? [[String: Any]]
                else {
                    DispatchQueue.main.async { failure(APIError.invalidResponse) }
                    return
            }
            
            /*
             for文でjsonからUserを作成し、[User]に追加し、
             [User]をClosureで返す
             */
            var users = [User]()
            for j in json {
                let user = User(attributes: j)
                users.append(user)
            }
            DispatchQueue.main.async {
                success(users)
            }
        }
        
        task.resume()
        
    }
    
    
    
}
