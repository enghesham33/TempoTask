//
//  NewsTemDetailsView.swift
//  TempoTask
//
//  Created by Hesham Donia on 30/10/2021.
//

import UIKit

class NewsItemDetailsView: BaseView {
    
    var presenter: NewsItemDetailsPresenterProtocol?

    @IBOutlet weak var backImageView: UIImageView! {
        didSet {
            backImageView.addTapGesture { [weak self] _ in
                self?.navigationController?.popViewController(animated: true)
            }
        }
    }
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var sourceLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }
    
    @IBAction func showSourceButtonPressed(_ sender: Any) {
        presenter?.openArticleSource(url: presenter?.getNewsItemDetails()?.url ?? "")
    }

}

extension NewsItemDetailsView: NewsItemDetailsViewProtocol {
    func showNewsItem() {
        if let newsItem = presenter?.getNewsItemDetails() {
            titleLabel.text = newsItem.title
            if let image = newsItem.urlToImage, let imageUrl = URL(string: image) {
                photoImageView.af.setImage(withURL: imageUrl)
            }
            descriptionLabel.text = newsItem.description
            contentLabel.text = newsItem.content
            authorLabel.text = "Written by: \(newsItem.author ?? "")"
            dateLabel.text = "Published at: \((newsItem.publishedAt ?? "").split(separator: "T")[0])"
            sourceLabel.text = newsItem.source?.name
        }
    }
}
