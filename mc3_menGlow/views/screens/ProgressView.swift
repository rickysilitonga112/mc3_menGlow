//
//  ProgressView.swift
//  mc3_menGlow
//
//  Created by Amalia . on 19/08/22.
//

import SwiftUI
import UICircularProgressRing

struct ProgressView: View {
    
    @StateObject var progressVM = ProgressViewModel.shared
    @StateObject var routineVM = RoutineViewModel.shared
    
    @Namespace var animation
    @State var progress = RingProgress.percent(0.5)
    @State var session: String? = nil
    
    var body: some View {
        NavigationView{
        VStack(spacing: 0){
            Image("header_allpage")
                .resizable()
                .aspectRatio(contentMode: .fit)
            VStack{
            Text("Progress")
                .font(.largeTitle)
                .fontWeight(.bold)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)
            ScrollView(.horizontal, showsIndicators: false) {
                
                HStack(spacing: 10) {
                    
                    ForEach(progressVM.currentWeek, id: \.self){ day in
                        VStack{
                            Text(progressVM.extractDate(date: day, format: "EEE"))
                                .font(.system(size: 17))
                                .fontWeight(.bold)
                            //EEE will return day as MON, TUE, ...etc
                            Text(progressVM.extractDate(date: day, format: "dd"))
                                .font(.system(size: 17))
                        }
                        //MARK: Foreground Style
//                        .foregroundStyle(taskModel.isToday(date: day) ? .primary : .primary)
                        .foregroundColor(progressVM.isToday(date: day) ? .white : .black)
                        //MARK: Capsule Shape
                        .frame(width: 42, height: 70)
                        .background(
                            ZStack {
                                //MARK: Matched Geometry Effect
                                if progressVM.isToday(date: day){
                                    Capsule()
                                        .fill(Color("RingColor"))
                                        .matchedGeometryEffect(id: "CURRENTDAY", in: animation)
                                }
                            }
                        )
                        .contentShape(Capsule())
                        .onTapGesture {
                            //updating current day
                            withAnimation {
                                progressVM.currentDate = day
                            }
                        }
                    }
                }
                .padding(.horizontal)
            }
            GoalProgressRing(
                ringColor: Color("RingColor"),
                progressValue: .constant(routineVM.percentageProgress)
            )
            .frame(maxHeight: 188, alignment: .top)
            HStack{
                Circle()
                    .fill(Color("OuterColor"))
                    .frame(width: 27, height: 27)
                Text("To do")
                    .font(.system(size: 17))
                    .fontWeight(.semibold)
                Spacer()
                    .frame(width: 70)
                Circle()
                    .fill(Color("RingColor"))
                    .frame(width: 27, height: 27)
                Text("Done")
                    .font(.system(size: 17))
                    .fontWeight(.semibold)
                
            }
            .padding()
            
            ZStack{
                RoundedRectangle(cornerRadius: 10, style: .circular)
                
                    .fill(.white)
                
                    .frame(width: 350, height: 40)
                    .shadow(radius: 1)
                HStack{
                    Text("Goals")
                        .font(.system(size: 17))
                        .fontWeight(.semibold)
                    Spacer()
                        .frame(width: 180)
                    Text("3/7 days")
                        .font(.system(size: 17))
                        .fontWeight(.semibold)
                    NavigationLink(destination: GoalView(), tag: "goal", selection: $session) {
                    Button {
                        session = "goal"
                    } label: {
                    Image(systemName: "chevron.right")
                        .resizable()
                        .frame(width: 10, height: 18)
                        .foregroundColor(Color("Brown"))
                    }
                    }
                }
            }
            Text("Streaks")
                .font(.system(size: 17))
                .fontWeight(.semibold)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 38)
            HStack{
                ZStack{
                    RoundedRectangle(cornerRadius: 10, style: .circular)
                    
                        .fill(.white)
                    
                        .frame(width: 165, height: 120)
                        .shadow(radius: 1)
                    VStack{
                        Text("Current Streak")
                            .font(.system(size: 17))
                            .fontWeight(.semibold)
                        Text("3")
                            .font(.system(size: 48))
                            .fontWeight(.bold)
                        Text("days")
                            .font(.system(size: 24))
                            .fontWeight(.bold)
                    }
                }
                ZStack{
                    RoundedRectangle(cornerRadius: 10, style: .circular)
                    
                        .fill(.white)
                    
                        .frame(width: 165, height: 120)
                        .shadow(radius: 1)
                    VStack{
                        Text("Best Streak")
                            .font(.system(size: 17))
                            .fontWeight(.semibold)
                        Text("3")
                            .font(.system(size: 48))
                            .fontWeight(.bold)
                        Text("days")
                            .font(.system(size: 24))
                            .fontWeight(.bold)
                    }
                }
                
            }
            
            
        }
            
            Spacer()
            
        }
        .ignoresSafeArea()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("BackgroundColor"))
        .navigationBarTitleDisplayMode(.inline)
        }
    }
}

private struct GoalProgressRing: View {
    let ringColor: Color
    let outerColor = Color("OuterColor")
    @Binding var progressValue: Double
    
    var body: some View{
        VStack {
            ProgressRing(
                progress: Binding(get: {
                    RingProgress.percent(progressValue) }, set: {
                        progressValue = $0.asDouble! }),
                outerRingStyle: .init(
                    color: .color(outerColor),
                    strokeStyle: .init(lineWidth: 30)
                ),
                innerRingStyle: .init(
                    color: .color(ringColor),
                    strokeStyle: .init(lineWidth: 30,
                                       lineCap: .round),
                    padding: 3
                ),
                { value in
                    Text(String(Int(value * 100)) + "%")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                }
                
            )
        }
    }
}
struct ProgressView_Previews: PreviewProvider {
    static var previews: some View {
        ProgressView()
    }
}
