//
//  UserInfoRow.swift
//  SwiftUIDemoWithGithubAPIs
//
//  Created by Sadegh on 3/22/1399 AP.
//  Copyright © 1399 Sadegh. All rights reserved.
//

import SwiftUI

struct UserInfoRow: View {
    
    var body: some View {
        
        GeometryReader { geometry in
            self.KeyValuePairs
                .frame(width: geometry.size.width)
        }
    }
    
    private var KeyValuePairs: some View {
        HStack {
            BaseText(text: "sadegh", font: Font.roboto(20))
            Spacer()
            BaseText(text: "Merat", font: Font.roboto(20))
        }.padding([.leading, .trailing], 16)
    }
}

#if DEBUG
struct UserInfoRow_Previews: PreviewProvider {
    static var previews: some View {
        UserInfoRow().previewLayout(.fixed(width: 200, height: 120))
    }
}
#endif
