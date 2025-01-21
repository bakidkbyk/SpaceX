//
//  DecodableResponseRequest.swift
//  SpaceX
//
//  Created by Baki on 15.01.2025.
//

import Foundation

public protocol DecodableResponseRequest: RequestProtocol {
    associatedtype ResponseType: Decodable
}
