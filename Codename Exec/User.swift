//
//  User.swift
//  User
//
//  Created by Danny Makogon on 8/2/21.
//

import Foundation
import Combine

class User: ObservableObject {
//    enum CodingKeys: String, CodingKey {
//        case customDrinkOrder, userName, type
//    }
    
    var didChange = PassthroughSubject<Void,Never>()
    
    
    @Published var username = "" {didSet {update()} }
    @Published var password = "" {didSet {update()} }
    @Published var repeatedPassword = "" {didSet {update()} }
    @Published var type = 0 {didSet {update()} }
    
    func isValid() -> Bool{
        if !username.isEmpty && !password.isEmpty {
            return true
        }
        return false
    }
    func creationIsValid() -> Bool{
        if password == repeatedPassword && isValid(){
            return true
        }
        else{
            return false
        }
    }
    func update() {
        didChange.send()
    }
    func signUp(){
        
    }
}

class CurrentUser: ObservableObject {
    var didChange = PassthroughSubject<Void,Never>()
    @Published var username = "" {didSet {update()} }
    @Published var password = "" {didSet {update()} }
    func update() {
        didChange.send()
    }
    
    
}


