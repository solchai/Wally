//
//  FirebaseManager.swift
//  Wally
//
//  Created by Solomon Chai on 2021-11-26.
//

import Foundation
import Firebase

class FirebaseManager: NSObject {
    static let shared = FirebaseManager()

    let auth: Auth
    let storage: Storage
    let firestore: Firestore

    override init() {
        FirebaseApp.configure()
        self.auth = Auth.auth()
        self.storage = Storage.storage()
        self.firestore = Firestore.firestore()
        super.init()
    }
}
