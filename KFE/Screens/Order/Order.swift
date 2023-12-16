//
//  Order.swift
//  KFE
//
//  Created by MRM on 13/12/23.
//

import SwiftUI

enum orderType:String,CaseIterable {
    case deliver = "Deliver"
    case pickUp = "Pick Up"
}

struct Order: View {
    @State var selectedOrderType:orderType = .deliver
    @State var goToDelivery:Bool = false
    var body: some View {
        NavigationStack {
            GeometryReader { geometry in
                VStack{
                    ScrollView{
                        HStack {
                            ForEach(orderType.allCases,id:\.self) { type in
                                Button {
                                    selectedOrderType = type
                                }label: {
                                    Text(type.rawValue)
                                        .foregroundColor(selectedOrderType == type ? .white : Color("2F2D2C"))
                                        .font(.system(size: 16,weight:.semibold))
                                    
                                    
                                }
                                .frame(width: max(0,(geometry.size.width-90)/2))
                                .padding(8)
                                .background(selectedOrderType == type ? Color("C67C4E") : .clear)
                                .cornerRadius(12)
                            }
                        }
                        .padding()
                        .frame(width: max(0, geometry.size.width - 30), height: 48)
                        .background(Color("F1F1F1"))
                        .cornerRadius(12)
                        .padding()
                        
                        Section() {
                            VStack(alignment:.leading,spacing: 10) {
                                Text("Jl. Kpg Sutoyo")
                                    .font(.system(size: 14,weight:.semibold))
                                Text("Kpg. Sutoyo No. 620, Bilzen, Tanjungbalai.")
                                    .font(.system(size: 12,weight:.regular))
                                
                                HStack{
                                    Button{
                                        
                                    }label:{
                                        HStack{
                                            Image("EditAddress")
                                            Text("Edit Address")
                                                .foregroundColor(Color("2F2D2C"))
                                                .font(.system(size: 12,weight:.regular))
                                        }
                                    }
                                    .padding()
                                    .frame(height:27)
                                    .background{
                                        RoundedRectangle(cornerRadius: 10)
                                            .stroke(lineWidth: 1)
                                            .fill(Color("989898"))
                                            .overlay{
                                                
                                            }
                                    }
                                    
                                    Button{
                                        
                                    }label:{
                                        HStack{
                                            Image("Note")
                                            Text("Add Note")
                                                .foregroundColor(Color("2F2D2C"))
                                                .font(.system(size: 12,weight:.regular))
                                        }
                                    }
                                    .padding()
                                    .frame(height:27)
                                    .background{
                                        RoundedRectangle(cornerRadius: 10)
                                            .stroke(lineWidth: 1)
                                            .fill(Color("989898"))
                                        
                                    }
                                }.padding(.vertical)
                            }
                        }header: {
                            HStack{
                                Text("Delivery Address")
                                    .font(.system(size: 16,weight:.semibold))
                                Spacer()
                            }
                            
                        }
                        .frame(width: max(0, geometry.size.width - 30),alignment: .leading)
                        .padding(.vertical,5)
                        
                        Divider().padding(.horizontal) // Divider
                        
                        HStack(alignment:.center) {
                            Image("Cappuchino")
                                .resizable()
                                .frame( width:54, height:54)
                                .padding(.leading)
                            VStack (alignment:.leading,spacing:10){
                                Text("Cappucino")
                                    .font(.system(size: 16,weight:.semibold))
                                Text("with Chocolate")
                                    .font(.system(size: 12,weight:.regular))
                                    .foregroundColor(Color("989898"))
                            }
                            Spacer()
                            HStack{
                                Button {
                                    
                                }label:{
                                    Circle()
                                        .stroke(lineWidth: 1)
                                        .fill(Color("989898"))
                                    
                                }.overlay{
                                    Image("Minus")
                                }
                                .frame(width:28,height:28)
                                
                                Text("1")
                                    .font(.system(size: 16,weight:.semibold))
                                    .padding(.horizontal)
                                Button {
                                    
                                }label:{
                                    Circle()
                                        .stroke(lineWidth: 1)
                                        .fill(Color("989898"))
                                    
                                }.overlay{
                                    Image("Plus")
                                        .renderingMode(.template)
                                        .foregroundColor(.black)
                                }.frame(width:28,height:28)
                                
                                
                            }.padding(.trailing)
                            
                        }.padding(.vertical)
                        
                        Rectangle()
                            .frame(height:4)
                            .foregroundColor(Color("DDDDDD"))
                        
                        HStack{
                            Image("Discount")
                                .padding(.leading)
                            Text("1 Discount is applied")
                                .font(.system(size: 16,weight:.semibold))
                            Spacer()
                            Button{
                                
                            }label:{
                                Image("ArrowRight")
                            }.padding()
                        }
                        .frame(height:56)
                        .background() {
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(lineWidth: 1)
                                .fill(Color("989898"))
                                .opacity(0.3)
                        }.padding()
                        
                        Section {
                            VStack(spacing:10) {
                                HStack{
                                    Text("Price")
                                        .foregroundColor(Color("2F2D2C"))
                                    Spacer()
                                    Text("$ 4.53")
                                        .font(.system(size: 14,weight:.semibold))
                                }
                                HStack{
                                    Text("Delivery Fee")
                                        .foregroundColor(Color("2F2D2C"))
                                    Spacer()
                                    Text("$ 2.0")
                                        .foregroundColor(Color("989898"))
                                        .overlay{
                                            Rectangle()
                                                .frame(height:1)
                                        }
                                    Text("$ 1.0")
                                        .font(.system(size: 14,weight:.semibold))
                                }
                                Divider()
                                HStack{
                                    Text("Toatl Payment")
                                        .foregroundColor(Color("2F2D2C"))
                                    Spacer()
                                    Text("$ 4.53")
                                        .font(.system(size: 14,weight:.semibold))
                                }
                                
                            }.padding(.top,6)
                        }header:{
                            HStack {
                                Text("Payment Summary")
                                    .font(.system(size: 16,weight:.semibold))
                                Spacer()
                            }
                            
                        }.frame(width:max(0, geometry.size.width - 30))
                        
                        
                        
                        
                    }}//main Vstack
                .frame(height:geometry.size.height)
                .overlay(alignment:.bottom) {
                    VStack {
                        HStack{
                            Image("Money")
                            HStack{
                                Capsule()
                                    .fill(Color("C67C4E"))
                                    .overlay {
                                        Text("Cash")
                                            .font(.system(size:12))
                                            .foregroundColor(.white)
                                    }.frame(width: 51)
                                Text("$ 5.53")
                                    .font(.system(size:12))
                                    .foregroundColor(Color("313131"))
                                    .padding(.trailing)
                            }
                            
                            .background(Color("F1F1F1"))
                            .clipShape(Capsule())
                            Spacer()
                            Button {
                                
                            }label:{
                                Image("Dots")
                            }
                            
                        }
                        .frame(height: 24)
                        .padding()
                        NavigationLink("", destination: Delivery(), isActive: $goToDelivery).hidden()
                        Button{
                            goToDelivery = true
                        }label:{
                            Text("Order")
                                .foregroundColor(.white)
                                .font(.system(size: 16,weight:.semibold))
                        }
                        
                        .frame(width:geometry.size.width*0.83, height: 62)
                        .background(Color("C67C4E"))
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                    }
                    .padding()
                    .frame(height: 135)
                    .background(.white)
                    .cornerRadius(40, corners: [.topLeft,.topRight])
                    .shadow(color:Color("F1F1F1"),radius:12,x:0,y:-20)
                }
            }
            .navigationTitle("Order")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct Order_Previews: PreviewProvider {
    static var previews: some View {
        Order()
    }
}
