//
//  UserInfoView.swift
//  SwiftUIDemoWithGithubAPIs
//
//  Created by Sadegh on 3/22/1399 AP.
//  Copyright © 1399 Sadegh. All rights reserved.
//

import SwiftUI
import Combine

struct UserInfoView: View {
    @ObservedObject var viewModel: UserInfoViewModel
    
    init(viewModel: UserInfoViewModel = UserInfoViewModel()) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        BaseList() {
            ForEach(self.viewModel.getModelFieldsAndValue().keys.sorted(by: <), id: \.self) { key in
                UserInfoRow(key: key, value: "\(self.viewModel.getModelFieldsAndValue()[key] ?? "-")")
                    .frame(height: 80)
            }
        }
    }
}

#if DEBUG
struct UserInfoView_Previews: PreviewProvider {
    static var previews: some View {
        UserInfoView()
    }
}
#endif
