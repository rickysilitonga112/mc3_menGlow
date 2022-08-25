//
//  AddRoutineView.swift
//  mc3_menGlow
//
//  Created by Ricky Silitonga on 16/08/22.
//

import SwiftUI

struct AddRoutineView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @StateObject var routineVM: RoutineViewModel
    @State var presentSheet: Bool = false
    @Binding var routine: Routine
    
    @State var newProducts = [Product]()
    @State var newTime: Date = Date.now
    
    var dateClosedRange: ClosedRange<Date> {
        let min = Calendar.current.startOfDay(for: Date())
        let max = Calendar.current.date(byAdding: .hour, value: 12, to: min)!
        return min...max
    }
    
    var body: some View {
        VStack(spacing: 30) {
            HStack {
                Text("Time for routine")
                    .fontWeight(.semibold)
                Spacer()
                DatePicker("", selection: $newTime, in: dateClosedRange, displayedComponents: .hourAndMinute)
                    .labelsHidden()
            }
            
            HStack {
                Text("What skincare product that you use?")
                    .fontWeight(.semibold)
                Spacer()
            }
            
            ScrollView {
                ForEach($newProducts) { $product in
                    if product.isCheck {
                        VStack {
                            HStack {
                                Text(product.title)
                                    .font(.subheadline)
                                    
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
                                .font(.title3)
                                .disableAutocorrection(true)
                        }
                        .padding(.bottom)
                    }
                }
                AddProductButton(title: "Add New Product") {
                    presentSheet.toggle()
                }
            }
            
            Spacer()
            
            HStack {
                Spacer()
                PrimaryButton(title: "Save") {
                    // Save new routine
                    routine.products = newProducts
                    routine.time = newTime
                    print("\(routine.time)")
                    self.presentationMode.wrappedValue.dismiss()
                    
                }
                Spacer()
            }
            Spacer()
            
        }
        .padding(.horizontal)
        .onAppear(perform: {
            newProducts = routine.products
        })
        .sheet(isPresented: $presentSheet) {
            ProductListView(products: $newProducts, presentSheet: $presentSheet)
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
