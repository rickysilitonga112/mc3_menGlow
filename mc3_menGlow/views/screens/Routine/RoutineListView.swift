//
//  RoutineListView.swift
//  mc3_menGlow
//
//  Created by Ricky Silitonga on 16/08/22.
//

import SwiftUI
import UserNotifications

struct RoutineListView: View {
    private let screenWidth = UIScreen.screenWidth
    
    @StateObject var routineVM = RoutineViewModel.shared
    @State var session: String? = nil
    @State var showAddRoutine: Bool = false
    @State private var showingAlert = false
    
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
                            if routineVM.routineList.count < 3 {
                                session = "custom"
                            } else {
                                showingAlert.toggle()
                            }
                        } label: {
                            Image(systemName: "plus.circle.fill")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 40)
                                .foregroundColor(routineVM.routineList.count < 3 ? kSecondaryColor : .secondary)
                        }
                        .alert("You can only add one custom routine!", isPresented: $showingAlert) {
                            Button("OK", role: .cancel) { }
                        }
                    }
                    
                }
                .padding(.horizontal)
                
                // card
                ScrollView {
                    LazyVStack {
                        ForEach($routineVM.routineList) { $routine in
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
                                            .foregroundColor((routine.image == "routinelist_morning") ? .black : .white)
                                    }
                                    
                                    NavigationLink(destination: AddRoutineView(routineVM: routineVM, routine: $routine)) {
                                        VStack {
                                            HStack {
                                                VStack(alignment: .leading) {
                                                    Text("Notification:")
                                                        .fontWeight(.semibold)
                                                        .foregroundColor((routine.image == "routinelist_morning") ? .black : .white)
                                                    Text("\(routine.time.getFormattedDate(format: "HH:mm a"))")
                                                        .fontWeight(.semibold)
                                                        .foregroundColor((routine.image == "routinelist_morning") ? .black : .white)
                                                }
                                                Spacer()
                                            }
                                            Spacer()
                                            HStack {
                                                TagViewPlacement(items: routineVM.getTagViewItem(routine: routine))
                                                Spacer()
                                            }
                                        }
                                    }
                                    
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
                
                Spacer()
            }
            .ignoresSafeArea(edges: .top)
            .frame(alignment: .top)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color("BackgroundColor"))
            .navigationBarTitleDisplayMode(.inline)
        }

        
    }
}

struct RoutineListView_Previews: PreviewProvider {
    static var previews: some View {
        RoutineListView()
    }
}
