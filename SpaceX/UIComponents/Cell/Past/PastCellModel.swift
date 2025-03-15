//
//  PastCellModel.swift
//  SpaceX
//
//  Created by Baki on 21.01.2025.
//

import Foundation

public protocol PastCellDataSource: AnyObject {
    var imageUrl: String { get }
    var name: String { get }
    var date: String { get }
}

public protocol PastCellEventSource: AnyObject {}

public protocol PastCellProtocol: PastCellDataSource, PastCellEventSource {}

public final class PastCellModel: PastCellProtocol {
    public var imageUrl: String
    public var name: String
    public var date: String
    
    public init(imageUrl: String, name: String, date: String) {
        self.imageUrl = imageUrl
        self.name = name
        self.date = date
    }
}
