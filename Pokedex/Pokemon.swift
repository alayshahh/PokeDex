//
//  Pokemon.swift
//  Pokedex
//
//  Created by Alay Shah on 12/6/19.
//  Copyright © 2019 Alay Shah. All rights reserved.
//

import Foundation
import UIKit

struct Pokemon: Codable {
    let name: String
    let url:String
}

struct PokemonListResponse: Codable{
    let count: Int
    let results: [Pokemon]
}






class PokemonAPI{
   
    
    var endpt:String = "https://pokeapi.co/api/v2/pokemon/"
    func getPokemonList()->[Pokemon]{
        var pokemon: [Pokemon] = []
        guard let url = URL(string: endpt) else{
            print("invalid URL")
            return pokemon
        }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let session = URLSession(configuration: URLSessionConfiguration.default)
       
        let task = session.dataTask(with: request) { (data, response, error) in
            
            print("Completed request")
            if let err = error{
                print(err)
                return
            }
            guard let pokedata = data else{
                print("did not get data")
                return
            }
            //convert data to fit our PokemonListResponse
            
            let decoder = JSONDecoder()
            do{
                 var pokemonListResponse = try decoder.decode(PokemonListResponse.self, from: pokedata)
                for poke in pokemonListResponse.results.indices{
                    pokemon.append(pokemonListResponse.results[poke])
                }
            }catch{
                print(error)
            }
            
            
        }
        task.resume()//actually makes the request
        print("made request")
        return pokemon
    }
    
   
    
}
