//
//  UserModel.swift
//  SwiftUIDemoWithGithubAPIs
//
//  Created by Sadegh on 3/22/1399 AP.
//  Copyright © 1399 Sadegh. All rights reserved.
//

import Foundation

struct UserModel: Decodable {
    var login: String?
    var id: Int64?
    var node_id: String?
    var avatar_url: String?
    var gravatar_id: String?
    var url: String?
    var html_url: String?
    var followers_url: String?
    var following_url: String?
    var gists_url: String?
    var starred_url: String?
    var subscriptions_url: String?
    var organizations_url: String?
    var repos_url: String?
    var events_url: String?
    var received_events_url: String?
    var type: String?
    var site_admin: Bool?
    var name: String?
    var company: String?
    var blog: String?
    var location: String?
    var email: String?
    var hireable: String?
    var bio: String?
    var twitter_username: String?
    var public_repos: Int64?
    var public_gists: Int64?
    var followers: Int64?
    var following: Int64?
    var created_at: String?
    var updated_at: String?
    var private_gists: Int64?
    var total_private_repos: Int64?
    var owned_private_repos: Int64?
    var disk_usage: Int64?
    var collaborators: Int64?
    var two_factor_authentication: Bool?
    var plan: PlanModel?
}

struct PlanModel: Decodable {
    var name: String?
    var space: Int64?
    var collaborators: Int64?
    var private_repos: Int64?
}
