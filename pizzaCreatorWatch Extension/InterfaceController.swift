//
//  InterfaceController.swift
//  PizzaCreator
//
//  Created by Faktos on 25/04/16.
//  Copyright © 2016 ERM. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {

    @IBOutlet var tableTamanios: WKInterfaceTable!
    var arraySizes : [String] = ["Chica","Mediana","Grande"]
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
        tableTamanios.setNumberOfRows(arraySizes.count, withRowType: "sizeRow")
        for (var i = 0;i<arraySizes.count;i++){
            let row = tableTamanios.rowControllerAtIndex(i) as! CategoryRowView
            row.labelSize.setText(arraySizes[i])
        }
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    override func table(table: WKInterfaceTable, didSelectRowAtIndex rowIndex: Int) {
        // Redirect to controller with unit instance
        let valorContexto = Pizza(t:arraySizes[rowIndex],m:"",q:"",i: [])
        pushControllerWithName("toMasa", context: valorContexto)
    }

}
