//
//  Home.swift
//  KFE
//
//  Created by MRM on 13/12/23.
//

import SwiftUI

struct Home: View {
    @State var searchText:String = ""
    var body: some View {
        NavigationStack {
            GeometryReader { geometry in
                ZStack(alignment:.top){
                    Rectangle()
                        .fill(LinearGradient(colors: [Color("313131"),Color("131313")], startPoint: .bottomLeading, endPoint: .topTrailing))
                        .frame(height: geometry.size.height*0.4)
                    
                    ScrollView {
                        VStack {
                            HStack {
                                VStack(alignment: .leading){
                                    Text("Location")
                                        .foregroundColor(Color("B7B7B7"))
                                        .font(.system(size:12,weight: .regular))
                                    
                                    HStack {
                                        Text("Madikeri")
                                            .foregroundColor(Color("DDDDDD"))
                                            .font(.system(size:14,weight: .semibold))
                                        Button {
                                            
                                        }label: {
                                            Image("ArrowDown")
                                        }
                                    }
                                }
                                Spacer()
                                Image("Profile")
                                    .resizable()
                                    .frame(width: 44,height: 44)
                                    .cornerRadius(12)
                                
                            }.frame(height: 50)
                            
                            //Search Bar
                            SearchBar(searchText: $searchText)
                                .frame(height: 52)
                                .padding(.vertical)
                            VStack(alignment:.leading) {
                                Text("Promo")
                                    .font(.system(size: 14,weight: .semibold))
                                    .frame(width:60 ,height: 26)
                                    .background(Color("ED5151"))
                                    .cornerRadius(8)
                                Text("""
                                    Buy one get
                                    one FREE
                                    """)
                                .font(.system(size: 32,weight: .semibold))
                            }.background(Image("PromoBG"))
                                .foregroundColor(.white)
                                .frame(width: geometry.size.width*0.8, height: 140)
                                .cornerRadius(20)
                                .padding(.top,30)
                            
                            CoffeeTypes()
                                .padding(.vertical)
                            
                        
                                LazyVGrid(columns: [GridItem(.adaptive(minimum: 120),spacing: 10, alignment: .top)]){
                                    ForEach(0...10,id: \.self) {_ in
                                        
                                        NavigationLink(destination: ItemDetail()){
                                            VStack(alignment: .leading){
                                                ZStack(alignment:.topLeading){
                                                    Image("Cappuchino")
                                                    Label("4.8", image: "Star")
                                                        .font(.system(size: 10,weight: .semibold))
                                                        .foregroundColor(.white)
                                                        .padding(6)
                                                        .labelStyle(CustomLabel(spacing: 2))
                                                }
                                                Text("Cappucino")
                                                    .font(.system(size: 16,weight: .semibold))
                                                    .foregroundColor(Color("2F2D2C"))
                                                    .padding(.vertical, 3)
                                                    .padding(.horizontal, 5)
                                                Text("with Chocolate")
                                                    .font(.system(size: 12,weight: .regular))
                                                    .foregroundColor(Color("9B9B9B"))
                                                    .padding(.horizontal, 5)
                                                
                                                HStack{
                                                    Text("$ 4.53")
                                                        .font(.system(size: 18,weight: .semibold))
                                                        .foregroundColor(Color("2F4B4E"))
                                                    
                                                    Spacer()
                                                    Button{
                                                        
                                                    }label: {
                                                        Rectangle()
                                                            .overlay{
                                                                Image("Plus")
                                                            }
                                                            .foregroundColor(Color("C67C4E"))
                                                            .frame(width: 32, height: 32)
                                                            .cornerRadius(12)
                                                    }
                                                }
                                                .frame(width: 135)
                                                .padding(.horizontal, 5)
                                                .padding(.bottom,10)
                                            }
                                            .padding(4)
                                            .background(.white)
                                            .cornerRadius(20)
                                            
                                           
                                        }
                                    }
                                }
                            
                         
                        }.padding(.top,80)
                            .padding(.horizontal,30)
                    }   .scrollIndicators(.hidden)
                }
                .frame(height: geometry.size.height,alignment: .top)
                .navigationBarBackButtonHidden(true)
            }
            .ignoresSafeArea()
        }//NavigationStack
    }
}

struct CustomLabel: LabelStyle {
    var spacing: Double = 0.0
    func makeBody(configuration: Configuration) -> some View {
        HStack(alignment:.center, spacing: spacing) {
            configuration.icon
            configuration.title
        }
    }
}
struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
