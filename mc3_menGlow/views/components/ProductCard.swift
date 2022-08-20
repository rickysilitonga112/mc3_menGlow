//
//  ProductCard.swift
//  mc3_menGlow
//
//  Created by Amalia . on 19/08/22.
//

import Foundation
import SwiftUI

struct ProductCard: View {
    @Binding var routine: Routine
    
    var body: some View {
        
        ForEach($routine.products) { $product in
//            if product.isCheck == true {
            ZStack{
                RoundedRectangle(cornerRadius: 10, style: .circular)
                    
                    .fill(.white)
                    
                    .frame(width: 350, height: 80)
                    .shadow(radius: 1)
            VStack(alignment: .leading) {
                HStack{
                    Image("\(product.icon)")
                        .resizable()
                        .frame(width: 50, height: 50)
                    VStack(alignment:. leading){
                        Text("Garnier Men Acno Fight Anti Acne")
                            .font(.body)
                            .fontWeight(.semibold)
                            .frame(maxWidth:. infinity, alignment: .leading)
                        Text("\(product.title)")
                            .font(.caption)
                            .frame(maxWidth:. infinity, alignment: .leading)
                    }
                    .frame(width: 230)
                    
                    Circle()
                        .fill(Color("OldGreen"))
                        .frame(width: 30, height: 30)
                        .overlay {
                            Circle()
                                .fill(.white)
                                .frame(width: 28, height: 28)
                                .overlay {
                                    Image(systemName: "checkmark.circle.fill")
                                        .resizable()
                                        .frame(width: 28, height: 28)
                                        .opacity(0)
                                }
                        }
                    
                }
                .padding(15)
//                .background(.white)
//                .cornerRadius(10)
                
                
            }}
                
            
            
        }
    }
}
