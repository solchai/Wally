//
//  LoginView.swift
//  Wally
//
//  Created by Solomon Chai on 2021-11-27.
//

import SwiftUI

struct LoginView: View {
    @State var email = ""
    @State var password = ""
    @ObservedObject var viewmodel = LoginViewModel()
    @State var isLoggedIn = false
    
    var body: some View {
        VStack(alignment: .center) {
            Image(systemName: "heart.fill")
                .frame(width: 50, height: 50)
            Spacer()
            
            Group {
                TextField("Email Address", text: $email)
                    .keyboardType(.emailAddress)
                
                ShowableSecureField(password: $password, placeHolder: "Password")
            }
            .disableAutocorrection(true)
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
        }
        .padding()
        .modifier(SpinWheel(isLoading: $viewmodel.isLoading))
        .fullScreenCover(isPresented: $isLoggedIn, onDismiss: nil) {
            MainExploreView(user: CurrentUser())
        }
    }
}

struct ShowableSecureField: View {
    @Binding var password: String
    var placeHolder: String
    @State var isSecure = true
    
    var body: some View {
        ZStack {
            if isSecure {
                SecureField(placeHolder, text: $password)
            } else {
                TextField(placeHolder, text: $password)
            }
            
            HStack {
                Spacer()
                Button {
                    isSecure.toggle()
                } label: {
                    Image(systemName: isSecure ? "eye.slash" : "eye")
                }
                .buttonStyle(PlainButtonStyle())
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
