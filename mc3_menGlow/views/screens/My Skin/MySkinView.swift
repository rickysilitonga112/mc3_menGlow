//
//  MySkinView.swift
//  mc3_menGlow
//
//  Created by Amalia . on 20/08/22.
//

import SwiftUI

struct MySkinView: View {
    
    var body: some View {
        
        NavigationView{
            
            VStack(spacing: 0){
                Image("header_allpage")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(.bottom)
                VStack{
                Text("My Skin")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal)
                ZStack {
                    RoundedRectangle(cornerRadius: 10, style: .circular)
                        .fill(.white)
                        .frame(height: 69)
                        .shadow(radius: 2)
                        .padding(.horizontal, 20)
                    HStack {
                        VStack(alignment: .leading){
                            Text("SKIN TYPE")
                                .font(.footnote)
                                .foregroundColor(.gray)
                            Text("Normal")
                                .font(.body)
                                .fontWeight(.semibold)
                            
                            
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal, 40)
                        Text("Edit")
                            .font(.footnote)
                            .foregroundColor(.gray)
                            .padding(.horizontal, 40)
                    }
                    
                }
                .padding(.bottom)
                
                ZStack {
                    RoundedRectangle(cornerRadius: 10, style: .circular)
                        .fill(.white)
                        .frame(height: 69)
                        .shadow(radius: 2)
                        .padding(.horizontal, 20)
                    HStack {
                        VStack(alignment: .leading){
                            Text("SKIN CONCERN")
                                .font(.footnote)
                                .foregroundColor(.gray)
                            Text("Acne, Dark Circles")
                                .font(.body)
                                .fontWeight(.semibold)
                            
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal, 40)
                        Text("Edit")
                            .font(.footnote)
                            .foregroundColor(.gray)
                            .padding(.horizontal, 40)
                        
                    }
                    
                }
                .padding(.bottom)
                HStack {
                    Text("Tips for you")
                        .font(.title3)
                        .fontWeight(.bold)
                        .padding(.horizontal, 30)
                    Spacer()
                    Text("See more")
                        .font(.footnote)
                        .foregroundColor(Color("Brown"))
                        .padding(.horizontal, 25)
                    
                }
                HStack {
                    Text("How to Remove Sunspots on Your Face"
                        )
                    .padding(.horizontal)
                    .frame(height: 100)
                    Spacer()
                    Image("Image1")
                        .resizable()
                        .frame(width: 100, height: 100)
                        .cornerRadius(10)
                        .shadow(radius: 5)
                }
                .padding()
                HStack {
                    Text("Skincare tips for Oily and Acne Prone Skin")
                        .padding(.horizontal)
                        .frame(height: 100)
                    Spacer()
                    Image("Image2")
                        .resizable()
                        .frame(width: 100, height: 100)
                        .cornerRadius(10)
                        .shadow(radius: 2)
                }
                .padding()
                }
                Spacer()
//                HStack {
//                    Text("Natural Relief for Razor Burn 8 Do's and Don'ts")
//                        .padding(.horizontal)
//                    Spacer()
//                    Image("Image3")
//                        .resizable()
//                        .frame(width: 100, height: 100)
//                        .cornerRadius(10)
//                        .shadow(radius: 2)
//                }
//                .padding()
//                Spacer()
                
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color("BackgroundColor"))
            .ignoresSafeArea(edges: .top)
//            .navigationTitle("My Skin")
//            .navigationBarTitleDisplayMode(.large)
            .frame(alignment: .top)
        }
    }
}

struct MySkinView_Previews: PreviewProvider {
    static var previews: some View {
        MySkinView()
    }
}
