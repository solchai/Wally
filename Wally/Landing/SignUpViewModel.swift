//
//  SignUpViewModel.swift
//  Wally
//
//  Created by Solomon Chai on 2021-11-28.
//

import Foundation

class SignUpViewModel: ObservableObject {
    @Published var status: Status = .pending
    @Published var isLoading = false
    
    func loginUser(email: String, password: String, completion: @escaping () -> ()) {
        guard password.count >= 8 else {
            DispatchQueue.main.async {
                self.status = .error("Password must be longer than 8 characters")
            }
            return
        }
        
        isLoading = true
        
        FirebaseManager.shared.auth.createUser(withEmail: email, password: password) { result, error in
            defer {
                self.isLoading = false
                completion()
            }
            
            if error != nil {
                DispatchQueue.main.async {
                    self.status = .error("Something went wrong")
                }
                return
            }
            
            self.status = .success
        }
    }
    
    enum Status: Equatable {
        case pending
        case error(String)
        case success
    }
}
