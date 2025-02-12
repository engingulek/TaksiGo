//
//  TargetType.swift
//  NewtworkManagerKit
//
//  Created by Engin Gülek on 12.02.2025.
//

import Foundation

import Foundation
import Alamofire
protocol TargetType {
    var baseURL: String {get}
    var path: String {get}
    var method: AlamofireMethod {get}
    var requestType: RequestType {get}
    var headers: [String: String]? {get}
}

enum AlamofireMethod: String {
    case GET
    case POST
    case DELETE

}

enum RequestType {
    case requestPlain
    case requestParameters(parameters: [String: Any], encoding: ParameterEncoding)
    
    
}
