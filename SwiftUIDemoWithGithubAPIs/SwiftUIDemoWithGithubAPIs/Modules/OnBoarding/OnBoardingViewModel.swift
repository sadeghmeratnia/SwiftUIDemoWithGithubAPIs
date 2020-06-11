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
    @Published  var showHomeView = false
    var userModel = CurrentValueSubject<UserModel?, Never>(nil)
    
    private var disposables = Set<AnyCancellable>()
    
    init() {
        self.getRepositries()
    }
    
    private func getUsers() {
        let request: AnyPublisher<UserModel, NetworkError> = NetworkRequestAgent.run(.getUserInfo)
        
        request.sink(receiveCompletion: { completion in
            switch completion {
            case .failure(let error):
                print(error)
                
            case .finished: break
            }
        }, receiveValue: { userModel in
            self.showHomeView = true
            self.userModel.send(userModel)
        }).store(in: &disposables)
    }
    
    private func getRepositries() {
        let request: AnyPublisher<[test], NetworkError> = NetworkRequestAgent.run(.getRepositories)
        
        request.sink(receiveCompletion: { completion in
            switch completion {
            case .failure(let error):
                print(error)
                
            case .finished: break
            }
        }, receiveValue: { userModel in
            self.showHomeView = true
//            self.userModel.send(userModel)
        }).store(in: &disposables)
    }
}

struct test: Decodable {
    var id: Int64?
    var node_id: String?
    var name: String?
    var full_name: String?
    var `private`: Bool?
}
