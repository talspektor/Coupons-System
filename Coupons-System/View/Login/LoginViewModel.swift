//
//  LoginViewModel.swift
//  Coupons-System
//
//  Created by Tal Spektor on 22/04/2021.
//  Copyright © 2021 Tal Spektor. All rights reserved.
//

import Foundation
import Combine
import SwiftUI

class LoginViewModel: ObservableObject {
    @ObservedObject var app = AppObservable()
    @Published var email = ""
    @Published var password = ""
    
    var cancelable = Set<AnyCancellable>()
    
    func login(type: UserType, email: String, password: String) {
        guard !email.isEmpty && !password.isEmpty else { return }
        LoginService.login(type: type, email: email, password: password).sink(receiveCompletion: { (conpletion) in
            switch conpletion {
            case .failure(let error):
                debugPrint(error.localizedDescription)
                // show alert
            case .finished:
                debugPrint("login service finished")
            }
        }) { (loginItem) in
            self.app.isLoggedIn = true
            
        }.store(in: &cancelable)
    }
}
