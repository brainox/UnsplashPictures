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
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(imageView)
        
        let images: [UIImage] = [
            UIImage(named: "DSCF6496.jpg"),
            UIImage(named: "DSCF6520.jpg"),
            UIImage(named: "DSCF6518.jpg"),
            UIImage(named: "DSCF6531.jpg"),
            UIImage(named: "DSCF6533.jpg"),
            UIImage(named: "DSCF6597.jpg"),
            UIImage(named: "DSCF6590.jpg"),
            UIImage(named: "DSCF6631.jpg"),
            UIImage(named: "DSCF6544.jpg"),
            UIImage(named: "DSCF6593.jpg")
        ].compactMap { $0 }
        imageView.image = images.randomElement()
        contentView.clipsToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        imageView.frame = contentView.bounds
    }
}
