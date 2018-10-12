//
//  AnimeListServiceImp.swift
//  MVVM-C-Example
//
//  Created by Osama Bin Bashir on 12/10/2018.
//  Copyright © 2018 Osama Bin Bashir. All rights reserved.
//

import Foundation

class AnimeListServiceImp : AnimeListService {
    
    var dataStore: DataStore

    init(dataStore : DataStore) {
        self.dataStore = dataStore
    }
    func getAnimeList(response: @escaping ([AnimeModel]) -> ()) {
        let data = dataStore.getAllAnime()
        response(data)
    }
    
    func getAnime(by id: Int, response: @escaping (AnimeModel?) -> ()) {
        let data = dataStore.getAnime(by: id)
        response(data)
    }
    
}
