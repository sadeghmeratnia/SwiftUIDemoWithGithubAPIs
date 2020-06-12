//
//  UserRepositoriesRow.swift
//  SwiftUIDemoWithGithubAPIs
//
//  Created by Sadegh on 3/23/1399 AP.
//  Copyright © 1399 Sadegh. All rights reserved.
//

import SwiftUI

struct UserRepositoriesRow: View {
    var repoModel: RepoModel
    
    init(model: RepoModel) {
        self.repoModel = model
    }
    
    var body: some View {
        let accessLevelText: String = (self.repoModel.isPrivate ?? false) ? "Private": "Public"
        let accessLevelColor: Color = (self.repoModel.isPrivate ?? false) ? ColorRefrences.yellowAccessLevel.getColor: ColorRefrences.greenAccessLevel.getColor
        return VStack(alignment: .leading, spacing: 8) {
            self.getKeyValuePairs(key: "Name:", value: self.repoModel.name ?? "-")
            self.getKeyValuePairs(key: "Full name:", value: self.repoModel.fullName ?? "-")
            BaseText(text: accessLevelText, font: Font.robotoBold(14), color: accessLevelColor)
        }.padding([.leading, .trailing], 16)
    }
    
    private func getKeyValuePairs(key: String, value: String) -> some View {
        return HStack {
            BaseText(text: key, font: Font.robotoBold(14))
            BaseText(text: value, font: Font.roboto(14))
                .lineLimit(1)
        }
    }
}

#if DEBUG
struct UserRepositoriesRow_Previews: PreviewProvider {
    static var previews: some View {
        UserInfoRow(key: "", value: "").previewLayout(.fixed(width: 200, height: 70))
    }
}
#endif
