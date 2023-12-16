//
//  Onboarding.swift
//  KFE
//
//  Created by MRM on 13/12/23.
//

import SwiftUI

struct Onboarding: View {
    @State private var showHome = false
    var body: some View {
        NavigationStack {
            GeometryReader{ geometry in
                ZStack(alignment: .top){
                    Image("OnbordingBG")
                        .resizable()
                        .frame(width: geometry.size.width,height: geometry.size.height*0.6)
                    
                    VStack {
                        Text("""
                             Coffee so good,
                             your taste buds
                             will love it.
                             """)
                        .font(.system(size: 44,weight: .bold))
                        .multilineTextAlignment(.center)
                        
                        Text("""
                         The best grain, the finest roast, the
                         powerful flavor.
                        """)
                        .padding(.vertical,3)
                        .font(.system(size:15,weight: .regular))
                        .multilineTextAlignment(.center)
                        .foregroundColor(Color("A9A9A9"))
                        
                        Button {
                            showHome.toggle()
                        } label: {
                            Text("Get Started")
                                .font(.system(size: 16, weight: .semibold))
                        }.frame(width: geometry.size.width*0.7,height: 62)
                            .background(Color("C67C4E"))
                            .clipShape(Capsule())
                            .padding(.vertical)
                    }
                    .padding(.top,geometry.size.height*0.55)
                }
            }
            .foregroundColor(.white)
            .background(.black)
            .ignoresSafeArea()
            .navigationDestination(isPresented: $showHome, destination: { Main()})
            
        }
    }
}

struct Onboarding_Previews: PreviewProvider {
    static var previews: some View {
        Onboarding()
    }
}
