//
//  InsertSkinView.swift
//  mc3_menGlow
//
//  Created by Arma Qurrota Ayuni on 24/08/22.
//

import SwiftUI

struct InsertSkinView: View {
    var pageTitle: String
    
   @Binding var skinProfile: [SkinProfile]
    
    var body: some View {
        VStack{
            Image("header_allpage")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding(.bottom)
            
            HStack {
                Text ("\(pageTitle)")
                    .font(.title2)
                    .fontWeight(.semibold)
                Spacer()
            }
            .padding(.horizontal)

            
            VStack {
                ScrollView{
                    Spacer()
                    ForEach($skinProfile) { $skincard in
                        
                        ZStack{
                           
                            RoundedRectangle(cornerRadius: 10, style: .circular)
                                .fill(skincard.isChoose ? Color("LightBrown") : .white)
                                .frame(height:80)
                                .shadow(radius: 1)
                            
                            HStack {
                                Image ("\(skincard.pic)")
                                    .resizable()
                                    .frame(width: 60, height: 60)
                                
                                
                                VStack(alignment:. leading){
                                    Text (skincard.title)
                                        .font(.body)
                                        .fontWeight(.semibold)
//                                        .padding(.bottom)
                                    
                                    Text(skincard.description)
                                        .font(.caption)
                                }
                                .frame(maxWidth: .infinity, alignment: .leading)
                            }
                            .padding(.horizontal)
                        }
                        .padding(.horizontal)
                        .onTapGesture {
                            skincard.isChoose.toggle()
                        }
                    }
                }
            }
        }
        .ignoresSafeArea(edges: .top)
    }
}

//struct InsertSkinView_Previews: PreviewProvider {
//    static var previews: some View {
//        InsertSkinView()
//    }
//}
