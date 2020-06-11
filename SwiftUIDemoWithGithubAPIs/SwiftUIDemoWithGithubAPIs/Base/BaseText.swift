//
//  BaseText.swift
//  SwiftUIDemoWithGithubAPIs
//
//  Created by Sadegh on 3/22/1399 AP.
//  Copyright © 1399 Sadegh. All rights reserved.
//

import SwiftUI

struct BaseText: View {
    var text: String
    var font: Font
    var color: Color = ColorRefrences.baseText.getColor
    
    var body: some View {
        Text(self.text)
            .font(self.font)
            .foregroundColor(self.color)
    }
}
