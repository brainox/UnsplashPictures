//
//  HomeCollectionViewCell.swift
//  UnsplashPictures
//
//  Created by Decagon on 19/12/2021.
//

import UIKit
import SDWebImage

class HomeCollectionViewCell: UICollectionViewCell {
    static let homeCollectionViewIdentifier = "HomeCollectionViewCell"
    
    var unsplashPhoto: UnsplashModel? {
        didSet {
            imageView.sd_setImage(with: URL(string: unsplashPhoto?.urls?.thumb ?? ""))
        }
    }
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleToFill
        imageView.layer.cornerRadius = 10
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(imageView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        imageView.frame = contentView.bounds
    }
}
