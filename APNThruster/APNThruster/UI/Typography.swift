//
//  Typography.swift
//  APNThruster
//
//  Created by Alexander Martirosov on 01/07/2022.
//

import SwiftUI

enum Typography {
    case heading
    case subheading
    case caption
    case body
    case footnote
    
    var font: Font {
        switch self {
        case .heading:
            return Font.system(size: 20, weight: .semibold)
        case .subheading:
            return Font.system(size: 16, weight: .semibold)
        case .caption:
            return Font.custom("SFMono-Regular", size: 14)
        case .body:
            return Font.system(size: 16, weight: .regular)
        case .footnote:
            return Font.system(size: 14, weight: .semibold)
        }
    }
}
