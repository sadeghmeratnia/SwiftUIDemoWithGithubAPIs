//
//  UserInfoRow.swift
//  SwiftUIDemoWithGithubAPIs
//
//  Created by Sadegh on 3/22/1399 AP.
//  Copyright © 1399 Sadegh. All rights reserved.
//

import SwiftUI

struct UserInfoRow: View {
    var key: String
    var value: String
    
    init(key: String, value: String) {
        self.key = key
        self.value = value
    }
    
    var body: some View {
        
        GeometryReader { geometry in
            self.KeyValuePairs
                .frame(width: geometry.size.width)
        }
    }
    
    private var KeyValuePairs: some View {
        VStack(alignment: .leading, spacing: 12) {
            BaseText(text: key.localized, font: Font.robotoBold(14))
                .edgesIgnoringSafeArea(.leading)
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, alignment: .leading)
            
            BaseText(text: value, font: Font.roboto(14))
                .lineLimit(1)
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, alignment: .leading)
            
        }.padding([.leading, .trailing], 16)
    }
}

#if DEBUG
struct UserInfoRow_Previews: PreviewProvider {
    static var previews: some View {
        UserInfoRow(key: "", value: "").previewLayout(.fixed(width: 200, height: 70))
    }
}
#endif
