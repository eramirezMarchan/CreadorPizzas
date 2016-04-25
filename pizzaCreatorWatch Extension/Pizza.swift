//
//  Pizza.swift
//  PizzaCreator
//
//  Created by Faktos on 24/04/16.
//  Copyright © 2016 ERM. All rights reserved.
//

import Foundation
import WatchKit

class Pizza: NSObject {
    var tamanio:String = ""
    var masa:String = ""
    var queso:String = ""
    var Ingredientes:[String] = []
    
    init(t:String,m:String,q:String,i:[String]) {
        tamanio = t
        masa = m
        queso = q
        Ingredientes = i
    }
}