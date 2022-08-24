//
//  MainView.swift
//  mc3_menGlow
//
//  Created by Ricky Silitonga on 22/08/22.
//

import SwiftUI

struct MainView: View {
    init() {
        UITabBar.appearance().backgroundColor = UIColor(red: 50/255, green: 52/255, blue: 42/255, alpha: 1)
        
        UITabBar.appearance().unselectedItemTintColor = UIColor(red: 152/255, green: 154/255, blue: 148/255, alpha: 1)
    }
    
    var body: some View {
        NavigationView {
            TabView {
                DashboardView()
                    .tabItem {
                        Image(systemName: "checklist")
                        Text("Activity")
                    }
                
                RoutineListView()
                    .tabItem {
                        
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
            .accentColor(.white)
            
        }
        .navigationViewStyle(.stack)
        
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
