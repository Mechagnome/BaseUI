import Foundation
import SwiftUI
import Combine

public protocol SettingsItem {
    
    var name: String { get }
}

public protocol SettingsValueItem: SettingsItem {
    
    associatedtype Value
    
    var value: CurrentValueSubject<Value, Never> { get }
    var rawValue: Value { get }
}


public class SettingsBoolItem: ObservableObject, SettingsValueItem {
    
    public typealias Value = Bool
    
    public let name: String
    public let description: String
    public var value: CurrentValueSubject<Bool, Never>
    public var rawValue: Bool {
        set {
            value.send(newValue)
        }
        get {
            value.value
        }
    }
    
    public lazy var view: SettingsBoolCell = {
        SettingsBoolCell(item: self)
    }()
    
    private var cancellables = Set<AnyCancellable>()
    
    public init(name: String, default value: Bool, description: String) {
        self.name = name
        self.description = description
        self.value = .init(value)
        self.value.sink { _ in
            self.objectWillChange.send()
        }.store(in: &cancellables)
    }
}


public class SettingsInputItem: ObservableObject, SettingsValueItem {
    
    public typealias Value = String
    
    public let name: String
    public let placeholder: String
    public let value: CurrentValueSubject<String, Never>
    public var rawValue: String {
        set {
            value.send(newValue)
        }
        get {
            value.value
        }
    }
    
    public lazy var view: SettingsInputCell = {
        SettingsInputCell(item: self)
    }()
    
    private var cancellables = Set<AnyCancellable>()
    
    public init(name: String, default value: String, placeholder: String) {
        self.name = name
        self.placeholder = placeholder
        self.value = .init(value)
        self.value.sink { _ in
            self.objectWillChange.send()
        }.store(in: &cancellables)
    }
}


public protocol SettingsPickValue: Hashable {
    var name: String { get }
}

public class SettingsPickItem: ObservableObject, SettingsValueItem {
    
    public typealias Value = String
    
    public let name: String
    public let options: [String]
    public let value: CurrentValueSubject<String, Never>
    public var rawValue: String {
        set {
            value.send(newValue)
        }
        get {
            value.value
        }
    }
    public let index: CurrentValueSubject<Int, Never>
    public var rawIndex: Int {
        set {
            index.send(newValue)
        }
        get {
            index.value
        }
    }
    
    private var cancellables = Set<AnyCancellable>()
    private var indexCancellables = Set<AnyCancellable>()
    
    public init(name: String, default value: String, options: [String]) {
        self.name = name
        self.options = options
        self.value = .init(value)
        self.index = .init(options.firstIndex(of: value)!)
        
        self.value.sink { _ in
            self.objectWillChange.send()
        }.store(in: &cancellables)
        self.index.sink { _ in
            self.objectWillChange.send()
        }.store(in: &indexCancellables)
    }
}


public class SettingsButtonItem: ObservableObject, SettingsItem {
    
    public let name: String
    public let buttonName: String
    public let completion = PassthroughSubject<Void, Never>()
    
    public lazy var view: SettingsButtonCell = {
        SettingsButtonCell(item: self)
    }()
    
    public init(name: String, buttonName: String) {
        self.name = name
        self.buttonName = buttonName
    }
}
