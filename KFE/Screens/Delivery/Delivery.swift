//
//  Delivery.swift
//  KFE
//
//  Created by MRM on 16/12/23.
//

import SwiftUI
import MapKit

struct MapView: UIViewRepresentable  {

    var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.1275), span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))

    let mapView = MKMapView()

    func makeUIView(context: Context) -> MKMapView {
        mapView.mapType = .mutedStandard
     
        mapView.setRegion(region, animated: true)
        return mapView
    }

    func updateUIView(_ uiView: MKMapView, context: Context) {
        uiView.mapType = .mutedStandard
    }

}

struct Delivery: View {
    
    @State private var showDeliveryInfo:Bool = true
    var body: some View {
        NavigationStack {
            GeometryReader { geometry in
                ZStack{
                    MapView()
                }
            }.sheet(isPresented: $showDeliveryInfo) {
                DeliveryInfo(callAction: changeMapLocation)
                .presentationDetents([.fraction(0.4),.fraction(0.1)])
                .interactiveDismissDisabled()
            }
            .navigationTitle("")
            .ignoresSafeArea()
        }
    }
    func changeMapLocation(){
     
        DispatchQueue.main.async {
            
        }
    }
}
struct DeliveryInfo:View {
    var callAction:()->Void
    var body: some View {
        ScrollView {
            VStack{
                Text("10 minutes left")
                    .font(.system(size: 16,weight: .semibold))
                    .padding(.top,25)
                Text(deliverTo)
                
                DeliveryStatusIndicator()
                    .padding(.vertical)
                    .padding(.horizontal,40)
                
                HStack{
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(Color("9B9B9B"),lineWidth: 1)
                        .overlay{
                            Image("Bike")
                        }.frame(width:62 ,height: 62)
                        .padding(.leading)
                    VStack(alignment:.leading,spacing: 5){
                        Text("Delivered your order")
                            .font(.system(size: 16,weight: .semibold))
                        Text("We deliver your goods to you in the shortes possible time.")
                            .font(.system(size: 12,weight: .regular))
                            .foregroundColor(Color("989898"))
                    }.padding(.horizontal,4)
                    Spacer()
                }
                .frame(height: 90)
                .background{
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(Color("9B9B9B"),lineWidth: 1)
                }
                .padding(.horizontal,40)
                
                HStack{
                    Image("DeliveryBoy")
                        .frame(width: 54,height: 54)
                    VStack(alignment:.leading,spacing: 5){
                        Text("Johan Hawn")
                            .font(.system(size: 16,weight: .semibold))
                        Text("Personal Courier")
                            .font(.system(size: 12,weight: .regular))
                            .foregroundColor(Color("989898"))
                    }.padding(.horizontal,4)
                    Spacer()
                    Button{
                      callAction()
                    }label: {
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(Color("9B9B9B"),lineWidth: 1)
                            .overlay{
                                Image("Telphone")
                            }.frame(width:62 ,height: 62)
                            .padding(.leading)
                    }
                  
                }
                .padding(.vertical)
                .padding(.horizontal,40)
            }
        }
    }
    
    var deliverTo: AttributedString {
        var text1 = AttributedString("Delivery to ")
        text1.font = .system(size: 15,weight: .regular)
        text1.foregroundColor = Color("9B9B9B")
        var text2 = AttributedString("Jl. Kpg Sutoyo")
        text2.font = .system(size: 12,weight: .semibold)
        text2.foregroundColor = Color("2F2D2C")
        
        
        
        return text1+text2
    }
}

struct DeliveryStatusIndicator:View{
    var body: some View{
        HStack{
            ForEach(0...3,id:\.self){ i in
                Rectangle()
                    .fill( i>2 ? Color("9B9B9B"):Color("36C07E"))
                    .frame(height: 4)
                    .clipShape(Capsule())
                
            }
        }
    }
}
struct Delivery_Previews: PreviewProvider {
    static var previews: some View {
        Delivery()
    }
}
