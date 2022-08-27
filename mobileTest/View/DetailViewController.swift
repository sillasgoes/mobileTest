//
//  DetailViewController.swift
//  mobileTest
//
//  Created by Sillas Santos on 24/08/22.
//

import Foundation
import UIKit

class DetailViewController: UIViewController {
    
    let detailView = DetailView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = detailView
        detailView.tableView.delegate = self
        detailView.tableView.dataSource = self
        detailView.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    
}

extension DetailViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! UITableViewCell
        
        return cell 
    }
    
    
}
