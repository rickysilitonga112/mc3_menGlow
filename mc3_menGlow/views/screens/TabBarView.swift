//
//  TabBarView.swift
//  mc3_menGlow
//
//  Created by Amalia . on 20/08/22.
//

import SwiftUI

struct TabBarView: View {
//    init() {
//        UITabBar.appearance().backgroundColor = UIColor.tintColor
//      }
    var body: some View {
        TabView{
            Dashboard2()
                .tabItem{
                    Image(systemName: "checklist")
                    Text("Activity")
                }
            
            RoutineListView()
                .tabItem{
                    Image(systemName: "arrow.triangle.2.circlepath.circle.fill")
                    Text("Routine")
                }
            
            ProgressView()
                .tabItem{
                    Image(systemName: "chart.bar.fill")
                    Text("Progress")
                }
            
            MySkinView()
                .tabItem{
                    Image(systemName: "person.text.rectangle.fill")
                    Text("My Skin")
                }
        }
//        .accentColor(.white)
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}
