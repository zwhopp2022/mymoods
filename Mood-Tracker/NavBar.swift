//
//  NavBar.swift
//  Mood-Tracker
//
//  Created by Machintos on 5/4/23.
//

import Foundation
import SwiftUI

struct NavBarView: View {
    var body: some View {
        TabView {
            AnalyticsView()
                .tabItem() {
                    Image("medal")
                }
            FacesView()
                .tabItem() {
                    Image("smile")
                }
            EverythingView()
                .tabItem() {
                    Image("book")
                }
            SadLog()
                .tabItem() {
                    Image("pie")
                }
        }
    }
}

struct NavBarView_Previews: PreviewProvider {
    static var previews: some View {
        NavBarView()
    }
}
