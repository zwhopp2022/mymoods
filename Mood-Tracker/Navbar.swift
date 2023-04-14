//
//  TempNB page.swift
//  Mood-Tracker
//
//  Created by Rudra Pratap Singh on 4/10/23.
//

import SwiftUI

enum Tab: String, CaseIterable {
    case house
    case theatermasks
    case circle
    case medal
}
struct Navbar: View {
    @Binding var selectedTab: Tab
    private var fillImage: String {
        selectedTab.rawValue + ".fill"
    }
    var body: some View {
        VStack {
            HStack {
                ForEach(Tab.allCases, id: \.rawValue) { tab in
                    Spacer()
                    Image(systemName: selectedTab == tab ? fillImage:
                            tab.rawValue)
                    .scaleEffect(selectedTab == tab ? 1.25 : 1.0)
                    .foregroundColor(selectedTab == tab ? .red : .gray)
                    .font(.system(size: 22))
                    .onTapGesture {
                        withAnimation(.easeIn(duration: 0.1)) {
                            selectedTab = tab
                        }
                    }
                        
                    Spacer()
                }
                
            }
            .frame(width: nil,height: 60)
            .background(.thinMaterial)
            .cornerRadius(25)
            .padding()
        }
    }
}

struct TempNB_page_Previews: PreviewProvider {
    static var previews: some View {
        Navbar(selectedTab: .constant(.house))
    }
}
