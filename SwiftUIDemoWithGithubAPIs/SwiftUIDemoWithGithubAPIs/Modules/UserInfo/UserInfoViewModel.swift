//
//  UserInfoViewModel.swift
//  SwiftUIDemoWithGithubAPIs
//
//  Created by Sadegh on 3/22/1399 AP.
//  Copyright © 1399 Sadegh. All rights reserved.
//

import Foundation
import SwiftUI
import Combine


class UserInfoViewModel: ObservableObject {
    @Published var dataSource: UserModel
    
    init(model: UserModel? = UserModel()) {
        self.dataSource = model ?? UserModel()
    }
    
    func getModelFieldsAndValue() -> [String: Any] {
        do {
            guard var dictionaryModel = try DictionaryEncoder().encode(self.dataSource) else { return  [:] }
            let keysToRemove = dictionaryModel.keys.filter { dictionaryModel[$0] as? String == "" }
            
            for key in keysToRemove {
                dictionaryModel.removeValue(forKey: key)
            }
            return dictionaryModel
            
        } catch(let error) {
            print(error.localizedDescription)
            return [:]
        }
    }
}
