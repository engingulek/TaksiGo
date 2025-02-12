//
//  NetworkPath.swift
//  NewtworkManagerKit
//
//  Created by Engin Gülek on 12.02.2025.
//

import Foundation
import Alamofire

public enum  NetworkPath {
    case createConfirmCode(Parameters)
    case checkCode(Parameters)
}


extension NetworkPath : TargetType {
    var baseURL: String {
        return Constants.baseUrl.rawValue
    }
    
    var path: String {
        switch self {
        case .createConfirmCode:
            return Constants.confirmCode.rawValue + Constants.createConfirmCode.rawValue
        case .checkCode:
            return Constants.confirmCode.rawValue + Constants.checkCode.rawValue
        }
    }
    
    var method: AlamofireMethod {
        switch self {
        case .createConfirmCode:
            return .POST
        case .checkCode:
            return .POST
        }
    }
    
    var requestType: RequestType {
        switch self {
        case .createConfirmCode(let parameters ):
            return .requestParameters(parameters: parameters, encoding: JSONEncoding.init())
        case .checkCode(let parameters):
            return .requestParameters(parameters: parameters, encoding: JSONEncoding.init())
        }
    }
    
    var headers: [String : String]? {
        switch self {
        default:
            return [:]
        }
    }
    
    
}
