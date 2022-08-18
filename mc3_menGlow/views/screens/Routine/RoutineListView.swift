//
//  RoutineListView.swift
//  mc3_menGlow
//
//  Created by Ricky Silitonga on 16/08/22.
//

import SwiftUI

struct RoutineListView: View {
    private let screenWidth = UIScreen.screenWidth
    @State var morningOn = true
    
    var body: some View {
        VStack {
            //                Image("img_header")
            //                    .resizable()
            //                    .aspectRatio(contentMode: .fit)
            //                    .frame(width: screenWidth)
            //                    .ignoresSafeArea()
            
            HStack {
                Text("Routine List")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                Spacer()
            } .padding()
            
            ZStack {
                Image("header_morning")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: screenWidth)

                VStack {
                    Toggle(isOn: $morningOn) {
                        Text("Morning Routine")
                    }
                } .frame(width: 350)
               
            }
            
            Spacer()
            
        }
    }
}

struct RoutineListView_Previews: PreviewProvider {
    static var previews: some View {
        RoutineListView()
    }
}
