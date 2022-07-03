//
//  ContentView.swift
//  APNThruster
//
//  Created by Alexander Martirosov on 01/07/2022.
//

import SwiftUI

struct Main: View {
    @State private var x = ""
    @State private var y = ""
    var body: some View {
        VStack(alignment: .leading) {
            Text("Let's push things forward!")
                .typography(.heading)
                .foregroundColor(.textPrimary)
            ScrollView {
                VStack(spacing: 24) {
                    VStack(alignment: .leading) {
                        Text("alert")
                            .typography(.subheading)
                            .foregroundColor(.textPrimary)
                        VStack(alignment: .leading, spacing: 20) {
                            Input(title: "title", value: x)
                            Input(title: "subtitle", value: y)
                            Input(title: "body", value: x)
                        }
                        .padding(.leading, 8)
                        .padding(.top, 4)
                    }
                    VStack(spacing: 20) {
                        Input(title: "badge", value: x)
                        Input(title: "sound", value: x)
                    }
                }
            }
            Spacer()
            HStack {
                Spacer()
                Text("Designed by Threadify")
                    .typography(.footnote)
                    .foregroundColor(.textPrimary)
            }
            .padding(.bottom)
            .padding(.trailing)
        }
        .padding()
        .background(Color.backgroundPrimary)
    }
}

struct Main_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(ColorScheme.allCases, id: \.self) {
            Main()
                .frame(width: 430, height: 710)
                .preferredColorScheme($0)
        }
    }
}
