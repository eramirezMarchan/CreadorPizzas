//
//  ingredientesController.swift
//  PizzaCreator
//
//  Created by Faktos on 17/04/16.
//  Copyright © 2016 ERM. All rights reserved.
//

import UIKit

class ingredientesController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate  {

    var tamanio:String = ""
    var tipoMasa:String = ""
    var tipoQueso:String = ""
    let reuseIdentifier = "cell"
    var items = ["Jamón", "Pepperoni", "Pavo", "Salchicha", "Aceituna", "Cebolla", "Pimiento", "Piña", "Anchoa"]
    var images: [String] = ["Jamon", "Pepperoni", "Pavo", "Salchicha", "Aceituna", "Cebolla", "Pimiento", "Pinia", "Anchoa"]
    
    var ingredientes : [Int] = []
    var ingredientesFinal : [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        print("El tamanio es: \(tamanio) el tipo de masa es \(tipoMasa) y el queso es \(tipoQueso)")
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.items.count
    }

    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        // get a reference to our storyboard cell
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! MyCollectionViewCell
        
        // Use the outlet in our custom class to get a reference to the UILabel in the cell
        cell.labelIngrediente.text = self.items[indexPath.item]
        cell.imagenIngrediente.image = UIImage(named: images[indexPath.row])
        cell.backgroundColor = UIColor.blackColor() // make cell more visible in our example project
        
        return cell
    }
    
    var count = 0;
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        // handle tap events
        print("You selected cell #\(indexPath.item)!")
        let cell = collectionView.cellForItemAtIndexPath(indexPath)
        
        
            if count < 5
            {
                if cell?.backgroundColor == UIColor.blackColor(){
                    cell?.backgroundColor = UIColor.orangeColor()
                    ingredientes.append(indexPath.item)
                    count++
                }
                else{
                    cell?.backgroundColor = UIColor.blackColor()
                    ingredientes = ingredientes.filter{$0 != indexPath.item}
                    count--
                }
            }
            else
            {
                if cell?.backgroundColor == UIColor.orangeColor(){
                    cell?.backgroundColor = UIColor.blackColor()
                    ingredientes = ingredientes.filter{$0 != indexPath.item}
                    count--
                }
                else{
                    let alertController = UIAlertController(title: "Info", message:
                        "No puedes seleccionar más de 5 ingredientes!", preferredStyle: UIAlertControllerStyle.Alert)
                    alertController.addAction(UIAlertAction(title: "Aceptar", style: UIAlertActionStyle.Default,handler: nil))
                    
                    self.presentViewController(alertController, animated: true, completion: nil)
                }
            }
        
    }
    
    override func shouldPerformSegueWithIdentifier(identifier: String?, sender: AnyObject?) -> Bool {
        if count > 0
        {
            return true
        }
        else
        {
            let alertController = UIAlertController(title: "Info", message:
                "Selecciona al menos un ingrediente", preferredStyle: UIAlertControllerStyle.Alert)
            alertController.addAction(UIAlertAction(title: "Aceptar", style: UIAlertActionStyle.Default,handler: nil))
            
            self.presentViewController(alertController, animated: true, completion: nil)
            return false
        }
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
            translateArray()
            let confirmSelector = segue.destinationViewController as! ConfirmController
            confirmSelector.tamanio = tamanio;
            confirmSelector.tipoMasa = tipoMasa;
            confirmSelector.tipoQueso = tipoQueso;
            confirmSelector.ingredientes = ingredientesFinal;
        
        
    }
    
    func translateArray(){
        ingredientesFinal = []
        for (var i = 0; i<ingredientes.count;i++) {
            ingredientesFinal.append(items[ingredientes[i]])
        }
    }


}
