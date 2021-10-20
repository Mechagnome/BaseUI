//
//  SwiftUIView.swift
//  
//
//  Created by Ray Jiang on 2021/10/20.
//

import SwiftUI
import Combine

public struct SettingsInputCell: View {
    
    @ObservedObject
    var item: SettingsInputItem
    
    public var body: some View {
        HStack {
            HStack {
                Spacer()
                Text(item.name + ":")
            }
            .frame(width: 150)
            TextField(item.placeholder, text: $item.rawValue)
            Spacer(minLength: 10)
        }
        .frame(height: 44)
    }
}

struct SettingsInputCell_Previews: PreviewProvider {

    static var previews: some View {
        SettingsInputCell(item: SettingsInputItem(name: "输入项", default: "", placeholder: "请输入文本"))
    }
}
