//
//  StarWarsUniverseTableViewController.swift
//  StarWarsSwift
//
//  Created by Alberto Di Martino on 5/17/15.
//  Copyright (c) 2015 DiMartino. All rights reserved.
//

import UIKit
import Foundation

protocol StarWarsUniverseViewControllerDelegate{
    
    func starWarsViewController(_swvc: StarWarsUniverseTableViewController,
        didSelectCharacter: StarWarsCharacter)
}

class StarWarsUniverseTableViewController: UITableViewController,UITableViewDelegate,UITableViewDataSource {
    
    //Mark: Properties
    var model = StarsWarsUniverse()
    let cellID = "StarWarCell"
    var delegate : StarWarsUniverseViewControllerDelegate?
    
    
    init(aModel : StarsWarsUniverse){
        super.init(nibName: nil, bundle: nil)
        self.model = aModel
    }

    required init!(coder aDecoder: NSCoder!) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: cellID)
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
        
        
        var cell:UITableViewCell = self.tableView.dequeueReusableCellWithIdentifier(cellID, forIndexPath: indexPath) as! UITableViewCell
        
        cell.imageView?.image = character?.imagen
        cell.textLabel?.text = character?.nombre
        cell.detailTextLabel?.text = character?.alias
        
        return cell
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
        self.delegate?.starWarsViewController(self,
            didSelectCharacter: character)
        
        //Send notification
        var nc = NSNotificationCenter.defaultCenter()
        var dict = ["characterKey" : character]
        var n = NSNotification(name: "characterDidChange", object:self, userInfo: dict)
        nc.postNotification(n)
        
        
        //Save cordinates of last character selected
        var ns = NSUserDefaults.standardUserDefaults()
        ns.setObject(indexPath.section, forKey: "section")
        ns.setObject(indexPath.row, forKey: "row")
        ns.synchronize()
    }
    
    func starWarsViewController(_swvc: StarWarsUniverseTableViewController,
        didSelectCharacter: StarWarsCharacter){
        // Creamos un CharacterVC
        var charVC = CharacterViewController(aModel: didSelectCharacter)
        // Hago un push
        self.navigationController?.pushViewController(charVC, animated: true)
    }
}
