//
//  CategoryRowView.swift
//  PizzaCreator
//
//  Created by Faktos on 22/04/16.
//  Copyright © 2016 ERM. All rights reserved.
//

import WatchKit
import Foundation

class CategoryRowView: NSObject {
    @IBOutlet var labelSize: WKInterfaceLabel!

    @IBOutlet var labelMasa: WKInterfaceLabel!
    @IBOutlet var labelQueso: WKInterfaceLabel!
    @IBOutlet var labelIngredientes: WKInterfaceLabel!
    @IBOutlet var ingRowGroup: WKInterfaceGroup!
}
