//
//  ContentView.swift
//  StateAndDataFlow
//
//  Created by Alexey Efimov on 27.07.2020.
//  Copyright © 2020 Alexey Efimov. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject private var timer = TimeCounter()
    @EnvironmentObject var user: UserManager
    
    var body: some View {
        VStack {
            Text("Hi, \(user.name)")
                .font(.largeTitle)
                .offset(x: 0, y: 100)
            Text("\(timer.counter)")
                .font(.largeTitle)
                .offset(x: 0, y: 200)
            Spacer()
            
            ButtonView(timer: timer)
            
            Spacer()
            
            ButtonLogoutView()            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        .environmentObject(UserManager())
    }
}

struct ButtonView: View {
    @ObservedObject var timer: TimeCounter
    
    var body: some View {
        VStack {
            Button(action: { self.timer.startTimer() }) {
                Text("\(timer.buttonTitle)")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
            }
            .frame(width: 200, height: 60)
            .background(Color.red)
            .cornerRadius(20)
            .overlay(
                RoundedRectangle(cornerRadius: 20, style: .continuous)
                    .stroke(Color.black, lineWidth: 4)
            )
        }
    }
}


// Добавляем кнопку со смещением y: -20 
struct ButtonLogoutView: View {
    @EnvironmentObject var user: UserManager

    var body: some View {
        VStack {
            Button(action: {
                self.user.name = ""
                self.user.isRegister = false
            }) {
                Text("LogOut")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
            }
            .frame(width: 200, height: 60)
            .background(Color.blue)
            .cornerRadius(20)
            .overlay(
                RoundedRectangle(cornerRadius: 20, style: .continuous)
                    .stroke(Color.black, lineWidth: 4)
            )
            .offset(x: 0, y: -20)
        }
    }
}

