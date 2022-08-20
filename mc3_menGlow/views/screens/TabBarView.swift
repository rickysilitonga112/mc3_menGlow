//
//  TabBarView.swift
//  mc3_menGlow
//
//  Created by Amalia . on 20/08/22.
//

import SwiftUI

struct TabBarView: View {
    var body: some View {
        TabView{
            Dashboard2()
                .tabItem{
                    Image(systemName: "house")
                    Text("Home")
                }
            
            RoutineListView()
                .tabItem{
                    Image(systemName: "house")
                    Text("Home")
                }
            
            ProgressView()
                .tabItem{
                    Image(systemName: "calendar")
                    Text("Events")
                }
            
            MySkinView()
                .tabItem{
                    Image(systemName: "person.fill")
                    Text("Profile")
                }
        }
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}
