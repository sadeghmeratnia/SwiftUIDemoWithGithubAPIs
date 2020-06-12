//
//  UserRepositoriesViewModel.swift
//  SwiftUIDemoWithGithubAPIs
//
//  Created by Sadegh on 3/23/1399 AP.
//  Copyright © 1399 Sadegh. All rights reserved.
//

import Foundation

class UserRepositoriesViewModel: ObservableObject {
    @Published var dataSource: [RepoModel]
    
    init(model: [RepoModel]? = []) {
        self.dataSource = model ?? []
    }
}
