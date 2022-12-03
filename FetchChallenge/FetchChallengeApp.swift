//
//  FetchChallengeApp.swift
//  FetchChallenge
//
//  Created by Brady Robshaw on 12/2/22.
//

import SwiftUI

@main
struct FetchChallengeApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(ViewModel())
        }
    }
}
