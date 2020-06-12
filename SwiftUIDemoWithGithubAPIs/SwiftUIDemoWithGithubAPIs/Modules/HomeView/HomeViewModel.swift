//
//  HomeViewModel.swift
//  SwiftUIDemoWithGithubAPIs
//
//  Created by Sadegh on 3/23/1399 AP.
//  Copyright © 1399 Sadegh. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

class HomeViewModel: ObservableObject {
    @Published var currentView: TabBarIndices = .userInfo
    @Published var userModel: UserModel
    @Published var repoModel: [RepoModel]
    
    init(userModel: UserModel? = UserModel(), repoModel: [RepoModel]? = []) {
        self.userModel = userModel ?? UserModel()
        self.repoModel = repoModel ?? []
    }
}

enum TabBarIndices {
    case userInfo
    case repos
}
