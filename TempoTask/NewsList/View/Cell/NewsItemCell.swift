//
//  NewsItemCell.swift
//  TempoTask
//
//  Created by Hesham Donia on 30/10/2021.
//

import UIKit
import AlamofireImage

class NewsItemCell: UITableViewCell {
    
    public static let identifier = "NewsItemCell"

    @IBOutlet weak var articlePhotoImageView: UIImageView!
    @IBOutlet weak var articleDescLabel: UILabel!
    @IBOutlet weak var articleSourceLabel: UILabel!
    
    var newsItem: NewsItem! {
        didSet {
            if let image = newsItem.urlToImage, let imageUrl = URL(string: image) {
                articlePhotoImageView.af.setImage(withURL: imageUrl)
            }
            
            articleDescLabel.text = newsItem.description
            articleSourceLabel.text = newsItem.source?.name
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        articlePhotoImageView.image = nil
    }
}
