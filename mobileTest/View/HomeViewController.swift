//
//  MainViewController.swift
//  mobileTest
//
//  Created by Sillas Santos on 23/08/22.
//

import Foundation
import UIKit

class HomeViewController: UIViewController {
    
    let backView = UIView()
    let navBarView = UIView()
    let stackViewButtons = UIStackView()
    let labelRequest = UILabel()
    let lineViewButtonAvailable = UIView()
    let lineViewButtonAccept = UIView()
    let buttonAvailable = UIButton()
    let buttonAccept = UIButton()
    let tableView = UITableView()
    
    
    // MARK: - Properties
    
    let homeViewModel = HomeViewModel()
    let customCell = CustomTableViewCell()
    var type: typeOfRequest? = .Offer
    var link: Link?
    
    // MARK: - Variables
    
    var offers = [Offers]()
    var leads = [Leads]()
    
    // MARK: - Inits & Overrides
    
    override func viewDidLoad() {
        super.viewDidLoad()
        homeViewModel.delegate(delegate: self)
        startViews()
        homeViewModel.fetchOffer()
        homeViewModel.fetchLeads()
        setRefreshTable()
    }
    
    // MARK: - Funcs and @objc Funcs
    
    func setRefreshTable() {
        tableView.refreshControl = UIRefreshControl()
        tableView.refreshControl?.addTarget(self, action: #selector(didPullRefresh), for: .valueChanged)
    }
    
    @objc func didPullRefresh(){
        DispatchQueue.main.async {
            self.tableView.refreshControl?.endRefreshing()
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

extension HomeViewController: HomeViewModelDelegate, CustomTableViewCellProtocol {
    
    func didTapButton(type: typeOfRequest) {
        if type == .Offer {
            self.type = .Offer
            homeViewModel.fetchOffer()
            reloadData()
        }
        
        if type == .Lead {
            self.type = .Lead
            homeViewModel.fetchLeads()
            reloadData()
        }
    }
    
    func didTapButton(link: String) {
        let vc = DetailViewController()
        vc.url = URL(string: link)
        vc.type = type
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func successRequest() {
        DispatchQueue.main.async {
            self.tableView.delegate = self
            self.tableView.dataSource = self
            self.reloadData()
        }
    }
    
    public func reloadData() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func errorRequest() {
        print("Error ao realizar a request")
    }
}

extension HomeViewController {
    
    // MARK: - Configure Views
    
    func startViews() {
        setupView()
        addConstraints()
        configureViews()
    }
    
    func configureViews() {
        
        backView.translatesAutoresizingMaskIntoConstraints = false
        backView.backgroundColor = Constants.colorBackgroud
        
        navBarView.translatesAutoresizingMaskIntoConstraints = false
        navBarView.backgroundColor = Constants.colorDefault
        
        stackViewButtons.axis = .horizontal
        stackViewButtons.alignment = .bottom
        stackViewButtons.distribution = .fillEqually
        stackViewButtons.backgroundColor = Constants.colorDefault
        stackViewButtons.translatesAutoresizingMaskIntoConstraints = false
        
        labelRequest.translatesAutoresizingMaskIntoConstraints = false
        labelRequest.attributedText = Constants.textWithIcon(imageName: "square.stack.3d.up.fill", text: "Pedidos", width: 30, height: 30, y: -4, color: .white)
        labelRequest.font = UIFont(name: "Rubik",
                                   size: 30)
        labelRequest.textColor = .white
        
        lineViewButtonAvailable.backgroundColor = .white
        lineViewButtonAvailable.translatesAutoresizingMaskIntoConstraints = false
        
        lineViewButtonAccept.backgroundColor = .white
        lineViewButtonAccept.translatesAutoresizingMaskIntoConstraints = false
        lineViewButtonAccept.backgroundColor = Constants.colorBackgroud
        
        buttonAvailable.translatesAutoresizingMaskIntoConstraints = false
        var configurationAvailable = UIButton.Configuration.filled()
        configurationAvailable.title = "Disponíveis"
        configurationAvailable.image = UIImage(systemName: "bag")
        configurationAvailable.imagePadding = 10
        configurationAvailable.background.cornerRadius = 0
        buttonAvailable.configuration = configurationAvailable
        buttonAvailable.tag = 1
        buttonAvailable.addTarget(self, action: #selector(buttonAction(sender:)), for: .touchUpInside)
        
        buttonAccept.translatesAutoresizingMaskIntoConstraints = false
        buttonAccept.setTitle("Aceitos", for: .normal)
        var configurationAccept = UIButton.Configuration.filled()
        configurationAccept.title = "Aceitos"
        configurationAccept.image = UIImage(systemName: "checkmark")
        configurationAccept.imagePadding = 10
        configurationAccept.background.cornerRadius = 0
        buttonAccept.configuration = configurationAccept
        buttonAccept.tag = 2
        buttonAccept.addTarget(self, action: #selector(buttonAction(sender:)), for: .touchUpInside)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: CustomTableViewCell.identifier)
        tableView.backgroundColor = backView.backgroundColor
        tableView.separatorStyle = .none
        tableView.rowHeight = 100
    }
    
    private func setupView(){
        view.addSubview(backView)
        
        backView.addSubview(navBarView)
        backView.addSubview(lineViewButtonAvailable)
        backView.addSubview(lineViewButtonAccept)
        backView.addSubview(tableView)
        
        navBarView.addSubview(labelRequest)
        navBarView.addSubview(stackViewButtons)
        
        stackViewButtons.addArrangedSubview(buttonAvailable)
        stackViewButtons.addArrangedSubview(buttonAccept)
    }
    
    private func addConstraints(){
        NSLayoutConstraint.activate([
            backView.widthAnchor.constraint(equalTo: view.widthAnchor),
            backView.heightAnchor.constraint(equalTo: view.heightAnchor),
            
            navBarView.widthAnchor.constraint(equalTo: backView.widthAnchor),
            navBarView.heightAnchor.constraint(equalTo: backView.heightAnchor, multiplier: 0.25),
            navBarView.topAnchor.constraint(equalTo: backView.topAnchor),
            
            lineViewButtonAvailable.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5),
            lineViewButtonAvailable.heightAnchor.constraint(equalTo: navBarView.heightAnchor, multiplier: 0.030),
            lineViewButtonAvailable.topAnchor.constraint(equalTo: navBarView.bottomAnchor),
            lineViewButtonAvailable.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            
            lineViewButtonAccept.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5),
            lineViewButtonAccept.heightAnchor.constraint(equalTo: navBarView.heightAnchor, multiplier: 0.030),
            lineViewButtonAccept.topAnchor.constraint(equalTo: navBarView.bottomAnchor),
            lineViewButtonAccept.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            tableView.topAnchor.constraint(equalTo: lineViewButtonAccept.bottomAnchor, constant: view.frame.height / 100 * 2),
            tableView.bottomAnchor.constraint(equalTo: backView.safeAreaLayoutGuide.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: backView.safeAreaLayoutGuide.leadingAnchor, constant: view.frame.height / 100 * 2),
            tableView.trailingAnchor.constraint(equalTo: backView.safeAreaLayoutGuide.trailingAnchor, constant: -(view.frame.height / 100 * 2)),
            
            labelRequest.topAnchor.constraint(equalTo: navBarView.safeAreaLayoutGuide.topAnchor, constant: view.frame.width / 100 * 3),
            labelRequest.widthAnchor.constraint(equalTo: navBarView.widthAnchor, multiplier: 0.50),
            labelRequest.leadingAnchor.constraint(equalTo: navBarView.leadingAnchor, constant: view.frame.width / 100 * 7),
            
            stackViewButtons.topAnchor.constraint(equalTo: labelRequest.bottomAnchor, constant: view.frame.width / 100 * 2),
            stackViewButtons.bottomAnchor.constraint(equalTo: navBarView.bottomAnchor),
            stackViewButtons.widthAnchor.constraint(equalTo: navBarView.widthAnchor, multiplier: 1),
            stackViewButtons.heightAnchor.constraint(equalTo: navBarView.heightAnchor, multiplier: 0.3),
        ])
    }
    
    @objc func buttonAction(sender: UIButton){
        if sender.tag == 1 {
            didTapButton(type: .Offer)
            changeColorOfLineButton(type: .Offer)
        } else {
            didTapButton(type: .Lead)
            changeColorOfLineButton(type: .Lead)
        }
    }
    
    func addBottomBorderWithColor(view: UIView, color: UIColor, width: CGFloat) {
        let border = UIView(frame: view.frame)
        border.backgroundColor = UIColor.white
        border.frame = CGRect(x: 0,
                              y: view.frame.size.height,
                              width: view.frame.size.width,
                              height: width
        )
        view.addSubview(border)
    }
    
    func changeColorOfLineButton(type: typeOfRequest) {
        if type == .Offer {
            DispatchQueue.main.async {
                self.lineViewButtonAvailable.backgroundColor = .white
                self.lineViewButtonAccept.backgroundColor = Constants.colorBackgroud
            }
        }
        if type == .Lead {
            DispatchQueue.main.async {
                self.lineViewButtonAvailable.backgroundColor = Constants.colorBackgroud
                self.lineViewButtonAccept.backgroundColor = .white
            }
        }
    }
}
