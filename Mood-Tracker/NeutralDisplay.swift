//  NeutralDisplay.swift
//  Mood-Tracker
//
//  Created by Rudra Pratap Singh on 3/3/23.
//

import SwiftUI

struct NeutralDisplay: View {
    
    @State private var isScrollExpanded = false
    @State private var selectedScrollNum = 1
    
    var body: some View {
        NavigationView {
            ZStack{
                backgroundGradient1.ignoresSafeArea()
                VStack{
                    Image("neutral")
                        .padding()
                        .frame(width: 350)
                        .frame(height: 110)
                    
                    Spacer()
                        .frame(height: 565)
                }
                VStack {
                    Spacer()
                        .frame(height: 175)
                    Text("When you felt Neutral")
                        .font(.largeTitle)
                    Text("Your Activities")
                        .font(.title3)
                    DisclosureGroup("\(selectedScrollNum)", isExpanded:
                                        $isScrollExpanded) {
                        ScrollView {
                            VStack {
                                ForEach(moodDB.retrieveReasons(moodTable: "neutral"), id: \.self) { input in
                                    Text("\(input.reason)")
                                        .frame(maxWidth: .infinity)
                                        .font(.title3)
                                        .padding(.all).onTapGesture {
                                            withAnimation {
                                                self.isScrollExpanded.toggle()
                                                
                                            }
                                        }
                                }
                            }
                        }.frame(height:400)
                    }.accentColor(.white)
                        .font(.title2)
                        .foregroundColor(.white)
                        .padding(.all)
                        .background(Color.blue)
                        .cornerRadius(20)
                    
                    Spacer()
                }.padding(.all)
                HStack() {
                    NavigationLink ("Back"){
                        NeutralLog()
                    }
                }
            }
        }
    }
}

struct NeutralDisplay_Previews: PreviewProvider {
    static var previews: some View {
        NeutralDisplay()
    }
}
