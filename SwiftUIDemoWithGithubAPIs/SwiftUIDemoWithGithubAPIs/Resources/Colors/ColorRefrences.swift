//
//  ColorRefrences.swift
//  SwiftUIDemoWithGithubAPIs
//
//  Created by Sadegh on 3/22/1399 AP.
//  Copyright © 1399 Sadegh. All rights reserved.
//

import SwiftUI

enum ColorRefrences: String {
    case baseText          = "baseText"
    case yellowAccessLevel = "yellowAccessLevel"
    case greenAccessLevel  = "greenAccessLevel"
}

extension ColorRefrences {
    var getColor: Color {
        return Color(self.rawValue)
    }
}

