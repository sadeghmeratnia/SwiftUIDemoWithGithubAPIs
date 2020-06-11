//
//  ViewExtensions.swift
//  SwiftUIDemoWithGithubAPIs
//
//  Created by Sadegh on 3/22/1399 AP.
//  Copyright © 1399 Sadegh. All rights reserved.
//

import SwiftUI

extension View {
    
    func navigate<SomeView: View>(to view: SomeView, when binding: Binding<Bool>) -> some View {
        modifier(NavigateModifier(destination: view, binding: binding))
    }
    
    func getHorizontalImageAndTextView(text: String, font: Font, imageName: String) -> some View {
        var customView: some View {
            HStack {
                Image(imageName)
                BaseText(text: text, font: font)
            }
        }
        
        return customView
    }
}
