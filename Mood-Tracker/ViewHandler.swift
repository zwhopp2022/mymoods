//
//  NavBar.swift
//  Mood-Tracker
//
//  Created by Machintos on 5/1/23.
//

import Foundation
import SwiftUI

//struct ViewHandler: View {
//    var body: some View {
//        TabView {
//            FacesView()
//                .tabItem() {
//                    Image("smile")
//                }
//            StreaksView()
//                .tabItem() {
//                    Image("medal")
//                }
//            AnalyticsView()
//                .tabItem() {
//                    Image("pie")
//                }
//            EverythingView()
//                .tabItem() {
//                    Image("book")
//                }
//        }
//    }
//}


struct ViewHandler: View {
    var body: some View {
        NavigationView {
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading)
            }
    }
}


struct NavBarView_Previews: PreviewProvider {
    static var previews: some View {
        ViewHandler()
    }
}

