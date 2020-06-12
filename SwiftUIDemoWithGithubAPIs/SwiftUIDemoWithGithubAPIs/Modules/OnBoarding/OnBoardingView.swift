//
//  OnBoardingView.swift
//  SwiftUIDemoWithGithubAPIs
//
//  Created by Sadegh on 3/22/1399 AP.
//  Copyright © 1399 Sadegh. All rights reserved.
//

import SwiftUI
import Combine

struct OnBoardingView: View {
    @ObservedObject var viewModel: OnBoardingViewModel
    
    init(viewModel: OnBoardingViewModel = OnBoardingViewModel()) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        VStack {
            
            if !self.viewModel.showHomeView {
                self.centerImage
            }
        }
        .navigate(to: initilizeTheHomeView, when: self.$viewModel.showHomeView)
    }
    
    private var centerImage: some View {
        ImageRefrences.github.getImage
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 200, height: 200)
    }
    
    private var initilizeTheHomeView: some View {
        let homeViewModel = HomeViewModel(model: self.viewModel.userModel.value)
        return HomeView(viewModel: homeViewModel)
    }
}

#if DEBUG
struct OnBoardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingView()
    }
}
#endif
