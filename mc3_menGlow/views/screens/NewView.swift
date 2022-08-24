//
//  NewView.swift
//  mc3_menGlow
//
//  Created by Amalia . on 23/08/22.
//

import SwiftUI

struct NewView : View {
    // 1.
    @State private var selectorIndex = 0
    @State private var numbers = ["One","Two","Three"]
    
    var body: some View {
        TabView {
            Text("Hello")
            Text("Hi")
            Text("Hello")
        }
        .tabViewStyle(PageTabViewStyle())
    }
}

struct NewView_Previews: PreviewProvider {
    static var previews: some View {
        NewView()
    }
}
