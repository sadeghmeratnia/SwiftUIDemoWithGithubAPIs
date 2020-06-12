//
//  HomeView.swift
//  SwiftUIDemoWithGithubAPIs
//
//  Created by Sadegh on 3/23/1399 AP.
//  Copyright © 1399 Sadegh. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var viewModel = HomeViewModel()
    
    var body: some View {
        BaseNavigationView {
            GeometryReader { geometry in
                VStack {
                    Spacer()
                    if self.viewModel.currentView == .userInfo {
                        UserInfoView()
                    } else if self.viewModel.currentView == .repos {
                        UserRepositoriesView()
                    }
                    Spacer()
                    
                    HStack(alignment: .top) {
                        self.getUserInfoTabBarItem
                            .frame(width: geometry.size.width / 2, height: geometry.size.height / 10)
                        
                        self.getUserReposTabBarItem
                            .frame(width: geometry.size.width / 2, height: geometry.size.height / 10)
                    }
                    .frame(width: geometry.size.width, height: geometry.size.height / 10)
                    .background(Color.white.shadow(radius: 2))
                }
                .edgesIgnoringSafeArea(.bottom)
            }
        }
    }
    
    private var getUserInfoTabBarItem: some View {
        Image(systemName: "house")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .padding(EdgeInsets(top: 12, leading: 20, bottom: 28, trailing: 20))
            .foregroundColor(self.viewModel.currentView == .userInfo ? .black : .gray)
            .onTapGesture {
                self.viewModel.currentView = .userInfo
        }
    }
    
    private var getUserReposTabBarItem: some View {
        Image(systemName: "gear")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .padding(EdgeInsets(top: 12, leading: 20, bottom: 28, trailing: 20))
            .foregroundColor(self.viewModel.currentView == .repos ? .black : .gray)
            .onTapGesture {
                self.viewModel.currentView = .repos
        }
    }
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
