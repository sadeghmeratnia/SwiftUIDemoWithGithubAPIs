//
//  BaseList.swift
//  SwiftUIDemoWithGithubAPIs
//
//  Created by Sadegh on 3/22/1399 AP.
//  Copyright © 1399 Sadegh. All rights reserved.
//

import SwiftUI

struct BaseList<Content>: View where Content: View {
    private let content: Content
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        List {
            content
                .scaledToFill()
                .clipped()
                .listRowInsets(EdgeInsets())
        }
    }
}
