//
//  tipoMasaController.swift
//  PizzaCreator
//
//  Created by Faktos on 17/04/16.
//  Copyright © 2016 ERM. All rights reserved.
//

import UIKit

class tipoMasaController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var tamanio:String = ""
    
    @IBOutlet var tableMasa: UITableView!
    
    let masas = ["Delgada","Crujiente","Gruesa"];
    let textCellIdentifier = "TextCellMasa"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableMasa.delegate = self;
        tableMasa.dataSource = self;
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return masas.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(textCellIdentifier, forIndexPath: indexPath)
        
        let row = indexPath.row
        cell.textLabel?.text = masas[row]
        
        return cell
    }
    
    var masa:String!
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print("You selected cell #\(indexPath.row)!")
        
        // Get Cell Label
        let indexPath = tableView.indexPathForSelectedRow!;
        let currentCell = tableView.cellForRowAtIndexPath(indexPath) as UITableViewCell!;
        
        masa = currentCell.textLabel!.text
        
        performSegueWithIdentifier("passMasa", sender: self)
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if(segue.identifier == "passMasa"){
            let quesoSelector = segue.destinationViewController as! tipoQuesoController
            quesoSelector.tamanio = tamanio;
            quesoSelector.tipoMasa = masa;
        }
        
    }


}
