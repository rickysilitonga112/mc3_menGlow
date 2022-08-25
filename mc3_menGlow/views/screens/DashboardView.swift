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

    private let routineIcons: [String] = ["sun.max.circle.fill", "moon.circle.fill", "circle.grid.3x3.circle.fill"]
    
    
    var body: some View {
        TabView {
            ForEach($routineVM.routineList) { $routine in
                VStack() {
                    ZStack {
                        Image(routineVM.getDashboardRoutineImage(title: routine.title))
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .clipped()
//                            .edgesIgnoringSafeArea([.top, .horizontal])
                        
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
                        }
                        .padding(.horizontal)
                        .foregroundColor(routine.title == "Morning Routine" ? .black : .white)
                    }
                    
                    // icon button
                    HStack {
                        ForEach(0 ..< routineVM.routineList.count, id: \.self) { index in
                            Button{
                                routineVM.indexShow = index
                            } label: {
                                Image(systemName: routineIcons[index])
                                    .resizable()
                                    .frame(width: 40, height: 40)
                                    .foregroundColor(Color("Brown"))
                            }
                            
                            if index != routineVM.routineList.count - 1 {
                                Text("- - - -")
                                    .fontWeight(.bold)
                                    .foregroundColor(Color("Strip"))
                            }
                        }
                    }
                    
                    HStack {
                        VStack(alignment: .leading) {
                            Text("\(routine.title)")
                                .bold()
                                .font(.largeTitle)
                            Text("\(routine.time.getFormattedDate(format: "HH:mm a"))")
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
                                routineVM.checkMorningRoutine()
                            }
                    }
                    .padding(.horizontal)
                    
                    ScrollView(showsIndicators: false){
                        ProductCard(routine: $routine)
                    }
                    
                    PrimaryButton(title: "Done") {
                        // complete task
                    }
                    
                    Spacer()
                }
                .background(Color("BackgroundColor"))
                .ignoresSafeArea(edges: .top)
            }
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
        .edgesIgnoringSafeArea(.top)
    }
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
    }
}
