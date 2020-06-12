//
//  ImageRefrences.swift
//  SwiftUIDemoWithGithubAPIs
//
//  Created by Sadegh on 3/22/1399 AP.
//  Copyright © 1399 Sadegh. All rights reserved.
//

import Foundation
import SwiftUI

enum ImageRefrences: String {
    case github     = "github"
    case user       = "user"
    case repository = "repository"
    
    var getImage: Image {
        return Image(self.rawValue)
    }
}
