//
//  CustomTabItem.swift
//  KFE
//
//  Created by MRM on 14/12/23.
//

import SwiftUI
enum TabItems{
    case home
    case heart
    case bag
    case notification
}

class TabItemModel:Hashable {
    var tag:Int
    var tabItem:TabItems
    var tabImage:String
    init(tabItem: TabItems) {
        self.tabItem = tabItem
        switch self.tabItem {
        case .home:
            tabImage = "Home"
            tag = 0
        case .bag:
            tabImage = "Bag"
            tag = 1
        case .heart:
            tabImage = "Heart"
            tag = 2
        case .notification:
            tabImage = "Notification"
            tag = 3
        }
    }
    static func == (lhs: TabItemModel, rhs: TabItemModel) -> Bool {
        lhs.tabItem == rhs.tabItem
    }
    func hash(into hasher: inout Hasher) {
        hasher.combine(tabItem)
    }
    
}

struct CustomTabItem:View {
    @Binding var selectedTab:Int
    var tabItems:[TabItemModel] = [
        TabItemModel(tabItem: .home),
        TabItemModel(tabItem: .heart),
        TabItemModel(tabItem: .bag),
        TabItemModel(tabItem: .notification)
    ]
    var body: some View {
        HStack {
            ForEach(tabItems,id:\.tabItem){ tabItem in
                VStack {
                    Image(tabItem.tabImage)
                        .renderingMode(.template)
                        .foregroundColor(selectedTab == tabItem.tag ? Color("C67C4E") : .gray)
                }.padding(.horizontal,25)
                    .onTapGesture {
                        selectedTab = tabItem.tag
                }
            }
        }
    }
}

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners) )
    }
}
struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

struct CustomTabItem_Previews: PreviewProvider {
    static var previews: some View {
        Main(selectedTab: 0)
    }
}
