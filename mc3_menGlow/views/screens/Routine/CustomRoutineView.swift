//
//  CustomRoutine.swift
//  mc3_menGlow
//
//  Created by Ricky Silitonga on 18/08/22.
//

import SwiftUI

struct CustomRoutine: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @StateObject var routineVM: RoutineViewModel
    @State var newRoutine = Routine(title: "", image: "customroutinecard", time: Date.now, isEnable: true, products: [])
    @State var presentSheet: Bool = false
    @State var routineDays = [RoutineDay]()
    @State private var showingAlert = false
    
    var body: some View {
        VStack(spacing: 30) {
            // textfield
            TextField("Routine Name", text: $newRoutine.title)
                .disableAutocorrection(true)
                .padding(.horizontal)
                .overlay(
                    RoundedRectangle(cornerRadius: 14)
                        .stroke(kSecondaryColor, lineWidth: 2)
                        .frame(height: 42)
                )
                .frame(height: 42)
                .padding(.horizontal)
            
            // time picker
            HStack {
                Text("Time for routine")
                    .fontWeight(.semibold)
                Spacer()
                DatePicker("", selection: $newRoutine.time, displayedComponents: .hourAndMinute)
                    .labelsHidden()
            } .padding(.horizontal)
            
            
            VStack {
                HStack {
                    Text("When do you want to repeat?")
                        .fontWeight(.semibold)
                    Spacer()
                }
                
                HStack {
                    
                    ForEach($routineDays) { $routineDay in
                        Circle()
                            .stroke(kDayCircleColor, lineWidth: 2)
                            .frame(width: 40, height: 40, alignment: .center)
                            .overlay(
                                Circle()
                                    .fill(routineDay.isChoose ? kDayCircleColor : .white)
                                    .frame(width: 38, height: 38, alignment: .center)
                                    .overlay(
                                        Text(routineDay.day)
                                            .fontWeight(.bold)
                                            .foregroundColor(routineDay.isChoose ? .white : .black)
                                    )
                            )
                            .onTapGesture {
                                print("Day tapped")
                                print("\(routineDay.id) | \(routineDay.day) | \(routineDay.isChoose)")
                                routineDay.isChoose.toggle()
                            }
                        
                        Spacer()
                    }
                    
                }
            } .padding(.horizontal)
            
            ScrollView {
                LazyVStack {
                    ForEach($newRoutine.products) { $product in
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
                    } .padding(.top)
                }
            }
            .padding(.horizontal)
            
            Spacer()
            
            PrimaryButton(title: "Save") {
                if newRoutine.title.count > 4 {
                    newRoutine.dayRepeat = routineDays
                    routineVM.addNewRoutine(newRoutine)
                    self.presentationMode.wrappedValue.dismiss()
                } else {
                    showingAlert.toggle()
                }
            }
            .alert("You should input routine title minimal 5 character!", isPresented: $showingAlert) {
                Button("OK", role: .cancel) { }
            }
            .padding(.bottom)
        }
        .sheet(isPresented: $presentSheet) {
            ProductListView(products: $newRoutine.products, presentSheet: $presentSheet)
        }
        .onAppear {
            newRoutine.products = Product.getProduct()
            routineDays = RoutineDay.getRoutineDays()
        }
        .navigationTitle("Custom Routine")
        .navigationBarTitleDisplayMode(.inline)
        .tabViewStyle(.automatic)
    }
    
}

struct CustomRoutine_Previews: PreviewProvider {
    static var previews: some View {
        CustomRoutine(routineVM: RoutineViewModel())
    }
}
