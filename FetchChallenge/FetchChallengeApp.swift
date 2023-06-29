//
//  FetchChallengeApp.swift
//  FetchChallenge
//
//  Created by Brady Robshaw on 6/29/23.
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
