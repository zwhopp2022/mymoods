//
//  EverythingView.swift
//  Mood-Tracker
//
//  Created by Zachary Hopp on 3/7/23.
//

import SwiftUI

struct EverythingView: View {
    
    @State private var isScrollExpanded = false
    @State private var selectedScrollNum = 1
    //private var listOfInputs: [FeelingInput]  = moodDB.retrieveReasons(moodTable: "saddest")
    
    let backgroundGradient1 = LinearGradient(colors: [Color.green, Color.yellow, Color.gray, Color.cyan, Color.blue, Color.red, Color.red], startPoint: .top, endPoint: .bottom)
    
    var body: some View {
        ZStack{
            backgroundGradient.ignoresSafeArea()
                .blur(radius: 85)
            VStack{
                Image("EveryFace")
                    .padding()
                    .frame(width: 350)
                    .frame(height: 110)
                Text("Your Inputs")
                    .font(.title3)
                Spacer()
                    .frame(height: 565)
            }
            VStack{
                Spacer()
                    .frame(height: 175)
                DisclosureGroup("\(selectedScrollNum)", isExpanded: $isScrollExpanded) {
                    ScrollView{
                        VStack{
                            ForEach(1...500, id: \.self) { num in Text("\(num)")
                                    .frame(maxWidth: .infinity)
                                    .font(.title3)
                                    .padding(.all).onTapGesture {
                                        self.selectedScrollNum = num
                                        withAnimation {
                                            self.isScrollExpanded.toggle()
                                        }
                                    }
                            }
                        }
                    }.frame(height:150)
                }.accentColor(.white)
                    .font(.title2)
                    .foregroundColor(.white)
                    .padding(.all)
                    .background(Color.blue)
                    .cornerRadius(20)
                Spacer()
            }.padding(.all)
        }
        
        
    }
}

struct EverythingView_Previews: PreviewProvider {
    static var previews: some View {
        EverythingView()
    }
}
