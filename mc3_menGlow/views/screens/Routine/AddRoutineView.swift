//
//  AddRoutineView.swift
//  mc3_menGlow
//
//  Created by Ricky Silitonga on 16/08/22.
//

import SwiftUI

struct AddRoutineView: View {
    
    @StateObject var routineVM: RoutineViewModel
    @State var presentSheet: Bool = false
    @Binding var routine: Routine
    
    @State var products = [Product]()
    
    var body: some View {
        VStack(spacing: 30) {
            HStack {
                Text("Time for routine")
                    .fontWeight(.semibold)
                Spacer()
                DatePicker("", selection: $routine.time, displayedComponents: .hourAndMinute)
                    .labelsHidden()
            }
            
            HStack {
                Text("What skincare product that you use?")
                    .fontWeight(.semibold)
                Spacer()
            }
            
            ForEach($products) { $product in
                if product.isCheck {
                    VStack {
                        HStack {
                            Text(product.title)
                            Spacer()
                            Button {
                                product.isCheck.toggle()
                            } label: {
                                Image(systemName: "xmark.circle.fill")
                                    .frame(width: 20, height: 22)
                                    .foregroundColor(.secondary)
                            }
                        }
                        
                        TextField("Product Name", text: $product.productName)
                    }
                }
            }
            
            AddProductButton(title: "Add New Product") {
                presentSheet.toggle()
            }
            
            Spacer()
            HStack {
                Spacer()
                PrimaryButton(title: "Save") {
                    // Save new routine
                    
                }
                Spacer()
            }
            Spacer()
            
        }
        .padding(.horizontal)
        .onAppear(perform: {
            products = routine.products
        })
        .sheet(isPresented: $presentSheet) {
            ProductListView(products: $products, presentSheet: $presentSheet)
        }
        .navigationTitle(routine.title)
        .navigationBarTitleDisplayMode(.large)
    }
    
}

struct AddRoutineView_Previews: PreviewProvider {
    static var previews: some View {
        AddRoutineView(routineVM: RoutineViewModel(), routine: .constant(Routine(title: "", image: "", time: Date.now, isEnable: false, products: [])))
    }
}
