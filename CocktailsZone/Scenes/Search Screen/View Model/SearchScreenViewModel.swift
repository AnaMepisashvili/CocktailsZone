//
//  SearchScreenViewModelProtocol.swift
//  CocktailsZone
//
//  Created by Ana Mepisashvili on 16.02.22.
//

import UIKit

protocol SearchScreenViewModelProtocol: AnyObject{
    func getCocktails(pagination: Bool, completion: @escaping (([Cocktails]) -> Void))
}

class SearchScreenViewModel: SearchScreenViewModelProtocol {
    
    //MARK: - Variables
    
    private var apiService: CocktailServiceProtocol!
    
    //MARK: - Init
    
    init(apiService: CocktailServiceProtocol) {
        self.apiService = apiService
    }
    
    //MARK: - Functions
    
    func getCocktails(pagination: Bool, completion: @escaping (([Cocktails]) -> Void)){
        self.apiService.getCocktails(pagination: pagination) { [weak self] cocktails in
            completion(cocktails)
        }
    }
    
}
