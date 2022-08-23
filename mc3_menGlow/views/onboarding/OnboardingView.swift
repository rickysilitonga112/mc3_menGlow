//
//  OnboardingView.swift
//  mc3_menGlow
//
//  Created by Ricky Silitonga on 21/08/22.
//

import SwiftUI

struct OnboardingView: View {
    
    @State var intros: [Intro] = [
        Intro(title: "Set ", subTitle: "Routine Quickly",
              description: "Create moring, night and custom routine easily", pic: "Onboarding1new", color: Color ("Strip")),
        Intro(title: "Complete", subTitle: "Progress",
              description: "See daily routine progress and don't loose your streaks",
              pic: "Onboarding2new", color: Color ("DarkGreen")),
        Intro(title: "Keep on Track and", subTitle: "Get Reward",
              description: "Never missed any routine and claim badges as reward", pic: "Onboarding3new", color: Color("Brown")),
    ]
    
    @GestureState var isDragging: Bool = false
    
    @State var fakeIndex: Int = 0
    @State var currentIndex: Int = 0
    
    var body: some View{
        ZStack{
            
            ForEach(intros.indices.reversed(),id: \.self){index in
                // Intro view
                IntroView(intro: intros[index])
                    .clipShape(LiquidShape(offset: intros[index].offset,
                                           curvePoint: fakeIndex == index ? 70 : 0))
                
                //                    .padding(.trailing, fakeIndex == index ? 15 : 0)
                    .ignoresSafeArea()
            }
            
            HStack(spacing: 8){
                //                Spacer()
                ForEach(0..<intros.count - 2, id: \.self){index in
                    
                    Circle()
                        .fill(Color("DarkGreen"))
                        .frame(width: 10, height: 10)
                        .scaleEffect(currentIndex == index ? 1 : 0.8)
                        .opacity(currentIndex == index ? 1 : 0.5)
                        .padding(10)
                    //                    Spacer()
                    
                }
                Spacer()
                
                Button{
                    
                }label:{
                    Text("Skip")
                        .font(.title2)
                        .fontWeight(.medium)
                        .foregroundColor(Color("Brown"))
                }
            }
            .padding()
            .padding(.horizontal)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
        }
        .overlay(
            
            Button(action: {
                
            }, label: {
                Image(systemName: "chevron.left")
                    .font(.largeTitle)
                    .frame(width: 50, height: 600)
                    .foregroundColor(.white)
                    .contentShape(Rectangle())
                    .gesture(
                        DragGesture()
                            .updating($isDragging, body: { value, out, _ in
                                out = true
                            })
                            .onChanged({ value in
                                withAnimation(.interactiveSpring(response: 0.7, dampingFraction: 0.8, blendDuration: 0.6)){
                                    
                                    intros[fakeIndex].offset = value.translation
                                }
                            })
                            .onEnded({ value in
                                withAnimation(.spring()){
                                    
                                    if -intros[fakeIndex].offset.width > getRect().width / 2{
                                        
                                        intros [fakeIndex].offset.width = -getRect().height * 1.5
                                        
                                        fakeIndex += 1
                                        
                                        if currentIndex == intros.count - 3{
                                            currentIndex = 0
                                        }
                                        else{
                                            currentIndex += 1
                                            
                                        }
                                        
                                        // some delay to finish
                                        
                                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.4){
                                            if fakeIndex == (intros.count - 2){
                                                
                                                for index in 0..<intros.count - 2{
                                                    intros[index].offset = .zero
                                                }
                                                
                                                fakeIndex = 0
                                            }
                                        }
                                    }
                                    else{
                                        intros[fakeIndex].offset = .zero
                                    }
                                }
                            })
                    )
            })
            .offset(y: 80)
            .opacity(isDragging ? 0 : 4)
            .animation(.linear, value: isDragging)
            
            ,alignment: .topTrailing
        )
        .onAppear{
            
            guard let  first = intros.first else {
                return
            }
            guard var last = intros.last else {
                return
            }
            
            last.offset.width = -getRect().height * 1.5
            
            intros.append(first)
            intros.insert(last, at: 0)
            
            fakeIndex = 1
        }
    }
    
    @ViewBuilder
    func IntroView(intro: Intro)->some View{
        
        VStack{
            VStack{
                
                Image(intro.pic)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(maxWidth: .infinity, alignment: .center)
                
            }
            
            VStack(alignment: .leading, spacing: 0){
                Spacer()
                Text(intro.title)
                    .font(.system(size: 25))
                    .fontWeight(.medium)
                
                Text(intro.subTitle)
                    .font(.system(size:40, weight: .bold))
                
                Text(intro.description)
                    .font(.system(size: 17))
                    .fontWeight(.regular)
                
                //                    .padding(.top)
                //                    .frame(width: CGRect().width - 10)
                //                    .lineSpacing(8)
                //
                Spacer()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading,20)
                    .padding([.trailing,.top])
                //                Spacer()
            }
            .padding(.horizontal)
            .background(Color("BackgroundColor"))
            
        }
        
        
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            
            intro.color
                .ignoresSafeArea()
        )
    }
    
}

//Extending View to get Screens Bounds...
extension View{
    
    func getRect()->CGRect{
        return UIScreen.main.bounds
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}


struct LiquidShape: Shape{
    
    var  offset: CGSize
    var curvePoint: CGFloat
    
    var animatableData: AnimatablePair<CGSize.AnimatableData,GLfloat>{
        get{
            return AnimatablePair(offset.animatableData,GLfloat(curvePoint))
        }
        set {
            offset.animatableData = newValue.first
            curvePoint =  CGFloat(newValue.second)
        }
    }
    
    func path(in rect: CGRect) -> Path{
        
        return Path{path in
            //when user moves left
            //increasing size both in top and bottom
            //so it will create a liquid swipe effect
            
            let width = rect.width + (-offset.width > 0 ? offset.width: 0)
            
            //First Constructing Rectangle Shape
            path.move(to: CGPoint(x: 0, y: 0))
            path.addLine (to: CGPoint (x: rect.width, y: 0))
            path.addLine (to: CGPoint (x: rect.width, y: rect.height))
            path.addLine(to: CGPoint (x: 0, y: rect.height))
            
            //Now constructing Curve Shape
            //from
            
            let from = 300 + (offset.width)
            path.move(to: CGPoint(x: rect.width, y: from > 300 ? 300 :from))
            
            //Also adding height
            var to = 750 + (offset.height) + (-offset.width)
            to = to < 550 ? 550 : to
            
            
            // Mid Between 80-180
            let mid: CGFloat = 80 + ((to - 80) / 2 )
            
            path .addCurve(to: CGPoint (x: rect.width, y: to), control1: CGPoint(x: width - curvePoint, y: mid), control2: CGPoint(x: width - curvePoint, y: mid))
//
//            path.addCurve(to: CGPoint(x: width, y: 180), control1: CGPoint (x: width - 50, y: mid), control2: CGPoint (x: width - 50, y: mid))
        }
    }
}

