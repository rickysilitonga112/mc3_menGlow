//
//  RoutineListView.swift
//  mc3_menGlow
//
//  Created by Ricky Silitonga on 16/08/22.
//

import SwiftUI

struct RoutineListView: View {
    private let screenWidth = UIScreen.screenWidth
    
    @StateObject var routineVM = RoutineViewModel.shared
    @State var session: String? = nil
    
    
    var body: some View {
        NavigationView {
            VStack {
                Image("header_allpage")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
                HStack {
                    Text("Routine List")
                        .fontWeight(.bold)
                        .font(.largeTitle)
                    Spacer()
                    
                    NavigationLink(destination: CustomRoutine(routineVM: routineVM), tag: "custom", selection: $session) {
                        Button {
                            session = "custom"
                        } label: {
                            Image(systemName: "plus.circle.fill")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 40)
                                .foregroundColor(kSecondaryColor)
                        }

                    }
                    
                }
                .padding(.horizontal)
                
                // card
                ScrollView {
                    LazyVStack {
                        ForEach($routineVM.routineList) { $routine in
                            NavigationLink(destination: AddRoutineView(routine: $routine)) {
                                ZStack {
                                    Image("\(routine.image)")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .cornerRadius(8)
                                    
                                    VStack(alignment: .leading) {
                                        Toggle(isOn: $routine.isEnable) {
                                            Text("\(routine.title)")
                                                .font(.title2)
                                                .fontWeight(.bold)
                                                .foregroundColor((routine.image == "routinelist_evening") ? .white : .black)
                                        }
                                        
                                        HStack {
                                            VStack(alignment: .leading) {
                                                Text("Notification:")
                                                    .fontWeight(.semibold)
                                                    .foregroundColor((routine.image == "routinelist_evening") ? .white : .black)
                                                Text("08.30 AM Daily")
                                                    .fontWeight(.semibold)
                                                    .foregroundColor((routine.image == "routinelist_evening") ? .white : .black)
                                            }
                                            Spacer()
                                        }
                                        Spacer()
                                        Text("Cleanser")
                                            .foregroundColor(.black)
                                            .multilineTextAlignment(.leading)
                                    }
                                    .padding(.horizontal)
                                    .padding(.top)
                                    
                                }
                                .frame(width: 350, height: 180, alignment: .topLeading)
                                .padding(.bottom)
                                .opacity(routine.isEnable ? 1 : 0.6)
                            }
                        }
                    }
                }
                
                Spacer()
                
                
            }
            .ignoresSafeArea(edges: .top)
            .frame(alignment: .top)
        }
    }
}

struct RoutineListView_Previews: PreviewProvider {
    static var previews: some View {
        RoutineListView()
    }
}
