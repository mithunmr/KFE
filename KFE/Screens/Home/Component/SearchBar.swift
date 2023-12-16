//
//  SearchBar.swift
//  KFE
//
//  Created by MRM on 14/12/23.
//

import SwiftUI

struct SearchBar: View {
    @Binding var searchText:String
    var body: some View {
        GeometryReader { geometry in
            HStack {
                Button{
                    
                }label: {
                    Image("Search")
                }
                
                TextField("Search Here", text: $searchText)
                    
                    .foregroundColor(Color("989898"))
                    .font(.system(size: 14,weight: .regular))
       
                Button{
                    
                }label: {
                    Rectangle()
                        .overlay{
                            Image("Filter")
                        }
                        .foregroundColor(Color("C67C4E"))
                        .frame(width: 44 ,height: 44)
                        .cornerRadius(12)
                }
            }
            .padding(12)
            .background(RoundedRectangle(cornerRadius: 20).fill(Color("313131")))
        }
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
