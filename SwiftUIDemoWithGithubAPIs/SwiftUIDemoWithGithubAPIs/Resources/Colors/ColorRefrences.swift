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
    case darkGreen         = "darkGreen"
    case lightGreen        = "lightGreen"
    case grayColor         = "grayColor"
}

extension ColorRefrences {
    var getColor: Color {
        return Color(self.rawValue)
    }
}

