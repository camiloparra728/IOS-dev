//
//  SearchTVController.swift
//  co.pokeApp
//
//  Created by wayne on 7/06/20.
//  Copyright © 2020 wayne. All rights reserved.
//

import UIKit

class SearchTVController: UIViewController,UISearchBarDelegate,UITableViewDelegate,UITableViewDataSource {
        
    @IBOutlet weak var tableView: UITableView!
    
    var dataPokemons = [Pokemon](){
        didSet{DispatchQueue.main.async{self.tableView.reloadData()}}
        }
    var dataPokemonsTypes = [Types](){
    didSet{DispatchQueue.main.async{self.tableView.reloadData()}}
    }
    
    
    var filterData:[Pokemon]! = [];
    var counter=1;
    @IBOutlet weak var searchBar: UISearchBar!
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate=self
        tableView.delegate=self
        tableView.dataSource=self
        let service = PokemonService();
        service.getAll{[weak self] result in
            switch result {
            case .failure(let error):
                print(error)
            case .success(let pokemonsList):
                var pokemons = pokemonsList;
                for i in 0..<pokemons.count {
                           service.getAbilities(url: pokemons[i].url){[weak self] result in
                                      switch result {
                                      case .failure(let error):
                                          print(error)
                                      case .success(let abilities):
                                        pokemons[i].types = abilities
                                        self?.dataPokemons.append(pokemons[i])
                                        self?.filterData.append(pokemons[i])
                               };};
                           
                }
                
        }
            
        }
        
            
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

     func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return filterData.count
    }

     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell",for: indexPath) as! TableViewCell
        let pokemon = dataPokemons[indexPath.row]
        
    
            
            cell.imagePokemon.image = UIImage(named:pokemon.name.lowercased())
            cell.namePokemon.text=pokemon.name;
            cell.idPokemon.text="#000\(self.counter)";
            
            self.counter+=1;
        
        if(pokemon.types != nil){
            
            let fistImage = pokemon.types![0].type!.name.lowercased()+"T";
            cell.firstAbility.image = UIImage(named: fistImage )
            
            if pokemon.types!.count>1{
                let secondImage = pokemon.types![1].type!.name.lowercased()+"T";
                cell.secondAbility.image = UIImage(named: secondImage )
            }
            
            
            
        }
        
        
        
        return cell
    }
    
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filterData=[]
        if searchText == "" {
            filterData = dataPokemons
        }
        else {
            
            for item in dataPokemons {
                if item.name.lowercased().contains(searchText.lowercased()){
                    filterData.append(item)
                }
            }
        }
        
        self.tableView.reloadData()
    }

}
