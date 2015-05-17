//
//  StarWarsUniverseTableViewController.swift
//  StarWarsSwift
//
//  Created by Alberto Di Martino on 5/17/15.
//  Copyright (c) 2015 DiMartino. All rights reserved.
//

import UIKit

class StarWarsUniverseTableViewController: UITableViewController {
    
    
    var model = StarsWarsUniverse()
    
    init(aModel : StarsWarsUniverse){
        super.init(nibName: nil, bundle: nil)
        self.model = aModel
    }

    required init!(coder aDecoder: NSCoder!) {
        fatalError("init(coder:) has not been implemented")
    }

    //Mark: Table View Data Source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == model.imperialSection{
            return model.imperialCount()
        }else{
            return model.rebelCount()
        }
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var character = StarWarsCharacter?()
        
        if indexPath.section == model.imperialSection{
            character = model.imperialAtIndex(indexPath.row)
        }else{
            character = model.rebelAtIndex(indexPath.row)
        }
        
        let cellID = "StarWarCell"
        let cell: AnyObject = tableView.dequeueReusableCellWithIdentifier(cellID, forIndexPath: indexPath)
        
        cell.imageView??.image = character?.imagen
        cell.textLabel??.text = character?.nombre
        cell.detailTextLabel??.text = character?.alias
        
        return cell as! UITableViewCell
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        if section == model.imperialSection{
            return "Imperials"
        }else{
            return "Rebels"
        }
    }
    
    //Mark: Delegate
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        var character = model.characterAtIndexPath(indexPath)
        
        
    }
}
