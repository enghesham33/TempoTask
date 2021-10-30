//
//  NewsListView.swift
//  TempoTask
//
//  Created by Hesham Donia on 30/10/2021.
//

import UIKit

class NewsListView: BaseView {
    
    var presenter: NewsListPresenterProtocol?
    var timer: Timer!
    var count = 0.5
    
    @IBOutlet weak var searchBar: UISearchBar! {
        didSet {
            searchBar.delegate = self
        }
    }
    @IBOutlet weak var articlesTableView: UITableView! {
        didSet {
            let nib = UINib(nibName: NewsItemCell.identifier, bundle: nil)
            articlesTableView.register(nib, forCellReuseIdentifier: NewsItemCell.identifier)
            articlesTableView.dataSource = self
            articlesTableView.delegate = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }
}

extension NewsListView: NewsListViewProtocol {
    func showNewsList() {
        articlesTableView.reloadData()
    }
}

extension NewsListView: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.getNumberOfItems() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NewsItemCell.identifier, for: indexPath) as! NewsItemCell
        cell.newsItem = presenter?.getItemForRow(index: indexPath.row)
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard indexPath.row == (presenter?.getNumberOfItems() ?? 0) - 1 else {
            return
        }
        
        presenter?.getNewsList(searchText: searchBar.text ?? "Egypt", startFrom: "2021-10-01")
    }
}

extension NewsListView: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if timer != nil {
            timer.invalidate()
            count = 0.5
        }
       
        if searchText.count > 0 {
            timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) { [weak self] Timer in
                guard let self = self else {return}
                if self.count > 0 {
                    print ("\(self.count) seconds")
                    self.count -= 0.5
                } else {
                    self.timer.invalidate()
                    self.count = 0.5
                    self.presenter?.getNewsList(searchText: searchText, startFrom: "2021-10-01")
                    searchBar.endEditing(true)
                }
            }
        }
    }
}
