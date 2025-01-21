//
//  UpcomingResponse.swift
//  SpaceX
//
//  Created by Baki on 15.01.2025.
//

import UIKit

public struct UpcomingResponse: Decodable {
    public let links: Links
    public let dateLocal: String
    public let upcoming: Bool
    public let id: String
    public let name: String
    
    enum CodingKeys: String, CodingKey {
        case links
        case dateLocal = "date_local"
        case upcoming
        case id
        case name
    }
}
