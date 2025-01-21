//
//  RequestProtocol.swift
//  SpaceX
//
//  Created by Baki on 15.01.2025.
//

import Foundation

public protocol RequestProtocol {
    var path: String { get }
    var method: RequestMethod { get }
    var parameters: RequestParameters { get }
    var headers: RequestHeaders { get }
    var encoding: RequestEncoding { get }
    var url: String { get }
}
