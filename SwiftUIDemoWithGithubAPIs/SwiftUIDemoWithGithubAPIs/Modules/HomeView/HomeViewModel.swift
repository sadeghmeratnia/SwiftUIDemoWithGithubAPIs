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
    
    init(model: UserModel? = UserModel()) {
        self.userModel = model ?? UserModel()
    }
}

enum TabBarIndices {
    case userInfo
    case repos
}
