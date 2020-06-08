//
//  pokemon.model.swift
//  co.pokeApp
//
//  Created by wayne on 7/06/20.
//  Copyright © 2020 wayne. All rights reserved.
//

import Foundation


 
struct PokemonIResponse: Codable {
    var count:NSInteger?
    var next:String?
    var previous:String?
    var results:[Pokemon]?
}



struct Pokemon: Codable {
    var name:String
    var url:URL
    var types:[Types]?
}
 

struct AbilitiesResponse:Codable {
    var types:[Types]?
    var weight:NSInteger?
}
struct Abilities: Codable {
    var ability:Ability
    var is_hidden:Bool?
    var slot:NSInteger?
}

struct Ability: Codable {
    var name:String?
    var url:NSInteger?
}

struct Types: Codable {
    var type:Type?
    var slot:NSInteger?
}

struct Type: Codable {
    var name:String
       var url:URL
}
