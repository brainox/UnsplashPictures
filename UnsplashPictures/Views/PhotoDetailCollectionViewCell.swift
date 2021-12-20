//
//  PhotoDetailCollectionViewCell.swift
//  UnsplashPictures
//
//  Created by Decagon on 18/12/2021.
//

import UIKit

class PhotoDetailCollectionViewCell: UICollectionViewCell {
    
    static let photoDetailCollectionViewCell = "PhotoDetailCollectionViewCell"
    
    let photoDetailImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "house")
        return imageView
    }()
    
    let followersCountLabel: UILabel = {
        let name = UILabel()
        name.text = "34.2k"
        return name
    }()
    
    let followersTextLabel: UILabel = {
        let name = UILabel()
        name.text = "Followers"
        return name
    }()
    
    let photosCountLabel: UILabel = {
        let name = UILabel()
        name.text = "Photos"
        return name
    }()
    
    let photosTextLabel: UILabel = {
        let name = UILabel()
        name.text = "851"
        return name
    }()
    
    let likesCountLabel: UILabel = {
        let name = UILabel()
        name.text = "Likes"
        return name
    }()
    
    let likesTextLabel: UILabel = {
        let name = UILabel()
        name.text = "984"
        return name
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .purple
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
