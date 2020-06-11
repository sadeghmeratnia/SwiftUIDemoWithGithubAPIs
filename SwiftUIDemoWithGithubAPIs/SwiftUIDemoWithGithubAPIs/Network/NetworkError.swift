//
//  NetworkError.swift
//  SwiftUIDemoWithGithubAPIs
//
//  Created by Sadegh on 3/22/1399 AP.
//  Copyright © 1399 Sadegh. All rights reserved.
//

import Foundation

enum NetworkError: Error {
    case parsing(description: String)
    case network(description: String)
}
