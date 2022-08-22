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
            ZStack{
                RoundedRectangle(cornerRadius: 10, style: .circular)
                    .fill(.white)
                    .frame(height: 80)
                    .shadow(radius: 1)
            
                    HStack {
                        Image("\(product.icon)")
                            .resizable()
                            .frame(width: 50, height: 50)
                        
                        Spacer()
                        
                        VStack(alignment:. leading){
                            Text("Garnier Men Acno Fight Anti Acne")
                                .font(.body)
                                .fontWeight(.semibold)
                            
                            Text("\(product.title)")
                                .font(.caption)
                        }
                        .frame(height: 80)
                        
                        Spacer()
                        
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
                    .padding(.horizontal)
            }
            .padding(.horizontal)
        }
    }
}

struct ProductCard_Previews: PreviewProvider {
    static var previews: some View {
        ProductCard(routine: .constant(Routine(title: "", image: "", time: Date.now, isEnable: false, products: [
        Product(title: "Cleanser", isCheck: false, productName: "blasalsas", icon: "")
        ], image2: "")))
    }
}
