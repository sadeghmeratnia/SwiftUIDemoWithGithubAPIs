//
//  APIRouter.swift
//  SwiftUIDemoWithGithubAPIs
//
//  Created by Sadegh on 3/22/1399 AP.
//  Copyright © 1399 Sadegh. All rights reserved.
//

import Foundation


import Foundation

enum APIRouter {
    case getUserInfo
    case getRepositories
    
    private static let baseURLString = "https://api.github.com/"
    
    private enum HTTPMethod {
        case get
        case post
        case put
        case delete
        
        var value: String {
            switch self {
            case .get: return "GET"
            case .post: return "POST"
            case .put: return "PUT"
            case .delete: return "DELETE"
            }
        }
    }
    
    private var method: HTTPMethod {
        switch self {
        case .getUserInfo,
             .getRepositories:
            return .get
        }
    }
    
    private var path: String {
        switch self {
        case .getUserInfo:
            return "user"
        case .getRepositories:
            return "user/repos"
        }
    }
    
    var parameters: Parameters? {
        switch self {
        default:
            return nil
        }
    }
    
    func request() throws -> URLRequest {
        let encodedPath = path.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        let urlString = "\(APIRouter.baseURLString)\(encodedPath)"
        
        guard let url = URL(string: urlString) else {
            throw NetworkError.parsing(description: "URL parsing failed!")
        }
        
        var request = URLRequest(url: url, cachePolicy: .reloadIgnoringCacheData, timeoutInterval: 10)
        request.httpMethod = method.value
        
        request.addValue("token 4778c44dee681eabd2fe77a13b4db02af1448b79", forHTTPHeaderField: "Authorization")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        if let parameters = parameters {
            if method == .post {
                do {
                    let jsonData = try JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted)
                    
                    request.httpBody = jsonData
                } catch let error {
                    throw NetworkError.parsing(description: error.localizedDescription)
                }
            }
        }
        
        return request
    }
}

public typealias Parameters = [String: Any]
