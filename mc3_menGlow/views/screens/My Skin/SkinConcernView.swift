//
//  SkinConcernView.swift
//  mc3_menGlow
//
//  Created by Arma Qurrota Ayuni on 24/08/22.
//

import SwiftUI

struct SkinConcernView: View {
    
    @StateObject var concernVM = RoutineViewModel.shared
    
    var body: some View {
        NavigationView{
            VStack{
                Image("header_allpage")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(.bottom)
                
                ScrollView{
                    Spacer()
                    ForEach($concernVM.concernCard) { $card in
                        
                        ZStack{
                           
                            RoundedRectangle(cornerRadius: 10, style: .circular)
                                .fill(.white)
                                .frame(height: 135)
                                .shadow(radius: 1)
                            
                            HStack {
                                Image ("\(card.pic)")
                                    .resizable()
                                    .frame(width: 60, height: 60)
                                
//                                Spacer()
                                
                                VStack(alignment:. leading){
                                    Text (card.title)
                                        .font(.title2)
                                        .fontWeight(.semibold)
//                                        .padding(.bottom)
                                    
                                    Text(card.description)
                                        .font(.subheadline)
                                }
                                .frame(height: 135)
                                
                            }
                            .padding(.horizontal)
                        }
                        .padding(.horizontal)
                    }
                }
            }
            .background(Color("BackgroundColor"))
            .ignoresSafeArea(edges: .top)
            .navigationTitle("Choose Your Skin Concern")
            .navigationBarTitleDisplayMode(.large)
        }
    }
}

struct SkinConcernView_Previews: PreviewProvider {
    static var previews: some View {
        SkinConcernView()
    }
}
