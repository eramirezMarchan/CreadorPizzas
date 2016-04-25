//
//  ConfirmPizzaController.swift
//  PizzaCreator
//
//  Created by Faktos on 25/04/16.
//  Copyright © 2016 ERM. All rights reserved.
//

import WatchKit
import Foundation


class ConfirmPizzaController: WKInterfaceController {

    @IBOutlet var labelSize: WKInterfaceLabel!
    @IBOutlet var labelMasa: WKInterfaceLabel!
    @IBOutlet var labelQueso: WKInterfaceLabel!
    @IBOutlet var labelIng: WKInterfaceLabel!
    
    var tam = ""
    var mas = ""
    var que = ""
    var arraySelected : [String] = []
    var textIngredientes = ""
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        let c = context as! Pizza
        tam = String(c.tamanio)
        mas = String(c.masa)
        que = String(c.queso)
        arraySelected = [String](c.Ingredientes)
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        labelSize.setText(tam)
        labelMasa.setText(mas)
        labelQueso.setText(que)
        
        for (var i = 0; i<arraySelected.count;i++){
            textIngredientes += "\(i+1).- \(arraySelected[i])\n"
        }
        
        labelIng.setText(textIngredientes)

    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    @IBAction func finalizar() {
        WKInterfaceController.reloadRootControllersWithNames(["toMain"], contexts: [])
        
    }

}
