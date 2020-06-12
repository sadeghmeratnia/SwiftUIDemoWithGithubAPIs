//
//  DictionaryEncoder.swift
//  SwiftUIDemoWithGithubAPIs
//
//  Created by Sadegh on 3/23/1399 AP.
//  Copyright © 1399 Sadegh. All rights reserved.
//

import Foundation

class DictionaryEncoder {
    
    private let encoder = JSONEncoder()
    
    func encode<T>(_ value: T) throws -> [String: Any]? where T: Encodable {
        let data = try encoder.encode(value)
        return try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any]
    }
}
