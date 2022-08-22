//
//  TabBarView.swift
//  mc3_menGlow
//
//  Created by Amalia . on 20/08/22.
//

import SwiftUI

struct TabBarView: View {
    init() {
        UITabBar.appearance().backgroundColor = UIColor.blue
//        UITabBar.appearance().barTintColor = UIColor(named: "TabBarColor")
      }
    var body: some View {
        NavigationView {
            TabView{
                RoutineListView()
                    .tabItem{
                        Image(systemName: "arrow.triangle.2.circlepath.circle.fill")
                        Text("Routine")
                    }
                
                Dashboard2()
                    .tabItem{
                        Image(systemName: "checklist")
                        Text("Activity")
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
            .accentColor(.white)
        }
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}
