//
//  PhotosCollectionView.swift
//  UnsplashPictures
//
//  Created by Decagon on 18/12/2021.
//

import UIKit

class PhotoDetailCollectionViewController: UIViewController {
    
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        collectionView.register(PhotoDetailCollectionViewCell.self, forCellWithReuseIdentifier: photosCellID)
//        collectionView.backgroundColor = .systemPink
//    }
//
//    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return 30
//    }
//
//    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: photosCellID, for: indexPath)
//        cell.backgroundColor = .blue
//        return cell
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        .init(width: view.frame.width, height: 30)
//    }
    
    var photoId = ""
    
    private let photoDetailCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .green
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupLayouts()
    }
    
    func setupViews() {
        view.backgroundColor = .white
        view.addSubview(photoDetailCollectionView)
        
        photoDetailCollectionView.delegate = self
        photoDetailCollectionView.dataSource = self
        photoDetailCollectionView.register(PhotoDetailCollectionViewCell.self, forCellWithReuseIdentifier: PhotoDetailCollectionViewCell.photoDetailCollectionViewCell)
    }
     
    func setupLayouts() {
        photoDetailCollectionView.fillSuperview(padding: .init(top: 20, left: 20, bottom: 20, right: 20))
    }
    
}

extension PhotoDetailCollectionViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotoDetailCollectionViewCell.photoDetailCollectionViewCell, for: indexPath)
        return cell
    }
    
    //CollectionViewDelegateFlowLayout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: view.frame.width, height: 500)
    }
}


