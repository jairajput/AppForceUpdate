//
//  UpdateRequiredView.swift
//  AppForceUpdate
//
//  Created by Jai  on 13/06/24.
//

import SwiftUI

struct UpdateRequiredView: View {
    var appStoreUrl: String

    var body: some View {
        ZStack(alignment: .bottom) {
            Color.black.opacity(0.5)
                .ignoresSafeArea()

            VStack(spacing: 20) {
                Text("Update Available")
                    .font(.title)
                    .bold()
                    .padding(.top, 20)

                Text("Click Update to Install")
                    .font(.footnote)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)

                Button(action: {
                    if let url = URL(string: appStoreUrl), UIApplication.shared.canOpenURL(url) {
                        UIApplication.shared.open(url)
                    }
                }) {
                    Text("Update Now")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .cornerRadius(8)
                        .shadow(radius: 5)
                }
                .padding(.horizontal)
                .padding(.bottom, 20)
            }
            .padding()
            .background(Color.white)
            .cornerRadius(12)
            .shadow(radius: 20)
            .padding(.horizontal, 40)
            .frame(width: 350,height: 50)  // Adjust the width as needed
            .padding(.bottom, 350)
        }
    }
}
