//
//  AnimeListViewController.swift
//  MVVM-C-Example
//
//  Created by Osama Bin Bashir on 12/10/2018.
//  Copyright © 2018 Osama Bin Bashir. All rights reserved.
//

import UIKit

class AnimeListViewController: UIViewController {
    
    @IBOutlet weak var tableView : UITableView!
    var viewModel : AnimeListViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.bindUI()
        self.title = self.viewModel.title
        self.viewModel.viewDidLoad()
    }
    
    private func bindUI(){
        self.viewModel.showData = { [weak self] in
            guard let `self` = self else { return }
            self.tableView.reloadData()
        }
        
        self.viewModel.showLoader = { print("Show Loader") }
        self.viewModel.hideLoader = { print("Hide Loader") }
    }
    
}

extension AnimeListViewController : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowsInSection(section: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        cell?.textLabel?.text = self.viewModel.getAnimeName(at: indexPath.row)
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.viewModel.didTapOnAnime(of: indexPath.row)
    }
}
