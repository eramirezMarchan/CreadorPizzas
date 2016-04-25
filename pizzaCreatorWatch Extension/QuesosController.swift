//
//  QuesosController.swift
//  PizzaCreator
//
//  Created by Faktos on 24/04/16.
//  Copyright © 2016 ERM. All rights reserved.
//

import WatchKit
import Foundation


class QuesosController: WKInterfaceController {

    @IBOutlet var tablaQuesos: WKInterfaceTable!
    var arrayQueso : [String] = ["Mozarela", "Cheddar", "Parmesano", "Sin queso"]
    var tam = ""
    var mas = ""
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
        
        let c = context as! Pizza
        tam = String(c.tamanio)
        mas = String(c.masa)
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        tablaQuesos.setNumberOfRows(arrayQueso.count, withRowType: "quesoRow")
        for (var i = 0;i<arrayQueso.count;i++){
            let row = tablaQuesos.rowControllerAtIndex(i) as! CategoryRowView
            row.labelQueso.setText(arrayQueso[i])
        }
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    override func table(table: WKInterfaceTable, didSelectRowAtIndex rowIndex: Int) {
        // Redirect to controller with unit instance
        let valorContexto = Pizza(t:tam,m:mas,q:arrayQueso[rowIndex],i: [])
        pushControllerWithName("toIngredientes", context: valorContexto)
        
    }

}
