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
            VStack(alignment: .leading) {
                HStack{
                    Image("\(product.icon)")
                        .resizable()
                        .frame(width: 50, height: 50)
                    VStack(alignment:. leading){
                        Text("\(product.productName)")
                            .font(.body)
                            .fontWeight(.semibold)
                            .frame(maxWidth:. infinity, alignment: .leading)
                        Text("\(product.title)")
                            .font(.caption)
                            .frame(maxWidth:. infinity, alignment: .leading)
                    }
                    .frame(width: 240)
                    
                    Button{
                        
                    } label: {
                        Image(systemName: "checkmark.circle.fill")
                            .resizable()
                            .frame(width: 32, height: 32)
                            .foregroundColor(Color("OldGreen"))
                    }
                }
                .padding(12)
                .background(.white)
                .cornerRadius(10)
                
                
            }
                
            
            
        }
    }
}
