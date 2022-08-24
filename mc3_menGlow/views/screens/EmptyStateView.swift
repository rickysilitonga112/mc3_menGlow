//
//  EmptyStateView.swift
//  mc3_menGlow
//
//  Created by Amalia . on 19/08/22.
//

import SwiftUI

struct EmptyStateView: View {
    
    @State var session: String? = nil
    
    var body: some View {
        NavigationView {
            VStack {
                Image("header_emptystate")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
                Spacer()
                    .frame(height: 173)
                
                Text("Hi, let's set your first routine")
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .font(.system(size: 34))
                
                NavigationLink(destination: RoutineListView().navigationBarHidden(true), tag: "gotoRoutineList", selection: $session) {
                    Button {
                        session = "gotoRoutineList"
                    } label: {
                        Text("Set Now")
                            .frame(width: 250, height: 50)
                            .background(Color("OldGreen"))
                            .cornerRadius(25)
                            .foregroundColor(.white)
                        
                    }
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            .background(Color("BackgroundColor"))
            .ignoresSafeArea()
        }
        .navigationViewStyle(.stack)
    }
}


struct EmptyStateView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyStateView()
    }
}
