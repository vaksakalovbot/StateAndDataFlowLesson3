//
//  UserManager.swift
//  StateAndDataFlow
//
//  Created by Alexey Efimov on 27.07.2020.
//  Copyright © 2020 Alexey Efimov. All rights reserved.
//

import Foundation
import Combine

// Алексей, я подумал, что не стоит для такой простой задачи создавать новые классы
// и дополнил уже созданный тобой класс необходимыми свойствами

final class UserManager: ObservableObject {
    @Published var isRegister = false
    @Published var isNameCorrect = false
    
    //  Отделяю enteredName от name, чтобы лишний раз не дергать UserDefaults по мере ввода данных в поле TextField
    @Published var enteredName = "" {
        didSet {
            if enteredName.count >= 3 {
                isNameCorrect = true
            } else {
                isNameCorrect = false
            }
        }
    }

    var name = "" {
        didSet {
            UserDefaults.standard.set(name, forKey: "username")
            enteredName = name
        }
    }
    
    // Видел на уроке, что у тебя в SceneDelegate происходит считывание данных о пользователе перед вызовом rootViewController
    // Но считать это нужно только один раз при запуске приложения
    // Так почему бы это не сделать в инициализаторе?
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
