//
//  Coffee.swift
//  KFE
//
//  Created by MRM on 14/12/23.
//

import SwiftUI
enum CoffeeType:String,CaseIterable {
    case cappuccino="Cappuccino"
    case machiato = "Machiato"
    case latte = "Latte"
}


struct CoffeeTypes: View {
    var cofeeTypes = CoffeeType.allCases
    @State var selectedType:CoffeeType = .cappuccino
    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                ForEach(cofeeTypes,id:\.self) {type in
                    
                    Button {
                        selectedType = type
                        
                    }label: {
                        Text(type.rawValue)
                            .font(.system(size: 14,weight: .semibold))
                    }
                        .frame(height:38)
                        .padding(.horizontal)
                        .background( selectedType == type ? Color("C67C4E") : .white)
                        .cornerRadius(12)
                        .foregroundColor(selectedType == type ? .white :Color("2F4B4E") )
                }
            }
        }
    }
}

struct Coffee_Previews: PreviewProvider {
    static var previews: some View {
        CoffeeTypes()
    }
}
