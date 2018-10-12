//
//  AnimeListViewModel.swift
//  MVVM-C-Example
//
//  Created by Osama Bin Bashir on 12/10/2018.
//  Copyright © 2018 Osama Bin Bashir. All rights reserved.
//

import Foundation

class AnimeListViewModelImp : AnimeListViewModel {

    var data: [AnimeModel]?
    var service: AnimeListService
    var coordinatorDelegate: AnimeListViewModelCoordinatorDelegate?
    
    var showData: (() -> ())?
    var showLoader: (() -> ())?
    var hideLoader: (() -> ())?
    
    private var shouldShowLoader = false{
        didSet{
            (self.shouldShowLoader) ? self.showLoader?() : self.hideLoader?()
        }
    }
    
    init(service : AnimeListService) {
        self.service = service
        shouldShowLoader = true
        self.getData()
    }
    
    func didTapOnAnime(of index: Int) {
        self.coordinatorDelegate?.didTapOnRow(with: self.data![index])
    }
    
    func heightForRow(at index: Int, of section: Int) -> Int {
        return 70
    }
    
    func numberOfRowsInSection(section: Int) -> Int {
        return (data != nil) ? (data?.count)! : 0
    }
    func viewDidLoad() {
        (shouldShowLoader) ? self.showLoader?() : self.hideLoader?()
    }
    
    func getAnimeName(at index: Int) -> String {
        return self.data![index].name
    }
    private func getData(){
        
        self.service.getAnimeList { [weak self](data) in
            guard let `self` = self else { return }
            self.data = data
            self.shouldShowLoader = false
            self.showData?()
        }
    }
}
