//
//  DetailViewController.swift
//  UnsplashPictures
//
//  Created by Decagon on 20/12/2021.
//

import UIKit
import SDWebImage

class DetailViewController: UIViewController {
    
    var imageArray: [UnsplashModel] = []
    var position = Int()
    
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .systemBackground
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let createdLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.text = "Created by Leornado Da Vinci"
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.sizeToFit()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationItem.title = "PHOTO DETAIL"
    
        setupScrollViews()
        
        createdLabel.text = "Created by \(imageArray[position].user?.name ?? "")"
        imageView.sd_setImage(with: URL(string: imageArray[position].urls?.thumb ?? ""))
        
 
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(handleGesture))
        swipeRight.direction = .right
        view.addGestureRecognizer(swipeRight)
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(handleGesture))
        swipeRight.direction = .left
        view.addGestureRecognizer(swipeLeft)
        
    }
    
    func setupScrollViews() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(imageView)
        contentView.addSubview(createdLabel)
        
        scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        scrollView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        scrollView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        
        contentView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        contentView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
        
        imageView.anchor(top: contentView.topAnchor, leading: contentView.leadingAnchor, bottom: nil, trailing: contentView.trailingAnchor, padding: UIEdgeInsets(top: 20, left: 10, bottom: 0, right: 10), size: CGSize(width: 0, height: 600))
        
        createdLabel.anchor(top: imageView.bottomAnchor, leading: contentView.leadingAnchor, bottom: contentView.bottomAnchor, trailing: contentView.trailingAnchor, padding: UIEdgeInsets(top: 20, left: 10, bottom: 10, right: 10))
    }
}


// Gesture Handlers
extension DetailViewController {
    @objc func handleGesture(gesture: UISwipeGestureRecognizer) -> Void {
        var detailImage = imageArray[position]
        switch gesture.direction {
        case .left:
            if  position < imageArray.count - 1 {
                position = position + 1
                detailImage = imageArray[position]
                createdLabel.text = "Created by \(detailImage.user?.name ?? "")"
                imageView.sd_setImage(with: URL(string: detailImage.urls?.thumb ?? ""))
                imageView.leftToRightAnimation()
            }
        case .right:
            if position > 0 {
                position = position - 1
                detailImage = imageArray[position]
                createdLabel.text = "Created by \(detailImage.user?.name ?? "")"
                imageView.sd_setImage(with: URL(string: detailImage.urls?.thumb ?? ""))
                imageView.rightToLeftAnimation()
            }
        default:
            break
        }
    }
}
