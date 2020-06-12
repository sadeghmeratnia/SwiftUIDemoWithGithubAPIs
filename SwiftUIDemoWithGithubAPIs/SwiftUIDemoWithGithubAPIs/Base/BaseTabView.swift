//
//  BaseTabView.swift
//  SwiftUIDemoWithGithubAPIs
//
//  Created by Sadegh on 3/23/1399 AP.
//  Copyright © 1399 Sadegh. All rights reserved.
//

import SwiftUI

struct BaseTabView<Content>: View where Content: View {
    private let content: Content
    
    internal init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        TabView {
            content
        }
        .accentColor(.red)
    }
}
