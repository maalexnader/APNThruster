//
//  InputElement.swift
//  APNThruster
//
//  Created by Alexander Martirosov on 02/07/2022.
//

import SwiftUI

struct Input: View {
    let title: String
    @Binding var value: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .typography(.code)
                .foregroundColor(.textPrimary)
            TextField("", text: $value)
                .textFieldStyle(DefaultInputStyle())
                .foregroundColor(.textPrimary)
        }
    }
}

struct Input_Previews: PreviewProvider {
    @Binding var value: String
    static var previews: some View {
        Input(title: "title", value: .constant("value"))
            .frame(width: 270, height: 70)
    }
}
