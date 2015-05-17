//
//  StarWarsUniverse.swift
//  StarWarsSwift
//
//  Created by Alberto Di Martino on 5/16/15.
//  Copyright (c) 2015 DiMartino. All rights reserved.
//

import Foundation


class StarsWarsUniverse{
    
    var rebelsArray = [StarWarsCharacter]()
    var imperialsArray = [StarWarsCharacter] ()



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

}


