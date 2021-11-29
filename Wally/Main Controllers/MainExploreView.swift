//
//  MainExploreView.swift
//  Wally
//
//  Created by Solomon Chai on 2021-11-28.
//

import SwiftUI

struct MainExploreView: View {
    var user: CurrentUser
    @State var showColorReminder = false
    @State var accentColor: Color?
    
    var body: some View {
        VStack {
            Text("Explore The wallpapers")
                .foregroundColor(accentColor ?? Color.yellow)
            Text(FirebaseManager.shared.auth.currentUser?.email ?? "Unknown email")
        }
        .modifier(ColorPickerWarning(color: $accentColor, showWarning: $showColorReminder))
        .onAppear(perform: {
            if let color = user.favouriteColour {
                self.accentColor = color
            } else {
                self.showColorReminder = true
            }
        })
    }
}

struct MainExploreView_Previews: PreviewProvider {
    static var previews: some View {
        MainExploreView(user: CurrentUser())
    }
}
