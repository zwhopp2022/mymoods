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
                    Image("smile")
                }
            TestXP()
                .tabItem() {
                    Image("medal")
                }
            SadLog()
                .tabItem() {
                    Image("pie")
                }
            EverythingView()
                .tabItem() {
                    Image("book")
                }
        }
    }
}

struct NavBarView_Previews: PreviewProvider {
    static var previews: some View {
        NavBarView()
    }
}

