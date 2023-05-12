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
    
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
    var body: some View {
        NavigationView {
            ZStack {
                backgroundGradient1.ignoresSafeArea()
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
                        .foregroundColor(Color.black)

                    TextField("How are you feeling?", text: $userInput, axis: .vertical)
                        .padding()
                        .frame(width: 300, height: 100)
                        .multilineTextAlignment(.center)
                        .background(Color("Background"))
                        .cornerRadius(10)
                    Button(action: {
                        let Time = TimeAndDate()
                        moodDB.addInput(moodValue: "Neutral", inputValue: self.userInput, moodTable: moodDB.neutral, time: Time.hourAndDate, month: Time.numMonth, calendarDay: Time.numDay)
                                       
                    self.mode.wrappedValue.dismiss()
                    }, label: {
                            Text("Store")
                    })
                        .foregroundColor(.white)
                        .frame(width: 300, height: 50)
                        .background(Color.black.opacity(0.5))
                                   
                    Spacer()
                            .frame(height: 125)
                }
                VStack {
                    Spacer()
                        .frame(height: 600)
                    HStack() {
                        NavigationLink ("Entries"){
                            NeutralDisplay()
                        }
                        Button ("Back"){
                            self.mode.wrappedValue.dismiss()
                        }
                    }
                    Spacer()
                        .frame(height:60)
                    NavBar()

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
