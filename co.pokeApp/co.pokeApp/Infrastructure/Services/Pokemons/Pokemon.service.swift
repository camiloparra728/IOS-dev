//
//  ServicePokemon.swift
//  co.pokeApp
//
//  Created by wayne on 7/06/20.
//  Copyright © 2020 wayne. All rights reserved.
//

import Foundation
enum Errors:Error{
    case ServiceDataError
    case ServiceNotAvailable
}
struct PokemonService {
    //let resourceURL:URL
    let APY_KEY=""
    init(){
    //let urlApi="https://pokeapi.co/api/v2/pokemon/"
    //self.resourceURL=URL(string: urlApi)
    }


func getAll(completion: @escaping(Result<[Pokemon],Errors>)->Void){
      let urlApi="https://pokeapi.co/api/v2/pokemon"
     let resourceURL=URL(string: urlApi)!
    
    let dataTask = URLSession.shared.dataTask(with:resourceURL){(data,response,error) in
        if error == nil && data != nil {
            
            let decoder = JSONDecoder()
                           do {
                            
                               let pokemons = try decoder.decode(PokemonIResponse.self, from: data!)
                               
                               completion(.success(pokemons.results!))
                           }
                           catch{
                            
                                  completion(.failure(.ServiceNotAvailable))
                           }
            
            
            
            
        }
        else {
         completion(.failure(.ServiceNotAvailable))
        }
        
    }
        
    

    
    dataTask.resume()
    }
    
    
    func getAbilities(url:URL,completion: @escaping(Result<[Types],Errors>)->Void){
      
    let dataTask = URLSession.shared.dataTask(with:url){(data,response,error) in
        if error == nil && data != nil {
            
            let decoder = JSONDecoder()
                           do {
                            
                               let pokemons = try decoder.decode(AbilitiesResponse.self, from: data!)
                               
                            completion(.success(pokemons.types!))
                           }
                           catch{
                            
                                  completion(.failure(.ServiceNotAvailable))
                           }
            
            
            
            
        }
        else {
         completion(.failure(.ServiceNotAvailable))
        }
        
    }
        
    

    
    dataTask.resume()
    }
    
    
    

}


