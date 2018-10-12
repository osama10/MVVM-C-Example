//
//  AnimeDetailViewModel.swift
//  MVVM-C-Example
//
//  Created by Osama Bin Bashir on 12/10/2018.
//  Copyright © 2018 Osama Bin Bashir. All rights reserved.
//

import Foundation


protocol AnimeDetailViewModel {
    var data : AnimeModel{ get }
    var title : String{ get }

    var showData : ((AnimeModel)->())?{ get set }
    
    func viewDidLoad()
}
