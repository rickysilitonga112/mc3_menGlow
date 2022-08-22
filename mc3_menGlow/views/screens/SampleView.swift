//
//  SampleView.swift
//  mc3_menGlow
//
//  Created by Ricky Silitonga on 22/08/22.
//

import SwiftUI

struct SampleView: View {
    init() {
        UITabBar.appearance().backgroundColor = UIColor.blue
    }
    var body: some View {
        NavigationView {
            TabView {
                Dashboard2()
                    .tag(0)
                    .tabItem{Text("tab1")}
                RoutineListView()
                    .tag(1)
                    .tabItem{Text("tab2")}
                Text("This is tab 3").tag(2)
                    .tabItem{Text("tab3")}
            }
        }
    }
}

struct SampleView_Previews: PreviewProvider {
    static var previews: some View {
        SampleView()
    }
}
