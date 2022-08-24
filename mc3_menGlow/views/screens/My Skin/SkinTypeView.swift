//
//  SkinTypeView.swift
//  mc3_menGlow
//
//  Created by Arma Qurrota Ayuni on 23/08/22.
//

import SwiftUI

struct SkinTypeView: View {
    
    @StateObject var typeVM = RoutineViewModel.shared
    
    var body: some View {
        NavigationView{
            VStack{
                Image("header_allpage")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(.bottom)
                
                ScrollView{
                    ForEach($typeVM.typeCard) { $card in
                        
                        ZStack{
                            RoundedRectangle(cornerRadius: 10, style: .circular)
                                .fill(.white)
                                .frame(height: 80)
                                .shadow(radius: 1)
                            
                            HStack {
                                Image ("\(card.pic)")
                                    .resizable()
                                    .frame(width: 50, height: 50)
                                
                                Spacer()
                                
                                VStack(alignment:. leading){
                                    Text (card.title)
                                        .font(.body)
                                        .fontWeight(.semibold)
                                    
                                    Text(card.description)
                                        .font(.caption)
                                }
                                .frame(height: 80)
                                
                            }
                            .padding(.horizontal)
                        }
                        .padding(.horizontal)
                    }
                }
            }
            .background(Color("BackgroundColor"))
            .ignoresSafeArea(edges: .top)
            .navigationTitle("Choose Your Skin Type")
            .navigationBarTitleDisplayMode(.large)
        }
    }
}

struct SkinTypeView_Previews: PreviewProvider {
    static var previews: some View {
        SkinTypeView()
    }
}

