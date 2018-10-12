//
//  AnimeDetailViewController.swift
//  MVVM-C-Example
//
//  Created by Osama Bin Bashir on 12/10/2018.
//  Copyright © 2018 Osama Bin Bashir. All rights reserved.
//

import UIKit

class AnimeDetailViewController: UIViewController {
   
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionTextView: UITextView!
    
    var viewModel : AnimeDetailViewModel!
    
   override func viewDidLoad() {
        super.viewDidLoad()
        self.bindUI()
        self.title = self.viewModel.title
        self.viewModel.viewDidLoad()
    }

    private func bindUI(){
        self.viewModel.showData = { [weak self] (data) in
            guard let `self` = self else { return }
            self.imageView.image = UIImage(named: data.image)
            self.titleLabel.text = data.name
            self.descriptionTextView.text = data.description
        }
    }
}
