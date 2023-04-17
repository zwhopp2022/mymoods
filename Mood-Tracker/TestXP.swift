//
//  TestXP.swift
//  Mood-Tracker
//
//  Created by Zachary Hopp on 4/16/23.
//

import SwiftUI

struct TestXP: View {
    var body: some View {
        Text("\(userLevel.getCurrentXp())")
    }
}

struct TestXP_Previews: PreviewProvider {
    static var previews: some View {
        TestXP()
    }
}
