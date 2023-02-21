//
//  NeutralView.swift
//  Mood-Tracker
//
//  Created by Jack McLean on 2/20/23.
//

import SwiftUI

let backgroundGradient1 = LinearGradient(colors: [Color.cyan, Color.gray, Color.orange], startPoint: .top, endPoint: .bottom)

struct NeutralLog: View {
    @State private var userInput = ""
    
    var body: some View {
        NavigationView {
            ZStack {
                backgroundGradient1
                    .ignoresSafeArea()
                Circle()
                    .scale(1.8)
                    .foregroundColor(.white.opacity(0.15))
                Circle()
                    .scale(1.4)
                    .foregroundColor(.white.opacity(0.15))
                VStack {
                    Image("neutral")
                        .frame(height: 125)
                    Text("What's going on?")
                        .font(.largeTitle)
                        .bold()
                        .padding()
                    TextField("How are you feeling?", text: $userInput)
                        .padding()
                        .frame(width: 300, height: 100)
                        .multilineTextAlignment(.center)
                        .background(Color.white)
                        .cornerRadius(10)
                    Button("Store") {
                    }
                    .foregroundColor(.white)
                    .frame(width: 300, height: 50)
                    .background(Color.yellow.opacity(0.6))
                    
                    Spacer()
                        .frame(height: 125)
                }
            }
        }
        .navigationBarHidden(true)
    }
}

struct NeutralLog_Previews: PreviewProvider {
    static var previews: some View {
        NeutralLog()
    }
}
