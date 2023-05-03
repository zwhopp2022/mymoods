//
//  NavBar.swift
//  Mood-Tracker
//
//  Created by Machintos on 5/1/23.
//

import Foundation
import SwiftUI

struct NavBarView: View {
    var body: some View {
        TabView {
            FacesView()
                .tabItem() {
                    Image("Happy")
                    Text("Faces View")
                }
            TestXP()
                .tabItem() {
                    Image("Sad")
                    Text("XP")
                }
            SadLog()
                .tabItem() {
                    Image("Neutral")
                    Text("Pie Charts")
                }
            EverythingView()
                .tabItem() {
                    Image("Happiest")
                    Text("All Inputs")
                }
                .frame(height: 80)
        }
    }
}

struct NavBarView_Previews: PreviewProvider {
    static var previews: some View {
        NavBarView()
    }
}

