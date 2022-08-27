//
//  MainViewController.swift
//  mobileTest
//
//  Created by Sillas Santos on 23/08/22.
//

import Foundation
import UIKit

class HomeViewController: UIViewController {
    
    let homeView = HomeView()
    let homeViewModel = HomeViewModel()
  //  let apiService = ApiService()
    
    // MARK: - Overrides
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = homeView
        homeView.tableView.delegate = self
        homeView.tableView.dataSource = self
        homeViewModel.fetch(typeOf: .Offer)
    }
}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return homeViewModel.getNumberOfRows
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifier,
                                                 for: indexPath) as! CustomTableViewCell
        cell.customCellModel = CustomCellViewModel(data: self.homeViewModel.offer[indexPath.row]).setupDataForCell()
        cell.configuredViews()
        
        return cell
    }
}
