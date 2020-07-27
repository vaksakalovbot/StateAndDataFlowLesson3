//
//  RegisterView.swift
//  StateAndDataFlow
//
//  Created by Alexey Efimov on 27.07.2020.
//  Copyright © 2020 Alexey Efimov. All rights reserved.
//

import SwiftUI

struct RegisterView: View {
    @State private var isNameCorrect = false
    @EnvironmentObject var user: UserManager
    
    var body: some View {
        VStack {
            HStack {
                TextField("Enter your name...", text: $user.enteredName)
                    .font(.title)
                    .multilineTextAlignment(.center)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                Text("\(user.enteredName.count)")
                    .font(.title)
                    .foregroundColor(user.isNameCorrect ? .green : .red)
            }.padding(.horizontal)
            
            Button(action: registerUser) {
                HStack {
                    Image(systemName: "checkmark.circle")
                        .font(.title)
                    Text("OK")
                        .font(.title)
                }
            }
            .disabled(!user.isNameCorrect)

        }
        .padding()
    }
}

extension RegisterView {
    private func registerUser() {
        user.name = user.enteredName
        user.isRegister = true
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
        .environmentObject(UserManager())
    }
}
