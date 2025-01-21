//
//  Links.swift
//  SpaceX
//
//  Created by Baki on 15.01.2025.
//

import Foundation

public struct Links: Decodable {
    
    public let patch: Patch
    
    enum CodingKeys: String, CodingKey {
        case patch
    }
}
