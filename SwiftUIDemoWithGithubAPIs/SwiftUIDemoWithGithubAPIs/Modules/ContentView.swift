//
//  ContentView.swift
//  SwiftUIDemoWithGithubAPIs
//
//  Created by Sadegh on 3/22/1399 AP.
//  Copyright © 1399 Sadegh. All rights reserved.
//

import SwiftUI
import Combine

struct ContentView: View {
    private var disposables = Set<AnyCancellable>()
    
    init() {
        self.test()
    }
    var body: some View {
        Text("Hello, World!")
    }
    
    
    mutating func test() {
        let request: AnyPublisher<UserModel, NetworkError> = NetworkRequestAgent
            .run(.test)
        request.sink(receiveCompletion: { completion in
            switch completion {
            case .failure(let error):
                print(error)
                
            case .finished: break
            }
        }, receiveValue: { userModel in
            print("userModel")
        }).store(in: &disposables)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

