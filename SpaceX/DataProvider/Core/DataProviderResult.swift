//
//  DataProviderResult.swift
//  SpaceX
//
//  Created by Baki on 15.01.2025.
//

import Foundation

public typealias DataProviderResult<T: Decodable> = ((Result<T, Error>) -> Void)

public protocol DataProviderProtocol {
    func request<T: DecodableResponseRequest>(for request: T,
                                              result: DataProviderResult<T.ResponseType>?)
    
}
