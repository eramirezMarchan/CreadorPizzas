//
//  tipoQuesoController.swift
//  PizzaCreator
//
//  Created by Faktos on 17/04/16.
//  Copyright © 2016 ERM. All rights reserved.
//

import UIKit

class tipoQuesoController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    var tamanio:String = ""
    var tipoMasa:String = ""
    let reuseIdentifier = "cell"
    var items = ["Mozarella","Chedar","Parmesano","Sin queso"]
    var images: [String] = ["Mozarella", "Chedar", "Parmesano",""]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.items.count
    }
    
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        // get a reference to our storyboard cell
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! MyCollectionViewCell
        
        // Use the outlet in our custom class to get a reference to the UILabel in the cell
        cell.myLabel.text = self.items[indexPath.item]
        cell.imagen.image = UIImage(named: images[indexPath.row])
        cell.backgroundColor = UIColor.yellowColor() // make cell more visible in our example project
        
        return cell
    }
    
    var queso:String!
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        // handle tap events
        print("You selected cell #\(indexPath.item)!")
        if indexPath.item == 0{
            queso = "Mozarella"
        }
        else if indexPath.item == 1{
            queso = "Chedar"
        }
        else if indexPath.item == 2{
            queso = "Parmesano"
        }
        else if indexPath.item == 3{
            queso = "Sin queso"
        }
        
        performSegueWithIdentifier("passQueso", sender: self)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if(segue.identifier == "passQueso"){
            let ingredienteSelector = segue.destinationViewController as! ingredientesController
            ingredienteSelector.tamanio = tamanio;
            ingredienteSelector.tipoMasa = tipoMasa;
            ingredienteSelector.tipoQueso = queso;
        }
        
    }

}
