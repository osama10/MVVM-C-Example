//
//  AnimeDetailViewModelImp.swift
//  MVVM-C-Example
//
//  Created by Osama Bin Bashir on 12/10/2018.
//  Copyright © 2018 Osama Bin Bashir. All rights reserved.
//

import Foundation

class AnimeDetailViewModelImp : AnimeDetailViewModel{
    var data: AnimeModel
    var title: String{
        return data.name
    }
    
    var showData: ((AnimeModel) -> ())?
    
    init(data : AnimeModel) {
        self.data = data
    }
   
    func viewDidLoad() {
        self.showData?(self.data)
    }
}
