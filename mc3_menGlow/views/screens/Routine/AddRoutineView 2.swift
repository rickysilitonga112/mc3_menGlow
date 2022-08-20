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

    var body: some View {
        NavigationView {
            VStack(spacing: 30) {
                HStack {
                    Text("\(routine.title)")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    Spacer()
                }
                
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
                
                Button {
                    presentSheet.toggle()
                } label: {
                    HStack {
                        Image(systemName: "plus.circle.fill")
                            .frame(width: 22, height: 22)
                            .foregroundColor(kSecondaryColor)
                        Text("Add New Skincare Product")
                            .foregroundColor(kSecondaryColor)
                    }
                    
                    Spacer()
                }
                
                Spacer()
                HStack {
                    Spacer()
                    PrimaryButton(title: "Save") {
                        // Save new routine
                    }
                    Spacer()
                }
                
            }
        }
        .padding(.horizontal)
        .sheet(isPresented: $presentSheet) {
            ProductListView(routine: $routine, presentSheet: $presentSheet)
        }
    }
    
}

struct AddRoutineView_Previews: PreviewProvider {
    static var previews: some View {
        AddRoutineView(routine: .constant(Routine(title: "Morning Routine", image: "", time: Date.now, isEnable: false, products: [Product(title: "Moisturizer", isCheck: true, productName: "")])))
    }
}
