//
//  Ticket.swift
//  Playground
//
//  Created by IT Mac on 1/8/16.
//  Copyright © 2016 IT Mac. All rights reserved.
//

import Foundation

class Ticket {
    private var _firstName: String!
    private var _lastName: String!
    private var _userName: String!
    private var _availUser: [String]! = []
    
    var firstName: String {
        return _firstName
    }
    var lastName: String {
        return _lastName
    }
    var userName: String {
        return _userName
    }
    var availUser: [String] {
        return _availUser
    }
    
    init(fn: String, ln: String) {
        if let firstName = fn as? String {
            self._firstName = firstName
        }
        if let lastName = ln as? String {
            self._lastName = lastName
        }
    }
    
    func assignUserName(usrNm: String) {
        if let userName = usrNm as? String {
            self._userName = userName
        }
    }

    func addAvailUserName(userNm: String) {
        if let availUserName = userNm as? String {
            self._availUser.append(availUserName)
        }
    }
    
    func resetTicket() {
        self._firstName = ""
        self._lastName = ""
        self._userName = ""
        self._availUser = []
    }
    
}