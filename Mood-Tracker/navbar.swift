//
//  ContentView.swift
//  navbar
//
//  Created by Rudra Pratap Singh on 4/17/23.
//

import SwiftUI

struct navbar: View {
    var body: some View {
        TabView {
            FacesView()
                .tabItem(){
                    Image(systemName: "house.fill")
                    
                }
            FacesNavbar()
                .tabItem(){
                    Image(systemName: "face.dashed.fill")
                    
                }
            PieCharts()
                .tabItem(){
                    Image(systemName: "chart.pie.fill")
                    
                }
            XPpage()
                .tabItem(){
                    Image(systemName: "medal.fill")
                    
                }
            
        }
    }
}

struct navbar_Previews: PreviewProvider {
    static var previews: some View {
        navbar()
    }
}
