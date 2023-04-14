//
//  HappiestLog.swift
//  Mood-Tracker
//
//  Created by Jack McLean on 2/20/23.
//

import SwiftUI

struct HappiestLog: View {
    @State private var userInput = ""

    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
    func getTodaysDate() -> String?
    {
        let now = Date()
        let calender = Calendar.current
        let compenents = calender.dateComponents([.day], from: now)
        return compenents.day != nil ? String(compenents.day!) : ""
    }
    
    func getHour() -> String?
    {
        let now = Date()
        let calender = Calendar.current
        let hour = calender.component(.hour, from: now)
        return hour != nil ? String(hour) : ""
    }
    
    func getMinute() -> String?
    {
        let now = Date()
        let calender = Calendar.current
        let minute = calender.component(.minute, from: now)
        return minute != nil ? String(minute) : ""
    }
    
    func timeString() -> String?
    {
        let currentDate = getTodaysDate()
        let currentHour = getHour()
        let currentMinute = getMinute()
        
        let total = "\(String(describing: currentDate)), \(String(describing: currentHour)): \(String(describing: currentMinute))"
        
        return total != nil ? String(total) : ""
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.green
                    .ignoresSafeArea()
                Circle()
                    .scale(1.8)
                    .foregroundColor(.white.opacity(0.15))
                Circle()
                    .scale(1.4)
                    .foregroundColor(.white.opacity(0.15))
                VStack {
                    Image("Happiest")
                        .frame(height: 125)
                    Text("What's going on?")
                        .font(.largeTitle)
                        .bold()
                        .padding()
                        .foregroundColor(Color.black)
                    TextField("Yippee! What's happening?", text: $userInput)
                        .padding()
                        .frame(width: 300, height: 100)
                        .multilineTextAlignment(.center)
                        .background(Color("Background"))
                        .cornerRadius(10)

                        Button(action: {
                            moodDB.addInput(moodValue: "Happiest", inputValue: self.userInput, moodTable: moodDB.happiest, time: timeString() ?? "<no time>")
                            //moodDB.everythingInput(moodValue: "Happiest", inputValue: self.userInput)
                                           
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
                        .frame(height: 500)
                    HStack() {
                        NavigationLink ("Entries"){
                            HappiestDisplay()
                        }
                        Button ("Back"){
                            self.mode.wrappedValue.dismiss()
                        }
                    }
                }
            }
        }
        .navigationBarHidden(true)
    }
}

struct HappiestLog_Previews: PreviewProvider {
    static var previews: some View {
        HappiestLog()
    }
}
