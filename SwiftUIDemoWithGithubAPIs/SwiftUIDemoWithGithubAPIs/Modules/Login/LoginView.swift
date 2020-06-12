//
//  LoginView.swift
//  SwiftUIDemoWithGithubAPIs
//
//  Created by Sadegh on 3/23/1399 AP.
//  Copyright © 1399 Sadegh. All rights reserved.
//

import SwiftUI

struct LoginView: View {
    @State var token = ""
    @ObservedObject var viewModel: LoginViewModel
    
    init(viewModel: LoginViewModel = LoginViewModel()) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        ZStack {
            VStack {
                ImageRefrences.github.getImage
                    .resizable()
                    .frame(width: 100, height: 100)
                    .padding()
                
                Spacer()
                
                TextField("Enter your token", text: $token)
                    .font(.robotoMedium(16))
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                Button(action: {
                    APIRouter.token.send(self.token)
                    self.viewModel.getData()
                }) {
                    HStack {
                        BaseText(text: "Login", font: Font.robotoBlack(20), color: .white)
                    }
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .frame(height: 36)
                    .foregroundColor(.white)
                    .background(ColorRefrences.darkGreen.getColor)
                    .cornerRadius(10)
                    .padding()
                }
                
                Spacer()
                Spacer()
            }
            
            if self.viewModel.isLoading {
                LoadingView()
            }
        }
        .navigate(to: initilizeTheHomeView, when: self.$viewModel.showHomeView)
    }
    
    private var initilizeTheHomeView: some View {
        let homeViewModel = HomeViewModel(userModel: self.viewModel.userModel.value, repoModel: self.viewModel.repoModel.value)
        return HomeView(viewModel: homeViewModel)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
