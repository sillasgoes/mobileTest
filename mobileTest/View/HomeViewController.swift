//
//  MainViewController.swift
//  mobileTest
//
//  Created by Sillas Santos on 23/08/22.
//

import Foundation
import UIKit

class HomeViewController: UIViewController {
    
    var homeView: HomeView?
    let homeViewModel = HomeViewModel()
    let apiService = ApiService()
   
    // MARK: - Overrides
    
    var offers = [Offers]()
    var leads = [Leads]()
    
    var link: Link?
    
    override func loadView() {
        homeView = HomeView()
        self.view = homeView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        homeViewModel.delegate(delegate: self)
        self.homeViewModel.fetchAllRequest()
   }
}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate, HomeViewModeDelegate {
    
    func successRequest() {
        homeView?.setupTableViewDelegates(delegate: self, datasource: self)
    }
    
    func errorRequest() {
        print("Error ao realizar a request")
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifier,
                                                 for: indexPath) as! CustomTableViewCell
        
        //cell.customCellModel = CustomCellViewModel().setupDataForCell(data: homeViewModel.leads[indexPath.row])
        cell.customCellModel = CustomCellViewModel().setupDataForCell(data: homeViewModel.offers[indexPath.row])
        cell.configuredViews()
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return homeViewModel.offers.count
    }
}
