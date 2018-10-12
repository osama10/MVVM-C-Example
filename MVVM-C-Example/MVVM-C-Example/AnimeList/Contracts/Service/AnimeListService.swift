//
//  AnimeListService.swift
//  MVVM-C-Example
//
//  Created by Osama Bin Bashir on 12/10/2018.
//  Copyright © 2018 Osama Bin Bashir. All rights reserved.
//

import Foundation

protocol AnimeListService {
    var dataStore : DataStore { get }
   
    func getAnimeList(response : @escaping([AnimeModel])->())
    func getAnime(by id : Int, response : @escaping(AnimeModel?)->())
}
