//
//  OnBoardingViewModel.swift
//  SwiftUIDemoWithGithubAPIs
//
//  Created by Sadegh on 3/22/1399 AP.
//  Copyright © 1399 Sadegh. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

class OnBoardingViewModel: ObservableObject {
    @Published var showHomeView = false
    
    private var disposables = Set<AnyCancellable>()
    
    func getUsers() {
        let request: AnyPublisher<UserModel, NetworkError> = NetworkRequestAgent.run(.getUserInfo)
        
        request.sink(receiveCompletion: { completion in
            switch completion {
            case .failure(let error):
                print(error)
                
            case .finished: break
            }
        }, receiveValue: { userModel in
            self.showHomeView = true
        }).store(in: &disposables)
    }
}
