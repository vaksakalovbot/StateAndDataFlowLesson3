//
//  UserManager.swift
//  StateAndDataFlow
//
//  Created by Alexey Efimov on 27.07.2020.
//  Copyright © 2020 Alexey Efimov. All rights reserved.
//

import Foundation
import Combine

final class UserManager: ObservableObject {
    @Published var isRegister = false
    
    var name = "" {
        didSet {
            UserDefaults.standard.set(name, forKey: "username")
        }
    }
    
    init(){
        if let username = UserDefaults.standard.string(forKey: "username") {
            if !username.isEmpty {
                name = username
                isRegister = true
            }
        }
    }
    
    init(name: String) {
        self.name = name
    }
    
}
