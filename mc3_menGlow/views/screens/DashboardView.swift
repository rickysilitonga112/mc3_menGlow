//
//  DashboardView.swift
//  mc3_menGlow
//
//  Created by Ricky Silitonga on 22/08/22.
//

import SwiftUI

struct DashboardView: View {
    private let screenWidth = UIScreen.main.bounds.width
    private let screenHeight = UIScreen.main.bounds.height
    @State var isCheck: Bool = false
    @StateObject var routineVM = RoutineViewModel.shared
    
    var body: some View {
//        ScrollView(.horizontal, showsIndicators: false) {
        ForEach($routineVM.routineList) { $routine in
        VStack {
            ZStack {
                Image(routine.image)
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
                    .foregroundColor(routine.title == "Morning Routine" ? .black : .white)
            }
            
            HStack {
                Button{
                    
                } label: {
                    Image(systemName: "sun.max.circle.fill")
                        .resizable()
                        .frame(width: 40, height: 40)
                        .foregroundColor(routine.title == "Morning Routine" ? Color("Brown") : Color("DisableColor"))
                }
                
                Text("- - - -")
                    .fontWeight(.bold)
                    .foregroundColor(Color("Strip"))
                
                Button{
                    
                } label: {
                    Image(systemName: "circle.grid.3x3.circle.fill")
                        .resizable()
                        .frame(width: 40, height: 40)
                        .foregroundColor(routine.title == "Custom Routine" ? Color("Brown") : Color("DisableColor"))
                }
                
                Text("- - - -")
                    .fontWeight(.bold)
                    .foregroundColor(Color("Strip"))
                
                Button {
                    
                } label: {
                    Image(systemName: "moon.circle.fill")
                        .resizable()
                        .frame(width: 40, height: 40)
                        .foregroundColor(routine.title == "Night Routine" ? Color("Brown") : Color("DisableColor"))
                }
            }
            
            HStack {
                VStack(alignment: .leading) {
                    Text(routine.title)
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
                                        .foregroundColor(Color("Brown"))
                                        .frame(width: 32, height: 32)
                                        .opacity(isCheck ? 1 : 0)
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
            
            PrimaryButton(title: "Done") {
                // complete task
            }
            
            Spacer()
        }
        .ignoresSafeArea(edges: .top)
        .frame(alignment: .top)
//        .frame(maxWidth: .infinity, maxHeight: .infinity)
//        .background(Color("BackgroundColor"))
        }

//        }
//        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
    }
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
    }
}
