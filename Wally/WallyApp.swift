//
//  WallyApp.swift
//  Wally
//
//  Created by Solomon Chai on 2021-10-18.
//

import SwiftUI

@main
struct WallyApp: App {
    var body: some Scene {
        WindowGroup {
            if let user = FirebaseManager.shared.auth.currentUser {
                MainExploreView(user: CurrentUser())
            } else {
                LandingView()
            }
        }
    }
}
