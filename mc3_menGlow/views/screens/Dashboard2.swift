//
//  Dashboard2.swift
//  mc3_menGlow
//
//  Created by Amalia . on 19/08/22.
//

import SwiftUI

struct Dashboard2: View {
    
    @StateObject var routineVM = RoutineViewModel.shared
    
//    let identifier: Routine
//    @Binding var routine: Routine
    
    var body: some View {
        TabView {
            ForEach($routineVM.routineList) { $routine in
                VStack{
                    ZStack{
                        Image("\(routine.image2)")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                        VStack(alignment: .trailing){
                            Text("Progress Summary")
                                .fontWeight(.semibold)
                                .font(Font.system(size: 20))
                                .padding(.bottom, 5)
                                .foregroundColor((routine.title == "Morning Routine") ? .black : .white )
                            Text("18 days streak, keep going!")
                                .font(Font.system(size: 15))
                                .foregroundColor((routine.title == "Morning Routine") ? .black : .white )
                                .padding(.bottom, 3)
                            Text("""
     3 days left to unclock
 21 Days Routine Badges
""")
                            .font(Font.system(size: 12))
                            .foregroundColor((routine.title == "Morning Routine") ? .black : .white )
                        }
                        .offset(x: 80, y: -10)
                        
                    }
                    HStack{
                        Button{
                            //                            routineVM.getIndex(id: 0)
                        } label: {
                            Image(systemName: "sun.max.circle.fill")
                                .resizable()
                                .frame(width: 40, height: 40)
                                .foregroundColor((routine.title == "Night Routine") ? Color("DisableColor") : Color("Brown"))
                        }
                        
                        Text("- - - -")
                            .foregroundColor(Color("Strip"))
                        
                        Button{
                            
                        } label: {
                            Image(systemName: "moon.circle.fill")
                                .resizable()
                                .frame(width: 40, height: 40)
                                .foregroundColor((routine.title == "Morning Routine") ? Color("DisableColor") : Color("Brown"))
                        }
                    }
                    
                    HStack {
                        VStack(alignment: .leading){
                            Text(routine.title)
                                .bold()
                                .font(.largeTitle)
                            Text("08.30 AM")
                                .fontWeight(.semibold)
                                .font(.headline)
                        }
                        
                        Spacer()
                        
                        Circle()
                            .fill(Color("Brown"))
                            .frame(width: 40, height: 40)
                            .overlay {
                                Circle()
                                    .fill(Color("BackgroundColor"))
                                    .frame(width: 33, height: 33)
                                    .overlay {
                                        Image(systemName: "checkmark.circle.fill")
                                            .resizable()
                                            .frame(width: 38, height: 38)
//                                            .opacity(routine == identifier ? 1 : 0))
                                    }
                            }
                    }
                    .padding(.horizontal)
                    
                    ScrollView(showsIndicators: false){
                        ProductCard(routine: $routine)
                    }.frame(maxHeight: 320)
                    PrimaryButton(title: "Done") {
                        
                    }
                    
                    
                }
                .ignoresSafeArea()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color("BackgroundColor"))
            }
        }
        .frame(
            width: UIScreen.main.bounds.width ,
            height: UIScreen.main.bounds.height
        )
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
    }
}

struct Dashboard2_Previews: PreviewProvider {
    static var previews: some View {
        Dashboard2()
    }
}
