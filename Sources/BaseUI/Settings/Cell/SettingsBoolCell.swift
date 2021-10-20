//
//  SwiftUIView.swift
//  
//
//  Created by Ray Jiang on 2021/10/20.
//

import SwiftUI
import Combine

public struct SettingsBoolCell: View {
    
    @ObservedObject
    var item: SettingsBoolItem
    
    public var body: some View {
        HStack {
            HStack {
                Spacer()
                Text(item.name + ":")
            }
            .frame(width: 150)
            Toggle(isOn: $item.rawValue) {
                Text(item.description)
            }
            Spacer()
        }
        .frame(height: 44)
    }
}

struct SettingsBoolCell_Previews: PreviewProvider {

    static var previews: some View {
        SettingsBoolCell(item: SettingsBoolItem(name: "勾选框", default: false, description: "更多描述"))
    }
}
