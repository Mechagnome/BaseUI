//
//  SettingsController.swift
//  
//
//  Created by Ray Jiang on 2021/10/19.
//

import SwiftUI

struct SettingsController: View {
    
    var items: [SettingsItem]
    
    var body: some View {
        VStack {
            ForEach(0..<items.count) {
                let obj = items[$0]
                if let item = obj as? SettingsBoolItem {
                    SettingsBoolCell(item: item)
                } else if let item = obj as? SettingsInputItem {
                    SettingsInputCell(item: item)
                } else if let item = obj as? SettingsPickItem {
                    SettingsPickCell(item: item)
                } else if let item = obj as? SettingsButtonItem {
                    SettingsButtonCell(item: item)
                } else {
                    Text("")
                }
            }
        }
    }
}

struct SettingsController_Previews: PreviewProvider {
    
    static var previews: some View {
        SettingsController(items: getItems())
    }
    
    static func getItems() -> [SettingsItem] {
        let item1 = SettingsBoolItem(name: "勾选框", default: false, description: "更多描述")
        let item2 = SettingsInputItem(name: "输入框", default: "", placeholder: "请输入内容")
        let item3 = SettingsPickItem(name: "单选", default: SettingsPickCell_Previews.Animal.cat.name, options: SettingsPickCell_Previews.Animal.allCases.map(\.name))
        let item4 = SettingsButtonItem(name: "按钮", buttonName: "按钮文本")
        return [item1, item2, item3, item4]
    }
}
