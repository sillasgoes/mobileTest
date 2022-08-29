//
//  MainViewController.swift
//  mobileTest
//
//  Created by Sillas Santos on 23/08/22.
//

import Foundation
import UIKit

class HomeViewController: UIViewController {
    
    // MARK: - Properties
    
    var homeView: HomeView?
    let homeViewModel = HomeViewModel()
    let customCell = CustomTableViewCell()
    var type: typeOfRequest? = .Offer
    var link: Link?
    
    // MARK: - Variables
    
    var offers = [Offers]()
    var leads = [Leads]()
    
    // MARK: - Inits & Overrides
    
    override func loadView() {
        homeView = HomeView()
        self.view = homeView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        homeViewModel.delegate(delegate: self)
        homeView?.delegate = self
        self.homeViewModel.fetchOffer()
        self.homeViewModel.fetchLeads()
        setRefreshTable()
    }
    
    // MARK: - Funcs and @objc Funcs
    
    func setRefreshTable() {
        homeView?.tableView.refreshControl = UIRefreshControl()
        homeView?.tableView.refreshControl?.addTarget(self, action: #selector(didPullRefresh), for: .valueChanged)
    }
    
    @objc func didPullRefresh(){
        DispatchQueue.main.async {
            self.homeView?.tableView.refreshControl?.endRefreshing()
        }
    }
}

// MARK: - Extensions

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifier,
                                                 for: indexPath) as! CustomTableViewCell
        
        if type == .Offer {
            cell.customCellModel = CustomCellViewModel().setupDataForCell(data: homeViewModel.offers[indexPath.row])
        }
        
        if type == .Lead {
            cell.customCellModel = CustomCellViewModel().setupDataForCell(data: homeViewModel.leads[indexPath.row])
        }
        
        cell.delegate = self
        cell.configuredViews()
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return homeViewModel.offers.count
    }
}

extension HomeViewController: HomeViewModelDelegate, CustomTableViewCellProtocol, HomeViewProtocolButtonTap {
     
    func didTapButton(type: typeOfRequest) {
        if type == .Offer {
            self.type = .Offer
            homeViewModel.fetchOffer()
            homeView?.reloadData()
        }
        
        if type == .Lead {
            self.type = .Lead
            homeViewModel.fetchLeads()
            homeView?.reloadData()
        }
    }
    
    func didTapButton(link: String) {
        let vc = DetailViewController()
        vc.url = URL(string: link)
        vc.type = type
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func successRequest() {
        homeView?.setupTableViewDelegates(delegate: self, datasource: self)
    }
    
    func errorRequest() {
        print("Error ao realizar a request")
    }
}
