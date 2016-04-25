//
//  MasaController.swift
//  PizzaCreator
//
//  Created by Faktos on 24/04/16.
//  Copyright © 2016 ERM. All rights reserved.
//

import WatchKit
import Foundation


class MasaController: WKInterfaceController {
    
    @IBOutlet var tableTamanios: WKInterfaceTable!
    var arrayMasas : [String] = ["Delgada","Crujiente","Gruesa"]
    var tam = ""

    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        let c = context as! Pizza
        tam = String(c.tamanio)
        
        // Configure interface objects here.
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        tableTamanios.setNumberOfRows(arrayMasas.count, withRowType: "masaRow")
        for (var i = 0;i<arrayMasas.count;i++){
            let row = tableTamanios.rowControllerAtIndex(i) as! CategoryRowView
            row.labelMasa.setText(arrayMasas[i])
        }

    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    override func table(table: WKInterfaceTable, didSelectRowAtIndex rowIndex: Int) {
        // Redirect to controller with unit instance
        let valorContexto = Pizza(t:tam,m:arrayMasas[rowIndex],q:"",i: [])
        pushControllerWithName("toQueso", context: valorContexto)
    }

}
