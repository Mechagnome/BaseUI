//
//  SwiftUIView.swift
//  
//
//  Created by Ray Jiang on 2021/10/20.
//

import SwiftUI

struct SettingsButtonCell: View {
    
    @ObservedObject
    var item: SettingsButtonItem
    
    public var body: some View {
        HStack {
            HStack {
                Spacer()
                Text(item.name)
            }
            .frame(width: 150)
            Button(action: {
                item.completion.send()
            }) {
                Text(item.buttonName)
            }
            Spacer()
        }
        .frame(height: 44)
    }
}

struct SettingsButtonCell_Previews: PreviewProvider {
    
    static var previews: some View {
        SettingsButtonCell(item: SettingsButtonItem(name: "按钮", buttonName: "按钮文本"))
    }
}
