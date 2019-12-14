//
//  ViewController.swift
//  Pokedex
//
//  Created by Alay Shah on 12/6/19.
//  Copyright © 2019 Alay Shah. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
   
   
    let api = PokemonAPI()
    var pokemonList: [Pokemon]?
 
    let tableView = UITableView()
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "PokemonName")
        pokemonList = api.getPokemonList()
        setUpTableView()
        // Do any additional setup after loading the view.
    }
    func setUpTableView(){
           tableView.delegate = self
           tableView.dataSource = self
           view.addSubview(tableView)
           tableView.frame = view.frame
           
       }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pokemonList?.count ?? 0
       }
       
       func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PokemonName", for: indexPath)
        let name = pokemonList?[indexPath.row].name
        cell.textLabel?.text = name
        cell.textLabel?.textColor = .black
        return cell
       }

}

