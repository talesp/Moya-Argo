//
//  ArgoUser.swift
//  Moya-Argo
//
//  Created by Sam Watts on 23/01/2016.
//  Copyright © 2016 Sam Watts. All rights reserved.
//

import Foundation
import Curry
import Runes

struct ArgoUser {
    
    let id: Int
    let name: String
    
    let birthdate: String?
}

extension ArgoUser: UserType { }

import Argo
import Curry

extension ArgoUser: Decodable {
    
    static func decode(_ json: JSON) -> Decoded<ArgoUser> {
        return curry(ArgoUser.init)
            <^> json <| "id"
            <*> json <| "name"
            <*> json <|? "birthdate"
    }
}
