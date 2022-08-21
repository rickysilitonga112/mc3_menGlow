//
//  AddRoutineView.swift
//  mc3_menGlow
//
//  Created by Ricky Silitonga on 16/08/22.
//

import SwiftUI

struct AddRoutineView: View {
    @State private var routineName: String = ""
    
    @State var presentSheet: Bool = false
    @Binding var routine: Routine
    //    @Binding var showAddRoutineView: Bool
    
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
            
            ForEach($routine.products) { $product in
                if product.isCheck {
                    VStack {
                        HStack {
                            Text(product.title)
                            Spacer()
                            Button {
                                product.isCheck.toggle()
                            } label: {
                                Image(systemName: "trash.fill")
                                    .frame(width: 20, height: 22)
                                    .foregroundColor(kSecondaryColor)
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
        .sheet(isPresented: $presentSheet) {
            ProductListView(routine: $routine, presentSheet: $presentSheet)
        }
        .navigationTitle(routine.title)
        .navigationBarTitleDisplayMode(.large)
    }
    
}

struct AddRoutineView_Previews: PreviewProvider {
    static var previews: some View {
        AddRoutineView(routine: .constant(Routine(title: "", image: "", time: Date.now, isEnable: false, products: [], image2: "")))
    }
}
