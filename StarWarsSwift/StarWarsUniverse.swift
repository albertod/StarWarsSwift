//
//  StarWarsUniverse.swift
//  StarWarsSwift
//
//  Created by Alberto Di Martino on 5/16/15.
//  Copyright (c) 2015 DiMartino. All rights reserved.
//

import Foundation
import UIKit


class StarsWarsUniverse{
    
    var rebelsArray = [StarWarsCharacter]()
    var imperialsArray = [StarWarsCharacter] ()
    
    let rebelsSection = 1
    let imperialSection = 0


    func rebelCount() ->Int{
        return self.rebelsArray.count
    }
    
    func imperialCount() -> Int{
        return self.imperialsArray.count
    }
    
    func rebelAtIndex(index : Int) -> StarWarsCharacter{
        return self.rebelsArray[index]
    }
    
    func imperialAtIndex(index : Int) -> StarWarsCharacter{
        return self.imperialsArray[index]
    }
    
    
    init(){
        
        //Imperials
        
        var vader = StarWarsCharacter(nombre: "Anakin Skywalker", alias: "Darth Vader", imagen: UIImage(named:"darthVader.jpg"), sonido: "vader.caf", wikiURL: "http://en.wikipedia.org/wiki/Darth_Vader")
        
        //Rebels
        var chewbacca = StarWarsCharacter(nombre: "chewbacca", alias: "chew", imagen: UIImage(named:"chewbacca.jpg"), sonido: "chewbacca.caf", wikiURL: "http://en.wikipedia.org/wiki/Chewbacca")
        var c3po = StarWarsCharacter(nombre: "C-3PO", alias: "C-3PO", imagen: UIImage(named:"c3po.jpg"), sonido: "c3po.caf", wikiURL: "http://en.wikipedia.org/wiki/C-3PO")
        
        
        self.imperialsArray.append(vader)
        self.rebelsArray.append(chewbacca)
        self.rebelsArray.append(c3po)
        
    }
    
    func characterAtIndexPath(indexPath : NSIndexPath) -> StarWarsCharacter{
        
        if indexPath.section == imperialSection{
            
            return imperialsArray[indexPath.row]
        }
        
        else{
            return rebelsArray[indexPath.row]
        }
        
    }

}


