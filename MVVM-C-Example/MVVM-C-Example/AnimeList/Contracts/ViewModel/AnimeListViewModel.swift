//
//  AnimeListViewModel.swift
//  MVVM-C-Example
//
//  Created by Osama Bin Bashir on 12/10/2018.
//  Copyright © 2018 Osama Bin Bashir. All rights reserved.
//

import Foundation

protocol AnimeListViewModelCoordinatorDelegate : class{
    func didTapOnRow(with data : AnimeModel)
}

protocol AnimeListViewModel : class{
    
    var data : [AnimeModel]?{ get }
    var service : AnimeListService{ get }
    var coordinatorDelegate : AnimeListViewModelCoordinatorDelegate?{get set}
    var title : String{ get }
    
    var showData : (()->())?{ get set}
    var showLoader : (()->())?{get set}
    var hideLoader : (()->())?{get set}
    
    func didTapOnAnime(of index : Int)
    func heightForRow(at index : Int, of section : Int)->Int
    func numberOfRowsInSection(section : Int)->Int
    func viewDidLoad()
    func getAnimeName(at index : Int)->String
}
