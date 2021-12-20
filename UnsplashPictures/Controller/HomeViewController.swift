//
//  HomeViewController.swift
//  UnsplashPictures
//
//  Created by Decagon on 19/12/2021.
//

import UIKit

class HomeViewController: UIViewController {
    
    private var photoArrayFromApiFetch = [UnsplashModel]()
    
    private let homeCollectionViewController: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: HomeViewController.generateLayout())
        collectionView.backgroundColor = .systemBackground
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ApiManager.shared.createArrayFromAPI { [weak self] result, error in
            if let error = error {
                print("Error: \(error)")
                return
            }
            guard let responseData = result else {
                return
            }
            if let result = result {
                self?.photoArrayFromApiFetch = result
            }
            DispatchQueue.main.async { [weak self] in
                self?.homeCollectionViewController.reloadData()
            }
            print("This is the response data: \(responseData)")
        }
        setupViews()
    }
    
    func setupViews() {
        view.addSubview(homeCollectionViewController)
        homeCollectionViewController.frame = view.bounds
        view.backgroundColor = .white
        
        
        homeCollectionViewController.delegate = self
        homeCollectionViewController.dataSource = self
        homeCollectionViewController.register(HomeCollectionViewCell.self, forCellWithReuseIdentifier: HomeCollectionViewCell.homeCollectionViewIdentifier)
    }
    
    static func generateLayout() -> UICollectionViewLayout {
        
      //Style 1:
      let fullPhotoItem = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalWidth(2/3)))
      
      fullPhotoItem.contentInsets = NSDirectionalEdgeInsets(top: 2, leading: 2, bottom: 2, trailing: 2)
      
      //Style 2: Mian with pair
      //3
      let mainItem = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(2/3), heightDimension: .fractionalHeight(1.0)))
      
      mainItem.contentInsets = NSDirectionalEdgeInsets(top: 2, leading: 2, bottom: 2, trailing: 2)
      
      //2
      let pairItem = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(0.5)))
      
      pairItem.contentInsets = NSDirectionalEdgeInsets(top: 2, leading: 2, bottom: 2, trailing: 2)
      
      let trailingGroup = NSCollectionLayoutGroup.vertical(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1/3), heightDimension: .fractionalHeight(1.0)), subitem: pairItem, count: 2)
      
      
      // 1
      let mainWithPairGroup = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalWidth(4/9)), subitems: [
                                                                  
                                                                  mainItem, trailingGroup])
      
      // Third type. Triplet
      let tripleItem = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1/3), heightDimension: .fractionalHeight(1.0)))
      
      tripleItem.contentInsets = NSDirectionalEdgeInsets(top: 2, leading: 2, bottom: 2, trailing: 2)
      
      let tripletGroup = NSCollectionLayoutGroup.horizontal(
        layoutSize: NSCollectionLayoutSize(
          widthDimension: .fractionalWidth(1.0),
          heightDimension: .fractionalWidth(2/9)),
        subitems: [tripleItem, tripleItem, tripleItem])
      
      // Fourth type. Reversed main with pair
      let mainWithPairReversedGroup = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalWidth(4/9)), subitems: [trailingGroup, mainItem])

      
      let nestedGroup = NSCollectionLayoutGroup.vertical(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalWidth(16/9)), subitems: [
                                                          fullPhotoItem, mainWithPairGroup,
                                                          tripletGroup,
                                                          mainWithPairReversedGroup])
      
      let section = NSCollectionLayoutSection(group: nestedGroup)
      
      let layout = UICollectionViewCompositionalLayout(section: section)
      return layout
    }
}

extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photoArrayFromApiFetch.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeCollectionViewCell.homeCollectionViewIdentifier , for: indexPath) as! HomeCollectionViewCell
        cell.unsplashPhoto = photoArrayFromApiFetch[indexPath.item]
        return cell
    }
    
    
}
