//
//  ItemDetail.swift
//  KFE
//
//  Created by MRM on 13/12/23.
//

import SwiftUI

enum coffeeSize:String,CaseIterable {
    case small = "S"
    case medium = "M"
    case large = "L"
    
}

struct ItemDetail: View {
    
    @State var selectedCoffeeSize:coffeeSize = .medium
    @State var navigateToOrderScreen:Bool = false
    var body: some View {
        NavigationStack {
            GeometryReader {geometry in
                VStack (alignment: .leading){
                    VStack(alignment: .center) {
                        Image("Cappuchino")
                            .resizable()
                            .frame(height: 265)
                        
                    }
                    .frame(width:max(0, geometry.size.width - 30))
                    Text("Cappucino")
                        .font(.system(size: 20,weight: .semibold))
                        .foregroundColor(Color("2F2D2C"))
                        .padding(.vertical, 3)
                        .padding(.horizontal, 5)
                    Text("with Chocolate")
                        .font(.system(size: 12,weight: .regular))
                        .foregroundColor(Color("9B9B9B"))
                        .padding(.horizontal, 5)
                    
                    HStack{
                        HStack {
                            Image("Star")
                                .resizable()
                                .frame(width: 20,height: 20)
                            
                            Text("4.8")
                                .font(.system(size: 16,weight: .semibold))
                            Text("(230)")
                                .font(.system(size: 12,weight: .regular))
                                .foregroundColor(Color("989898"))
                        }
                        Spacer()
                        HStack{
                            Button{
                                
                            }label: {
                                Rectangle()
                                    .overlay{
                                        Image("CoffeBean")
                                    }
                                    .foregroundColor(Color("F9F9F9"))
                                    .frame(width: 44, height: 44)
                                    .cornerRadius(12)
                            }
                            Button{
                                
                            }label: {
                                Rectangle()
                                    .overlay{
                                        Image("Milk")
                                    }
                                    .foregroundColor(Color("F9F9F9"))
                                    .frame(width: 44, height: 44)
                                    .cornerRadius(12)
                            }
                        }
                        
                        
                    }.padding(.trailing)
                    
                    Divider()
                        .padding(.vertical,5)
                    Text("Description")
                        .font(.system(size: 16,weight: .semibold))
                        .foregroundColor(Color("2F2D2C"))
                        .padding(.vertical, 3)
                    
                    
                    Text("A cappuccino is an approximately 150 ml (5 oz) beverage, with 25 ml of espresso coffee and 85ml of fresh milk the fo.. Read More")
                        .font(.system(size: 14,weight: .regular))
                        .foregroundColor(Color("A9A9A9"))
                    
                    
                    //Size
                    Text("Size")
                        .font(.system(size: 16,weight: .semibold))
                        .foregroundColor(Color("2F2D2C"))
                        .padding(.vertical, 3)
                    
                    HStack(alignment: .center,spacing: 20 ){
                        ForEach(coffeeSize.allCases,id:\.self) {size in
                            Button {
                                selectedCoffeeSize = size
                            }label: {
                                Text(size.rawValue)
                                    .foregroundColor(selectedCoffeeSize == size ? Color("C67C4E")  :.black)
                                    .font(.system(size: 14,weight: .regular))
                                    .padding()
                                    .background(RoundedRectangle(cornerRadius: 10)
                                        .fill( selectedCoffeeSize == size ? Color("FFF5EE")  :.clear)
                                        .frame(width: geometry.size.width*0.26, height: 43))
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 10)
                                            .stroke( selectedCoffeeSize == size ? Color("C67C4E") :Color("EDEDED"), lineWidth: 2)
                                            .frame(width: geometry.size.width*0.26, height: 43)
                                    ) .frame(width: geometry.size.width*0.26, height: 43)
                            }
                        }
                    } .frame(width: max(0, geometry.size.width - 30))
                        .padding(.vertical,5)
                    
                    
                    
                }
                
                .frame(width:max(0, geometry.size.width - 30),height: geometry.size.height,alignment: .top)
                .padding()
                .overlay(alignment:.bottom){
                    HStack {
                        VStack {
                            Text("Price")
                                .font(.system(size: 14,weight: .regular))
                                .foregroundColor(Color("A9A9A9"))
                            
                            Text("$4.5")
                                .font(.system(size: 18,weight: .semibold))
                                .foregroundColor(Color("C67C4E"))
                        }
                        Spacer()
                        NavigationLink(
                            destination: Order(),
                            isActive: $navigateToOrderScreen,
                            label: {
                                EmptyView()
                            }
                        )
                        .buttonStyle(PlainButtonStyle())
                        Button {
                            navigateToOrderScreen = true
                        }label: {
                            Text("Buy Now")
                                .foregroundColor(.white)
                                .font(.system(size: 18,weight: .semibold))
                        }.padding(.vertical,20)
                            .padding(.horizontal,30)
                            .frame(width: 217, height: 62)
                            .background(Color("C67C4E"))
                        
                            .cornerRadius(12)
                    }
                    .padding(30)
                    .frame(width: geometry.size.width, height: 100)
                    .background(.white)
                    .cornerRadius(40, corners: [.topLeft,.topRight])
                    .shadow(color:Color("DDDDDD").opacity(0.5),radius: 10)
                    
                }
            }
            .navigationTitle("Details")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItem (placement: .navigationBarTrailing){
                    Button {
                        
                    }label: {
                        Image("Fevorite")
                    }.padding(.trailing,20)
                }
            }
        }
    }
}

struct ItemDetail_Previews: PreviewProvider {
    static var previews: some View {
        ItemDetail()
    }
}
