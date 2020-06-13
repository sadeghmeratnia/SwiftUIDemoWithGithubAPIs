//
//  LoadingView.swift
//  SwiftUIDemoWithGithubAPIs
//
//  Created by Sadegh on 3/23/1399 AP.
//  Copyright © 1399 Sadegh. All rights reserved.
//

import SwiftUI

struct ActivityIndicator: UIViewRepresentable {
    @Binding var isAnimating: Bool
    let style: UIActivityIndicatorView.Style
    
    func makeUIView(context: UIViewRepresentableContext<ActivityIndicator>) -> UIActivityIndicatorView {
        return UIActivityIndicatorView(style: self.style)
    }
    
    func updateUIView(_ uiView: UIActivityIndicatorView, context: UIViewRepresentableContext<ActivityIndicator>) {
        self.isAnimating ? uiView.startAnimating() : uiView.stopAnimating()
    }
}

struct LoadingView: View {
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                ActivityIndicator(isAnimating: .constant(true), style: .large)
            }
            .frame(width: geometry.size.width / 2,
                   height: geometry.size.height / 5)
                .background(Color.secondary.colorInvert())
                .foregroundColor(Color.primary)
                .cornerRadius(20)
        }
    }
}
