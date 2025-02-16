//
//  WebSocketManager.swift
//  NewtworkManagerKit
//
//  Created by Engin Gülek on 13.02.2025.
//

import Foundation


public protocol WebSocketManagerProtocol {
    func connect<T: Decodable>(target: WebSocketPath, response: T.Type, completion: @escaping (T?) -> Void) 
}

public class WebSocketManager: WebSocketManagerProtocol {

    var webSocketTask: URLSessionWebSocketTask?
    var urlSession: URLSession = .shared

    public init() { }

    public func connect<T>(target: WebSocketPath, response: T.Type, completion: @escaping (T?) -> Void) where T : Decodable {
        let pathUrl = target.baseUrl + target.path
        guard let url = URL(string: pathUrl) else {
         
            completion(nil)
            return
        }
        
        webSocketTask = urlSession.webSocketTask(with: url)
        webSocketTask?.resume()
        
        listenForMessages(response: T.self) { result in
            completion(result)
        }
    }

    func listenForMessages<T: Decodable>(response: T.Type, completion: @escaping (T?) -> Void) {
        webSocketTask?.receive { [weak self] result in
            switch result {
            case .failure:
              
                completion(nil)
            case .success(let message):
                switch message {
                case .string(let text):
                  
                    let result = self?.handleProductUpdate(json: text, response: T.self)
                    completion(result)
                case .data:
                  
                    completion(nil)
                @unknown default:
                    break
                }
            }
         
            self?.listenForMessages(response: T.self, completion: completion)
        }
    }

    func handleProductUpdate<T: Decodable>(json: String, response: T.Type) -> T? {
        let decoder = JSONDecoder()
        if let data = json.data(using: .utf8) {
            do {
               
                let updatedProducts = try decoder.decode(T.self, from: data)
             
                return updatedProducts
            } catch {
                
            }
        }
        return nil
    }
}


// Custom error enum for better error handling
public enum WebSocketManagerError: Error {
    case invalidURL
    case receiveFailed(Error)
    case unexpectedMessageType
    case unknownMessageType
    case jsonDecodingFailed(Error)
    case invalidMessageFormat
}


