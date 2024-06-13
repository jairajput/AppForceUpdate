//
//  ContentView.swift
//  AppForceUpdate
//
//  Created by Jai  on 13/06/24.
//

import SwiftUI

struct ContentView: View {
    @State private var needsUpdate = false
    @State private var appStoreUrl = ""

    var body: some View {
        VStack {
            if needsUpdate {
                UpdateRequiredView(appStoreUrl: appStoreUrl)
            } else {
                Text("Welcome to the App!")
                    .font(.title)
                    .bold()
                    .padding()
                    .onAppear {
                        checkForUpdates()
                    }
            }
        }
        .animation(.easeInOut, value: needsUpdate)
        .transition(.opacity)
    }

    private func checkForUpdates() {
        AppUpdateManager().checkAppUpdate { updateNeeded, url in
            if updateNeeded {
                DispatchQueue.main.async {
                    self.needsUpdate = true
                    self.appStoreUrl = url
                }
            }
        }
    }
}
