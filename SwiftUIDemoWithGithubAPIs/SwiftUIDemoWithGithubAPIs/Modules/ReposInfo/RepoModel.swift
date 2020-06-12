//
//  RepoModel.swift
//  SwiftUIDemoWithGithubAPIs
//
//  Created by Sadegh on 3/23/1399 AP.
//  Copyright © 1399 Sadegh. All rights reserved.
//

import Foundation

struct RepoModel: Codable {
    var ID: Int64?
    var nodeID: String?
    var name: String?
    var fullName: String?
    var isPrivate: Bool?
}

extension RepoModel {
    enum CodingKeys: String, CodingKey {
        case ID = "id"
        case nodeID = "node_id"
        case name
        case fullName = "full_name"
        case isPrivate = "private"
    }
}
