//
//  IngredientesController.swift
//  PizzaCreator
//
//  Created by Faktos on 25/04/16.
//  Copyright © 2016 ERM. All rights reserved.
//

import WatchKit
import Foundation


class IngredientesController: WKInterfaceController {

    @IBOutlet var tableIngredientes: WKInterfaceTable!
    
    var arrayIngredientes : [String] = ["Jamón", "Pepperoni", "Pavo", "Salchicha", "Aceituna", "Cebolla", "Pimiento", "Piña", "Anchoa"]
    var tam = ""
    var mas = ""
    var que = ""
    var arraySelected : [String] = []
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        let c = context as! Pizza
        tam = String(c.tamanio)
        mas = String(c.masa)
        que = String(c.queso)
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        tableIngredientes.setNumberOfRows(arrayIngredientes.count, withRowType: "ingRow")
        for (var i = 0;i<arrayIngredientes.count;i++){
            let row = tableIngredientes.rowControllerAtIndex(i) as! CategoryRowView
            row.labelIngredientes.setText(arrayIngredientes[i])
        }
        arraySelected = []
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    override func table(table: WKInterfaceTable, didSelectRowAtIndex rowIndex: Int) {
        // Redirect to controller with unit instance
        let row = table.rowControllerAtIndex(rowIndex) as! CategoryRowView
        
        if(arraySelected.count<5){
            if !arraySelected.contains(arrayIngredientes[rowIndex]){
                row.ingRowGroup.setBackgroundColor(UIColor.blueColor())
                arraySelected.append(arrayIngredientes[rowIndex])
            }
            else{
                row.ingRowGroup.setBackgroundColor(UIColor.blackColor())
                arraySelected = arraySelected.filter{$0 != arrayIngredientes[rowIndex]}
            }
        }
        else
        {
            if arraySelected.contains(arrayIngredientes[rowIndex]){
                row.ingRowGroup.setBackgroundColor(UIColor.blackColor())
                arraySelected = arraySelected.filter{$0 != arrayIngredientes[rowIndex]}
            }
        }
       
        
    }
    
    
    @IBAction func confirmOrden() {
        if arraySelected.count > 0 {
            let valorContexto = Pizza(t:tam,m:mas,q:que,i: arraySelected)
            pushControllerWithName("toConfirm", context: valorContexto)
        }
    }
    

}
