//
//  SwiftUIView.swift
//  
//
//  Created by Ray Jiang on 2021/10/21.
//

import SwiftUI

struct SettingsTextCell: View {
    
    @ObservedObject
    var item: SettingsTextItem
    
    public var body: some View {
        HStack {
            HStack {
                Spacer()
                Text(item.name)
            }
            .frame(width: 150)
            Text(item.description)
            Spacer()
        }
        .frame(height: 44)
    }
}

struct SettingsTextCell_Previews: PreviewProvider {
    static var previews: some View {
        SettingsTextCell(item: SettingsTextItem(name: "Title", description: "Description"))
    }
}
