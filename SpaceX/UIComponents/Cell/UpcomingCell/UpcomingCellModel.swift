//
//  UpcomingCellModel.swift
//  SpaceX
//
//  Created by Baki on 15.01.2025.
//

import Foundation

public protocol UpcomingCellDataSource: AnyObject {
    var imageUrl: String { get }
    var name: String { get }
    var date: String { get }
}

public protocol UpcomingCellEventSource: AnyObject {}

public protocol UpcomingCellProtocol: UpcomingCellDataSource, UpcomingCellEventSource {}

public final class UpcomingCellModel: UpcomingCellProtocol {
    
    public var imageUrl: String
    public var name: String
    public var date: String
    
    public init(imageUrl: String, name: String, date: String) {
        self.imageUrl = imageUrl
        self.name = name
        self.date = date
    }
}
