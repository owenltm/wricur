//
//  Curhat.swift
//  wricur
//
//  Created by user on 11/12/21.
//  Copyright © 2021 ltm. All rights reserved.
//

import Foundation

struct Curhat {
    var idCurhat: Int       //idCurhat  (FK)
    var idUser: Int         //idAccount (PK)
    var body: String        //curhat
    var isHidden: Bool      //informationtype
}
