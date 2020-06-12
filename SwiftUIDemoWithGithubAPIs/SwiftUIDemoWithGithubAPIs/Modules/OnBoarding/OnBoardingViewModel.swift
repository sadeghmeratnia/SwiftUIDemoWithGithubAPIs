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
    private lazy var waitingGroup = DispatchGroup()
    
    init() {
        self.getRepositries()
        self.getUsers()
        self.notifyWhenAllRequestsSucceed()
    }
}

extension OnBoardingViewModel {
    
    private func notifyWhenAllRequestsSucceed() {
        self.waitingGroup.notify(queue: .main) { [weak self] in
            self?.showHomeView = true
        }
    }
    
    private func getUsers() {
        self.waitingGroup.enter()
        let request: AnyPublisher<UserModel, NetworkError> = NetworkRequestAgent.run(.getUserInfo)
        
        request.sink(receiveCompletion: { completion in
            switch completion {
            case .failure(let error):
                print(error)
                
            case .finished:
                self.waitingGroup.leave()
            }
        }, receiveValue: { userModel in
            self.userModel.send(userModel)
        }).store(in: &disposables)
    }
    
    private func getRepositries() {
        self.waitingGroup.enter()
        let request: AnyPublisher<[ReposModel], NetworkError> = NetworkRequestAgent.run(.getRepositories)
        
        request.sink(receiveCompletion: { completion in
            switch completion {
            case .failure(let error):
                print(error)
                
            case .finished:
                self.waitingGroup.leave()
            }
        }, receiveValue: { reposModel in
            print(reposModel)
            //            self.userModel.send(userModel)
        }).store(in: &disposables)
    }
}
