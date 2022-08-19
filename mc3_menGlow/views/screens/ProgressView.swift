//
//  ProgressView.swift
//  mc3_menGlow
//
//  Created by Amalia . on 19/08/22.
//

import SwiftUI

struct ProgressView: View {
    var body: some View {
        VStack{
        Image("header_allpage")
            .resizable()
            .aspectRatio(contentMode: .fit)
        Text("Progress")
                .font(.largeTitle)
        }
        
    }
}

struct ProgressView_Previews: PreviewProvider {
    static var previews: some View {
        ProgressView()
    }
}
