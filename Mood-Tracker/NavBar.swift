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
                }
            TestXP()
                .tabItem() {
                    Image("Sad")
                }
            SadLog()
                .tabItem() {
                    Image("Saddest")
                }
            EverythingView()
                .tabItem() {
                    Image("Happiest")
                }
        }
    }
}

struct NavBarView_Previews: PreviewProvider {
    static var previews: some View {
        NavBarView()
    }
}

