//
//  PastRequest.swift
//  SpaceX
//
//  Created by Baki on 21.01.2025.
//

public struct PastRequest: APIDecodableResponseRequest {
    
    public typealias ResponseType = [LaunchesResponse]
    
    public var path: String = "launches/past"
    public var method: RequestMethod = .get
    public var parameters: RequestParameters = [:]
    public var headers: RequestHeaders = [:]
    
    public init() {}
    
}
