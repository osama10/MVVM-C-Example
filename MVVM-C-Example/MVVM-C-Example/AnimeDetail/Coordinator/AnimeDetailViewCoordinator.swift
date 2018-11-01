//
//  AnimeDetailViewCoordinator.swift
//  MVVM-C-Example
//
//  Created by Osama Bin Bashir on 12/10/2018.
//  Copyright © 2018 Osama Bin Bashir. All rights reserved.
//

import Foundation
import UIKit

class AnimeDetailViewCoordinator : Coordinator{
    
    let navigationController : UINavigationController
    let data : AnimeModel
    
    init(navigationController : UINavigationController, data : AnimeModel) {
        self.navigationController = navigationController
        self.data = data
    }
    
    func start()->UIViewController{
        let detailVC = AnimeDetailViewCoordinator.instantiateViewController() as! AnimeDetailViewController
        let viewModel = AnimeDetailViewModelImp(data: self.data)
        detailVC.viewModel = viewModel
        return detailVC
    }
}

extension AnimeDetailViewCoordinator : StoryboardInitializable {
    static var storyboardName: UIStoryboard.Storyboard {
        return .main
    }
}
