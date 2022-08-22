//
//  DashboardView.swift
//  mc3_menGlow
//
//  Created by Ricky Silitonga on 22/08/22.
//

import SwiftUI

struct DashboardView: View {
    private let screenWidth = UIScreen.main.bounds.width
    @State var isCheck: Bool = false
    @StateObject var routineVM = RoutineViewModel.shared
    
    var body: some View {
        VStack {
            ZStack {
                Image("header_morningsungreen")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: screenWidth)
                
                HStack {
                    Spacer()
                    VStack(alignment: .trailing) {
                        Text("Progress Summary")
                            .font(.title3)
                            .fontWeight(.semibold)
                            .padding(.bottom, 10)
                        
                        Text("18 days streak, keep going!")
                            .font(.subheadline)
                            .padding(.bottom, 6)
                        Text("3 days left to unlock")
                            .font(.caption)
                        Text("21 Days Routine Badges")
                            .font(.caption)
                    }
                } .padding(.horizontal)
            }
            
            HStack {
                Button{
                    
                } label: {
                    Image(systemName: "sun.max.circle.fill")
                        .resizable()
                        .frame(width: 40, height: 40)
                        .foregroundColor(Color("Brown"))
                }
                
                Text("- - - -")
                    .fontWeight(.bold)
                    .foregroundColor(Color("Strip"))
                
                Button {
                    
                } label: {
                    Image(systemName: "moon.circle.fill")
                        .resizable()
                        .frame(width: 40, height: 40)
                        .foregroundColor(Color("DisableColor"))
                }
            }
            
            HStack {
                VStack(alignment: .leading) {
                    Text("Morning Routine")
                        .bold()
                        .font(.largeTitle)
                    Text("08.30 AM")
                        .fontWeight(.semibold)
                        .font(.headline)
                }
                
                Spacer()
                
                Circle()
                    .fill(kSecondaryColor)
                    .frame(width: 38, height: 38, alignment: .center)
                    .overlay {
                        ZStack {
                            Circle()
                                .fill(.white)
                                .frame(width: 32, height: 32, alignment: .center)
                                .overlay {
                                    Image(systemName: "checkmark.circle.fill")
                                        .resizable()
                                        .foregroundColor(.white)
                                        .frame(width: 32, height: 32)
                                }
                        }
                    }
                    
                    .onTapGesture {
                        isCheck.toggle()
                    }
            }
            .padding(.horizontal)
            
            ScrollView(showsIndicators: false){
                ProductCard(routine: $routineVM.routineList[0])
            }
            
            PrimaryButton(title: "Complete Task") {
                // complete task
            }
            
            Spacer()
        }
        .ignoresSafeArea(edges: .top)
        .frame(alignment: .top)
    }
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
    }
}
