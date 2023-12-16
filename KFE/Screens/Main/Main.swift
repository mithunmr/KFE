//
//  Main.swift
//  KFE
//
//  Created by MRM on 13/12/23.
//

import SwiftUI

struct Main: View {
    @State var selectedTab:Int = 0
    var body: some View {
        NavigationStack {
            GeometryReader { geometry in
                TabView (selection:$selectedTab){
                    Home()
                        .tag(0)
                    
                    Heart()
                        .tag(1)
                    
                    Bag()
                        .tag(2)
                    
                    Notification()
                        .tag(3)
                    
                }
                .overlay(alignment: .bottom) {
                    CustomTabItem(selectedTab: $selectedTab)
                        .frame(width: geometry.size.width,height: 80)
                        .background(Rectangle().fill(.white).cornerRadius(25, corners: [.topLeft,.topRight]))
                        .accentColor(Color("C67C4E"))
                }
            }
        }
    }
}



struct Main_Previews: PreviewProvider {
    static var previews: some View {
        Main(selectedTab: 0)
    }
}
