//
//  SignUpView.swift
//  Wally
//
//  Created by Solomon Chai on 2021-11-27.
//

import SwiftUI

struct SignUpView: View {
    @State var email = ""
    @State var password = ""
    @ObservedObject var viewmodel = LoginViewModel()
    @State var isLoggedIn = false
    
    var body: some View {
        ZStack {
            VStack(alignment: .center) {
                Image(systemName: "heart.fill")
                    .frame(width: 50, height: 50)
                Spacer()
                
                Group {
                    TextField("Email Address", text: $email)
                        .keyboardType(.emailAddress)
                    
                    ShowableSecureField(password: $password, placeHolder: "Password")
                }
                .padding()
                .background(Color.yellow)
                .cornerRadius(5)
                
                switch viewmodel.status {
                case .error(let message):
                    Text(message)
                        .font(.system(size: 10))
                        .foregroundColor(.red)
                default:
                    EmptyView()
                }
                
                Button {
                    viewmodel.loginUser(email: email, password: password) {
                        isLoggedIn = self.viewmodel.status == .success
                    }
                } label: {
                    ZStack(alignment: .center) {
                        Capsule()
                            .foregroundColor(.yellow)
                            .frame(height: 30)
                        Text("Sign in")
                    }
                }
                .disabled(email.count == 0 || password.count == 0)
                .padding()
                
                NavigationLink(destination: Text("Second View"), isActive: $isLoggedIn) { EmptyView() }
            }
            .padding()
            
            
            if viewmodel.isLoading {
                Group {
                    Color(red: 0, green: 0, blue: 0, opacity: 0.4)
                    ActivityIndicator(isAnimating: $viewmodel.isLoading, style: .large)
                }
                .ignoresSafeArea()
            }
        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}