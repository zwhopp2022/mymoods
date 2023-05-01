//
//  ProgressTestView.swift
//  Mood-Tracker
//
//  Created by Jack McLean on 5/1/23.
//

import SwiftUI

struct ProgressTestView: View {
    var width: CGFloat = 200
    var height: CGFloat = 20
    var percent: CGFloat = 0
    var color1 = Color.teal
    var color2 = Color.teal
    
    var body: some View {
        let multiplier = width/100
        ZStackLayout(alignment: .leading) {
            RoundedRectangle(cornerRadius: height, style: .continuous)
                .frame(width: width, height: height)
                .foregroundColor(Color.white)
            RoundedRectangle(cornerRadius: height, style: .continuous)
                .frame(width: percent * multiplier, height: height)
                .background(
                    LinearGradient(gradient: Gradient(colors: [color1, color2]), startPoint: .leading, endPoint: .trailing)
                        .clipShape(RoundedRectangle(cornerRadius: height, style: .continuous)))
        }
        .foregroundColor(.clear)
    }
}

struct ProgressTestView_Previews: PreviewProvider {
    static var previews: some View {
        ProgressTestView()
    }
}
