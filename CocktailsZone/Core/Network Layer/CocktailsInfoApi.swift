//
//  CocktailsNameApi.swift
//  CocktailsZone
//
//  Created by Ana Mepisashvili on 16.02.22.
//

import Foundation

protocol CocktailServiceProtocol: AnyObject {
    func getCocktails(pagination: Bool, completion: @escaping ([Cocktails]) -> Void)
}

class CocktailsInfoApi: CocktailServiceProtocol {

    private var count = 0
    
    func getCocktails(pagination: Bool, completion: @escaping ([Cocktails]) -> Void) {
        
        if pagination {
            count += 1
        }
        
        let url = "https://www.thecocktaildb.com/api/json/v1/1/search.php?s=\(count)"
        
        NetworkManager.shared.get(url: url) { (result: Result<[Cocktails], Error>) in
            switch result {
            case .success(let response):
                DispatchQueue.main.async {
                    completion(response)
                }
            case .failure(let err):
                
                print(err)
            }
        }
    }
    
}
