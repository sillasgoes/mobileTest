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
    }
}

