//
//  StringExtensions.swift
//  SwiftUIDemoWithGithubAPIs
//
//  Created by Sadegh on 3/23/1399 AP.
//  Copyright © 1399 Sadegh. All rights reserved.
//

import Foundation

extension String {
    
    var localized: String {
        return NSLocalizedString(self, tableName: "Base", bundle: Bundle.main, value: "", comment: "")
    }
    
    func localizedWithArgs(_ args: [CVarArg]) -> String {
        return String(format: self.localized, arguments: args)
    }
}
