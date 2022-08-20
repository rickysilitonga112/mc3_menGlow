//
//  ProductListView.swift
//  mc3_menGlow
//
//  Created by Ricky Silitonga on 18/08/22.
//

import SwiftUI

struct ProductListView: View {
    @Binding var routine: Routine
    @Binding var presentSheet: Bool
    
    var body: some View {
        VStack {
            HStack {
                Text("Product List")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.vertical)
                Spacer()
            }
            
            ForEach($routine.products) { $product in
                Toggle(isOn: $product.isCheck) {
                    Text("\(product.title)")
                }
            }
            Spacer()
        }
        .padding(.horizontal)
        .toolbar {
            ToolbarItem(placement: .cancellationAction) {
                Text("back")
            }
        }
    }
}

struct ProductListView_Previews: PreviewProvider {
    static var previews: some View {
        ProductListView(routine: .constant(Routine(title: "", image: "", time: Date.now, isEnable: false, products: [Product(title: "Cleanser", isCheck: false, productName: ""), Product(title: "Moisturizer", isCheck: false, productName: ""), Product(title: "Masker", isCheck: false, productName: "")])), presentSheet: .constant(false))
    }
}
