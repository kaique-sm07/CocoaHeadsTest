//
//  ViewController.swift
//  RandomImages
//
//  Created by Kaique de Souza Monteiro on 01/07/19.
//  Copyright © 2019 Kaique de Souza Monteiro. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let viewModel = ViewModel()

    let refreshControl = UIRefreshControl()

    @IBOutlet weak var table: UITableView!

    @objc func refresh() {
        viewModel.objects = []
        viewModel.getImages(success: {
            self.table.reloadData()
        })
        refreshControl.endRefreshing()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if #available(iOS 10.0, *) {
            table.refreshControl = refreshControl
        } else {
            table.addSubview(refreshControl)
        }

        refreshControl.addTarget(self, action:  #selector(refresh), for: .valueChanged)
        viewModel.getImages(success: {
            self.table.reloadData()
        })
        // Do any additional setup after loading the view.
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.objects.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        let image = viewModel.objects[indexPath.row]
        cell.configure(imageUrl: image.imageUrl, author: image.author)
        return cell
    }

    
}

