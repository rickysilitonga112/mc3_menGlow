//
//  GoalView.swift
//  mc3_menGlow
//
//  Created by Amalia . on 25/08/22.
//

import SwiftUI

struct GoalView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @StateObject var progressVM = ProgressViewModel.shared
    @StateObject var routineVM = RoutineViewModel.shared
    private let screenHeight = UIScreen.main.bounds.height
    
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                Image("header_allpage")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .edgesIgnoringSafeArea([.top, .horizontal])
                VStack {
                    Text("Goals")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal)
                    Image("trophy")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 80, height: 80)
                    Text("7 Days Milestone")
                        .font(.body)
                        .fontWeight(.semibold)
                    Image("checkpoint")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding()
                    Text("Badges")
                        .font(.body)
                        .fontWeight(.semibold)
                    Image("badges")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                    
                    
                }
                Spacer()
                
            }
//            .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("BackgroundColor"))
        .navigationBarTitleDisplayMode(.inline)
        .edgesIgnoringSafeArea(.top)

        }
        
        
    }
}

struct GoalView_Previews: PreviewProvider {
    static var previews: some View {
        GoalView()
    }
}
