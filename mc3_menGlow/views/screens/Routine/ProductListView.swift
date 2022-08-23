//
//  ProductListView.swift
//  mc3_menGlow
//
//  Created by Ricky Silitonga on 18/08/22.
//

import SwiftUI

struct ProductListView: View {
    @Binding var products: [Product]
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
            
            ForEach($products) { $product in
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
        ProductListView(products: .constant([
            Product(title: "Cleanser", isCheck: true, productName: "", icon: "", isUsed: false),
            Product(title: "Moisturizer", isCheck: true, productName: "", icon: "", isUsed: false),
            Product(title: "Toner", isCheck: false, productName: "", icon: "", isUsed: false)
        ]), presentSheet: .constant(true))
    }
}
