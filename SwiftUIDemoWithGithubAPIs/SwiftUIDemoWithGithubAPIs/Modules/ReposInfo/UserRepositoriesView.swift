//
//  UserRepositoriesView.swift
//  SwiftUIDemoWithGithubAPIs
//
//  Created by Sadegh on 3/23/1399 AP.
//  Copyright © 1399 Sadegh. All rights reserved.
//

import SwiftUI

struct UserRepositoriesView: View {
    @ObservedObject var viewModel: UserRepositoriesViewModel
    
    init(viewModel: UserRepositoriesViewModel = UserRepositoriesViewModel()) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        BaseList {
            ForEach(self.viewModel.dataSource, id: \.ID) { model in
                UserRepositoriesRow(model: model)
                    .frame(height: 80)
            }
        }
    }
}

struct UserRepositoriesView_Previews: PreviewProvider {
    static var previews: some View {
        UserRepositoriesView()
    }
}
