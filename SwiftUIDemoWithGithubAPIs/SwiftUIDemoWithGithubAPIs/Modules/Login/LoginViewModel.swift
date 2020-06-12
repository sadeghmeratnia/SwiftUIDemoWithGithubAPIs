//
//  LoginViewModel.swift
//  SwiftUIDemoWithGithubAPIs
//
//  Created by Sadegh on 3/23/1399 AP.
//  Copyright © 1399 Sadegh. All rights reserved.
//

import Foundation
import Combine

class LoginViewModel: ObservableObject {
    @Published var isLoading = false
    @Published var showHomeView = false
    var userModel = CurrentValueSubject<UserModel?, Never>(nil)
    var repoModel = CurrentValueSubject<[RepoModel]?, Never>(nil)
    
    private var disposables = Set<AnyCancellable>()
    private lazy var waitingGroup = DispatchGroup()
}

extension LoginViewModel {
    
    internal func getData() {
        self.waitingGroup = DispatchGroup()
        
        self.isLoading = true
        self.getRepositries()
        self.getUsers()
        self.notifyWhenAllRequestsSucceed()
    }
    
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
                self.isLoading = false
                
            case .finished:
                self.waitingGroup.leave()
            }
        }, receiveValue: { userModel in
            self.userModel.send(userModel)
        }).store(in: &disposables)
    }
    
    private func getRepositries() {
        self.waitingGroup.enter()
        let request: AnyPublisher<[RepoModel], NetworkError> = NetworkRequestAgent.run(.getRepositories)
        
        request.sink(receiveCompletion: { completion in
            switch completion {
            case .failure(let error):
                print(error)
                self.isLoading = false
                
            case .finished:
                self.waitingGroup.leave()
            }
        }, receiveValue: { repos in
            self.repoModel.send(repos)
        }).store(in: &disposables)
    }
}
