//
//  BusStopInfoResponse.swift
//  NaverMapKit
//
//  Created by gnksbm on 3/25/24.
//

import Foundation
import CoreLocation

public struct BusStopInfoResponse: Hashable, Codable {
    public let busStopName: String
    public let busStopId: String
    public let direction: String
    public let longitude: Double
    public let latitude: Double
    
    public init(
        busStopName: String,
        busStopId: String,
        direction: String,
        longitude: Double,
        latitude: Double
    ) {
        self.busStopName = busStopName
        self.busStopId = busStopId
        self.direction = direction
        self.longitude = longitude
        self.latitude = latitude
    }
    
    public init?(
        busStopName: String,
        busStopId: String,
        direction: String,
        longitude: String,
        latitude: String
    ) {
        guard let longitude = Double(longitude),
              let latitude = Double(latitude)
        else { return nil }
        self.busStopName = busStopName
        self.busStopId = busStopId
        self.direction = direction
        self.longitude = longitude
        self.latitude = latitude
    }
}

extension BusStopInfoResponse {
    var location: CLLocation {
        .init(
            latitude: latitude,
            longitude: longitude
        )
    }
}
