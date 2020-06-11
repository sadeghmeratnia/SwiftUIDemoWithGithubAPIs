//
//  NavigateModifier.swift
//  SwiftUIDemoWithGithubAPIs
//
//  Created by Sadegh on 3/22/1399 AP.
//  Copyright © 1399 Sadegh. All rights reserved.
//

import SwiftUI

struct NavigateModifier<SomeView>: ViewModifier where SomeView: View {
    
    let destination: SomeView
    @Binding var binding: Bool
    
    func body(content: Content) -> some View {
        BaseNavigationView {
            ZStack {
                content
                    .navigationBarTitle("")
                    .navigationBarHidden(true)
                NavigationLink(destination: destination
                    .navigationBarTitle("")
                    .navigationBarHidden(true),
                               isActive: $binding) {
                                EmptyView()
                }
            }
        }
    }
}
