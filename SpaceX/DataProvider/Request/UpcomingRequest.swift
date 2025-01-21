//
//  UpcomingRequest.swift
//  SpaceX
//
//  Created by Baki on 16.01.2025.
//

public struct UpcomingRequest: APIDecodableResponseRequest {
    
    
    public typealias ResponseType = [UpcomingResponse]
    
    public var path: String = "launches/upcoming"
    public var method: RequestMethod = .get
    public var parameters: RequestParameters = [:]
    public var headers: RequestHeaders = [:]
    
    public init() {}
    
}
