//
//  UserDefaultsManager.swift
//  UserDefaultsManagerKit
//
//  Created by Engin Gülek on 13.02.2025.
//

import Foundation

public protocol UserDefaultsManagerProtocol {
    var isLoggedIn: Bool { get }
    var phoneNumber: String? { get }
    
    func login(phoneNumber: String)
    func logout()
}


public class UserSessionManager: UserDefaultsManagerProtocol {
    public init (){}
    private let userDefaults = UserDefaults.standard
    private let phoneNumberKey = "userPhoneNumber"
    private let isLoggedInKey = "isUserLoggedIn"
    
    
    public  var isLoggedIn: Bool {
        return userDefaults.bool(forKey: isLoggedInKey)
    }
    
    
    public var phoneNumber: String? {
        return userDefaults.string(forKey: phoneNumberKey)
    }
    
    
    public func login(phoneNumber: String) {
        userDefaults.set(phoneNumber, forKey: phoneNumberKey)
        userDefaults.set(true, forKey: isLoggedInKey)
    }
    
    
    public func logout() {
        userDefaults.removeObject(forKey: phoneNumberKey)
        userDefaults.set(false, forKey: isLoggedInKey)
    }

}
