//
//  SadView.swift
//  Mood-Tracker
//
//  Created by Jack McLean on 2/20/23.
//

import SwiftUI

struct SadLog: View {
    @State private var userInput = ""
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.cyan
                    .ignoresSafeArea()
                Circle()
                    .scale(1.8)
                    .foregroundColor(.white.opacity(0.15))
                Circle()
                    .scale(1.4)
                    .foregroundColor(.white.opacity(0.15))
                VStack {
                    Image("Sad")
                        .frame(height: 125)
                    Text("What's going on?")
                        .font(.largeTitle)
                        .bold()
                        .padding()
                    TextField("Want to talk about?", text: $userInput)
                        .padding()
                        .frame(width: 300, height: 100)
                        .multilineTextAlignment(.center)
                        .background(Color.white)
                        .cornerRadius(10)
                    Button("Store") {
                    }
                    .foregroundColor(.white)
                    .frame(width: 300, height: 50)
                    .background(Color.black.opacity(0.30))
                    
                    Spacer()
                        .frame(height: 125)
                }
            }
        }
        .navigationBarHidden(true)
    }
}

struct SadLog_Previews: PreviewProvider {
    static var previews: some View {
        SadLog()
    }
}
