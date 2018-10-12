//
//  AnimeListCoordinator.swift
//  MVVM-C-Example
//
//  Created by Osama Bin Bashir on 12/10/2018.
//  Copyright © 2018 Osama Bin Bashir. All rights reserved.
//

import Foundation
import UIKit

class AnimeListCoordinator: Coordinator {
    
    weak var rootViewController: UINavigationController!
    var dataStore : DataStore
    var window : UIWindow?
    var detailViewCoordinator : AnimeDetailViewCoordinator!
    
    init( window : UIWindow, dataStore : DataStore) {
        self.dataStore = dataStore
        self.window = window
    }
    
    func start() {
        
        let listVC = AnimeListCoordinator.instantiateViewController() as! AnimeListViewController
        rootViewController = UINavigationController(rootViewController: listVC)
        let service = AnimeListServiceImp(dataStore: self.dataStore)
        let viewModel = AnimeListViewModelImp(service: service)
        viewModel.coordinatorDelegate = self
        listVC.viewModel = viewModel
        self.window?.rootViewController = rootViewController
    }
}

extension AnimeListCoordinator : AnimeListViewModelCoordinatorDelegate{
    func didTapOnRow(with data: AnimeModel) {
        detailViewCoordinator = AnimeDetailViewCoordinator(navigationController: self.rootViewController, data: data)
        detailViewCoordinator.start()
    }
}

extension AnimeListCoordinator : StoryboardInitializable {
    static var storyboardName: UIStoryboard.Storyboard {
        return .main
    }
}



