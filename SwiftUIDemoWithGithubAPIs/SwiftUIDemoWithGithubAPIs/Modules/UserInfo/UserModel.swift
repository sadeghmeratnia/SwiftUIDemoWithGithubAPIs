//
//  UserModel.swift
//  SwiftUIDemoWithGithubAPIs
//
//  Created by Sadegh on 3/22/1399 AP.
//  Copyright © 1399 Sadegh. All rights reserved.
//

import Foundation

//MARK: - UserModel
struct UserModel: Codable {
    var login: String?
    var id: Int64?
    var nodeID: String?
    var avatarURL: String?
    var gravatarID: String?
    var URL: String?
    var htmlURL: String?
    var followersURL: String?
    var followingURL: String?
    var gistsURL: String?
    var starredURL: String?
    var subscriptionsURL: String?
    var organizationsURL: String?
    var reposURL: String?
    var eventsURL: String?
    var receivedEventsURL: String?
    var type: String?
    var siteAdmin: Bool?
    var name: String?
    var company: String?
    var blog: String?
    var location: String?
    var email: String?
    var hireable: String?
    var bio: String?
    var twitterUsername: String?
    var publicRepos: Int64?
    var publicGists: Int64?
    var followers: Int64?
    var following: Int64?
    var created_at: String?
    var createdAt: String?
    var privateGists: Int64?
    var totalPrivateRepos: Int64?
    var ownedPrivateRepos: Int64?
    var diskUsage: Int64?
    var collaborators: Int64?
    var twoFactorAuthentication: Bool?
    var plan: PlanModel?
}

extension UserModel {
    enum CodingKeys: String, CodingKey {
        case login, id, collaborators, type, name, company
        case blog, location, email, hireable, bio
        case followers, following, plan
        
        case nodeID                  = "node_id"
        case avatarURL               = "avatar_url"
        case gravatarID              = "gravatar_id"
        case URL                     = "url"
        case htmlURL                 = "html_url"
        case followersURL            = "followers_url"
        case followingURL            = "following_url"
        case gistsURL                = "gists_url"
        case starredURL              = "starred_url"
        case subscriptionsURL        = "subscriptions_url"
        case organizationsURL        = "organizations_url"
        case reposURL                = "repos_url"
        case eventsURL               = "events_url"
        case receivedEventsURL       = "received_events_url"
        case siteAdmin               = "site_admin"
        case twitterUsername         = "twitter_username"
        case publicRepos             = "public_repos"
        case publicGists             = "public_gists"
        case createdAt               = "created_at"
        case privateGists            = "private_gists"
        case totalPrivateRepos       = "total_private_repos"
        case ownedPrivateRepos       = "owned_private_repos"
        case diskUsage               = "disk_usage"
        case twoFactorAuthentication = "two_factor_authentication"
    }
}


//MARK: - PlanModel
struct PlanModel: Codable {
    var name: String?
    var space: Int64?
    var collaborators: Int64?
    var privateRepos: Int64?
}

extension PlanModel {
    enum CodingKeys: String, CodingKey {
        case name, space, collaborators
        case privateRepos = "private_repos"
    }
}
