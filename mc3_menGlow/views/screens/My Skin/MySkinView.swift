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
            
            VStack{
                Image("header_allpage")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(.bottom)
                
                HStack{
                    ZStack{
                        RoundedRectangle(cornerRadius: 10, style: .circular)
                            .fill(.white)
                            .frame(width: 130, height: 80 )
                            .shadow(radius: 1)
                        
                        VStack(alignment:. leading){
                            Text ("Skin Type")
                                .font(.body)
                                .fontWeight(.semibold)
                            
                            Text("Normal")
                                .font(.caption)
                        }
                        .frame(height: 80)
                    }
                    Spacer()
                    ZStack{
                        RoundedRectangle(cornerRadius: 10, style: .circular)
                            .fill(.white)
                            .frame(width: 130, height: 80 )
                            .shadow(radius: 1)
                        
                        VStack(alignment:. leading){
                            Text ("Skin Type")
                                .font(.body)
                                .fontWeight(.semibold)
                            
                            Text("Normal")
                                .font(.caption)
                        }
                        .frame(height: 80)
                    }
                    .padding(.horizontal)

                }
              
            }
            .background(Color("BackgroundColor"))
            .ignoresSafeArea(edges: .top)
            .navigationTitle("My Skin")
            .navigationBarTitleDisplayMode(.large)
            .frame(alignment: .top)
        }
    }
}

struct MySkinView_Previews: PreviewProvider {
    static var previews: some View {
        MySkinView()
    }
}
