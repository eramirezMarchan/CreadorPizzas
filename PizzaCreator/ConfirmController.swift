//
//  ConfirmController.swift
//  PizzaCreator
//
//  Created by Faktos on 17/04/16.
//  Copyright © 2016 ERM. All rights reserved.
//

import UIKit

class ConfirmController: UIViewController {

    var tamanio:String = ""
    var tipoMasa:String = ""
    var tipoQueso:String = ""
    var ingredientes:[String] = []
    var textIngredientes = ""
    
    @IBOutlet weak var label_size: UILabel!
    @IBOutlet weak var label_Masa: UILabel!
    @IBOutlet weak var label_Queso: UILabel!
    @IBOutlet weak var text_ingredientes: UITextView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        label_size.text = tamanio
        label_Masa.text = tipoMasa
        label_Queso.text = tipoQueso
        
        for (var i = 0; i<ingredientes.count;i++){
            textIngredientes += "\(i+1).- \(ingredientes[i])\n"
        }
        
        text_ingredientes.text = textIngredientes
    }
    
    @IBAction func enviarOrden(sender: AnyObject) {
        
        let k: Int = random() % 100000;
        
        let mensaje = "Su orden ha sido enviada con el número: \(k)"
        
        let alertController = UIAlertController(title: "Enviada", message:
            mensaje, preferredStyle: UIAlertControllerStyle.Alert)
        alertController.addAction(UIAlertAction(title: "Aceptar", style: UIAlertActionStyle.Default,handler: { (alert :UIAlertAction!) -> Void in
            self.popToRoot()
        }))
        
        self.presentViewController(alertController, animated: true, completion: nil)
        
        //navigationController?.popToRootViewControllerAnimated(true)
    }
    
    func popToRoot() {
        self.navigationController?.popToRootViewControllerAnimated(true)
    }

}
