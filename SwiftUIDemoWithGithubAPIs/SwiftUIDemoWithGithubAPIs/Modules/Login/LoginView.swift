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
                
                self.topImage
                Spacer()
                
                self.textField
                self.loginButton
                
                Spacer()
                Spacer()
            }
            
            if self.viewModel.isLoading {
                Color.gray.opacity(0.2).edgesIgnoringSafeArea(.all).blur(radius: 5)
                LoadingView()
            }
        }
        .navigate(to: initilizeTheHomeView, when: self.$viewModel.showHomeView)
    }
    
    private var topImage: some View {
        ImageRefrences.github.getImage
            .resizable()
            .frame(width: 140, height: 140)
            .padding()
    }
    
    private var textField: some View {
        SecureField("Enter your token", text: $token)
            .font(.robotoMedium(16))
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .padding()
    }
    
    private var loginButton: some View {
        Button(action: {
            if self.checkValidation() {
                APIRouter.token.send(self.token)
                self.viewModel.getData()
            }
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
    }
    
    private var initilizeTheHomeView: some View {
        let homeViewModel = HomeViewModel(userModel: self.viewModel.userModel.value, repoModel: self.viewModel.repoModel.value)
        return HomeView(viewModel: homeViewModel)
    }
    
    private func checkValidation() -> Bool {
        return self.token != ""
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
