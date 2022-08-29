//
//  DetailViewController.swift
//  mobileTest
//
//  Created by Sillas Santos on 24/08/22.
//

import Foundation
import UIKit

class DetailViewController: UIViewController {
    
    var detailView: DetailView?
    var detailViewModel: DetailViewModel = DetailViewModel()
    
    override func loadView() {
        detailView = DetailView()
        self.view = detailView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        detailViewModel.delegate(delegate: self)
        detailViewModel.fetchOfferDetail()
    }
}

extension DetailViewController: DetailViewModelDelegate {
    func successRequest() {
        print("Deu certo")
        print("\(detailViewModel.offer)")
         
        detailView?.detailModel?.title = detailViewModel.offer[0]._embedded.request.title
    }
    
    func errorRequest() {
        print("Deu ruim")
    }
}

