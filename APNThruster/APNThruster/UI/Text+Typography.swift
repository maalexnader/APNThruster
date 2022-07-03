//
//  Typography.swift
//  APNThruster
//
//  Created by Alexander Martirosov on 01/07/2022.
//

import SwiftUI

extension View {
    func typography(_ typography: Typography) -> some View {
        self
            .font(typography.font)
    }
}
