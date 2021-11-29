//
//  LandingView.swift
//  Wally
//
//  Created by Solomon Chai on 2021-11-25.
//

import SwiftUI

struct LandingView: View {
    var body: some View {
        NavigationView {
            VStack {
                Image(systemName: "heart.fill")
                    .frame(width: 50, height: 50)
                Spacer()
                
                NavigationLink {
                    LoginView()
                } label: {
                    ZStack(alignment: .center) {
                        Capsule()
                            .foregroundColor(.yellow)
                            .frame(height: 30)
                        Text("Sign in with email")
                    }
                }.padding()
                
                NavigationLink {
                    SignUpView()
                } label: {
                    Text("Create an Account")
                        .foregroundColor(.yellow)
                        .underline()
                }
            }
        }
    }
}

struct LandingView_Previews: PreviewProvider {
    static var previews: some View {
        LandingView()
    }
}
