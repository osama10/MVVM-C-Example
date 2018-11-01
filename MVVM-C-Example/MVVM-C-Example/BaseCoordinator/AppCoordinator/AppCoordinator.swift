//
//  AppCoordinator.swift
//  MVVM-C-Example
//
//  Created by Osama Bin Bashir on 12/10/2018.
//  Copyright © 2018 Osama Bin Bashir. All rights reserved.
//

import Foundation
import UIKit

final class AppCoordinator : Coordinator{
    
    private var window : UIWindow?
    
   lazy var dataStore : DataStore = {
        return DataStoreImp()
    }()
    
    init(window : UIWindow) {
        self.window = window
    }
    var listCoordinator : AnimeListCoordinator!
    
    @discardableResult
    func start()->UIViewController{
        listCoordinator = AnimeListCoordinator(dataStore: dataStore)
        let mainVC = listCoordinator.start()
        self.window?.rootViewController = mainVC
        self.window?.makeKeyAndVisible()
        return mainVC
    }
}
