//
//  DefaultInputStyle.swift
//  APNThruster
//
//  Created by Alexander Martirosov on 02/07/2022.
//

import SwiftUI

struct DefaultInputStyle: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .textFieldStyle(.plain)
            .typography(.body)
            .background(.clear)
            .padding(.horizontal, 12)
            .padding(.vertical, 10)
            .background(
                RoundedRectangle(cornerRadius: 22)
                    .strokeBorder(Color.primary, lineWidth: 1)
            )
    }
}
