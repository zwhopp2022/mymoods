//
//  SadDisplay.swift
//  Mood-Tracker
//
//  Created by Rudra Pratap Singh on 3/3/23.
//

import SwiftUI

struct SadDisplay: View {
    
    @State private var isScrollExpanded = false
    @State private var selectedScrollNum = 1
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 20){
            Text("When you were Sad")
                .font(.largeTitle)
            Text("Your Activities")
                .font(.title3)
            DisclosureGroup("\(selectedScrollNum)", isExpanded:
                $isScrollExpanded) {
                ScrollView {
                VStack {
                    ForEach(moodDB.retrieveReasons(moodTable: "sad"), id: \.self) { input in
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
            }.frame(height:200)
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

struct SadDisplay_Previews: PreviewProvider {
    static var previews: some View {
        SadDisplay()
    }
}
