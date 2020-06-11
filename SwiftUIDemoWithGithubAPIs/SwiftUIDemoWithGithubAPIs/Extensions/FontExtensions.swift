//
//  FontExtensions.swift
//  SwiftUIDemoWithGithubAPIs
//
//  Created by Sadegh on 3/22/1399 AP.
//  Copyright © 1399 Sadegh. All rights reserved.
//

import SwiftUI

extension Font {
    
    static func robotoBold(_ size: CGFloat) -> Font {
        return Font.custom("Roboto-Bold", size: size)
    }
    
    static func robotoLight(_ size: CGFloat) -> Font {
        return Font.custom("Roboto-Light", size: size)
    }
    
    static func robotoMedium(_ size: CGFloat) -> Font {
        return Font.custom("Roboto-Medium", size: size)
    }
    
    static func roboto(_ size: CGFloat) -> Font {
        return Font.custom("Roboto-Regular", size: size)
    }
    
    static func robotoBlack(_ size: CGFloat) -> Font {
        return Font.custom("Roboto-Black", size: size)
    }
}

