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
    
    weak var window : UIWindow?
    
   lazy var dataStore : DataStore = {
        return DataStoreImp()
    }()
    
    var listCoordinator : AnimeListCoordinator!
    
    init(window : UIWindow) {
        self.window = window
    }
    
    func start() {
        guard let window = self.window else { return }
        listCoordinator = AnimeListCoordinator(window: window, dataStore: dataStore)
        listCoordinator.start()
    }
}
