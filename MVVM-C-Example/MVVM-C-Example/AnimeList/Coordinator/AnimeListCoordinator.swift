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
    var detailViewCoordinator : AnimeDetailViewCoordinator!
    
    init( dataStore : DataStore) {
        self.dataStore = dataStore
    }
    
    func start()->UIViewController{
        
        let listVC = AnimeListCoordinator.instantiateViewController() as! AnimeListViewController
        rootViewController = UINavigationController(rootViewController: listVC)
        let service = AnimeListServiceImp(dataStore: self.dataStore)
        let viewModel = AnimeListViewModelImp(service: service)
        viewModel.coordinatorDelegate = self
        listVC.viewModel = viewModel
        return rootViewController
    }
}

extension AnimeListCoordinator : AnimeListViewModelCoordinatorDelegate{
    func didTapOnRow(with data: AnimeModel) {
        detailViewCoordinator = AnimeDetailViewCoordinator(navigationController: self.rootViewController, data: data)
        let detailVC = detailViewCoordinator.start()
        self.rootViewController.pushViewController(detailVC, animated: true)
    }
}

extension AnimeListCoordinator : StoryboardInitializable {
    static var storyboardName: UIStoryboard.Storyboard {
        return .main
    }
}



