//
//  WebSocketPath.swift
//  NewtworkManagerKit
//
//  Created by Engin Gülek on 13.02.2025.
//

import Foundation

public enum WebSocketPath {
    case taxiInfo
}


extension WebSocketPath : WebSocketTargetType {
     var baseUrl: String {
        return WebSocketConstants.baseUrl.rawValue
    }
    
     var path: String {
        switch self {
        case .taxiInfo:
            return WebSocketConstants.taxiInfo.rawValue
        }
    }
    
    
}
