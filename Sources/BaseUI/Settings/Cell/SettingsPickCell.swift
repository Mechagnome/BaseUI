//
//  SwiftUIView.swift
//  
//
//  Created by Ray Jiang on 2021/10/20.
//

import SwiftUI
import Combine

struct SettingsPickCell: View {
    
    @ObservedObject
    var item: SettingsPickItem
    
    public var body: some View {
        HStack {
            HStack {
                Spacer()
                Text(item.name)
            }
            .frame(width: 150)
            Picker(selection: $item.rawIndex, label: Text("")) {
                ForEach(0..<item.options.count) {
                    Text(item.options[$0])
                }
            }
            Spacer(minLength: 10)
        }
        .frame(height: 44)
    }
}

struct SettingsPickCell_Previews: PreviewProvider {
    
    enum Animal: SettingsPickValue, CaseIterable {
        case cat
        case dog
        
        var name: String {
            switch self {
            case .cat:
                return "猫"
            case .dog:
                return "狗"
            }
        }
    }

    static var previews: some View {
        SettingsPickCell(item: SettingsPickItem(name: "单选", default: Animal.cat.name, options: Animal.allCases.map(\.name)))
    }
}
