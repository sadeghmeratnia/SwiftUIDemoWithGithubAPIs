//
//  UserInfoViewModel.swift
//  SwiftUIDemoWithGithubAPIs
//
//  Created by Sadegh on 3/22/1399 AP.
//  Copyright © 1399 Sadegh. All rights reserved.
//

import Foundation
import SwiftUI
import Combine


class UserInfoViewModel: ObservableObject {
    @Published var dataSource: UserModel
    
    init(model: UserModel? = UserModel()) {
        self.dataSource = model ?? UserModel()
    }
}
