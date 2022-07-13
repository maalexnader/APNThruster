//
//  ContentView.swift
//  APNThruster
//
//  Created by Alexander Martirosov on 01/07/2022.
//

import SwiftUI

struct Main: View {
    @ObservedObject var model: MainViewModel

    var body: some View {
        VStack(alignment: .leading) {
            Text("Let's push things forward!")
                .typography(.heading)
                .foregroundColor(.textPrimary)
            ScrollView {
                VStack(spacing: 24) {
                    Input(title: "device", value: $model.device)
                    VStack(alignment: .leading) {
                        Text("alert")
                            .typography(.subheading)
                            .foregroundColor(.textPrimary)
                        VStack(alignment: .leading, spacing: 20) {
                            Input(title: "title", value: $model.alertTitle)
                            Input(title: "subtitle", value: $model.alertSubtitle)
                            Input(title: "body", value: $model.alertBody)
                        }
                        .padding(.leading, 8)
                        .padding(.top, 4)
                    }
                    VStack(spacing: 20) {
                        Input(title: "badge", value: $model.badge)
                        Input(title: "sound", value: $model.sound)
                    }
                }
                Button(action: model.handlePush) {
                    Text("Push")
                        .typography(.subheading)
                        .foregroundColor(.textInverted)
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 48, maxHeight: 48,  alignment: .center)
                        .background(Color.backgroundInverted)
                        .cornerRadius(12)
                }
                .buttonStyle(.plain)
                .padding(.vertical)

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
            Main(
                model:
                    MainViewModel(
                        encoder: EncoderMock(),
                        fileManager: FileManagerMock()
                    )
            )
            .frame(width: 430, height: 710)
            .preferredColorScheme($0)
        }
    }
}
