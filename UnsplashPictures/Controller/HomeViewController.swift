//
//  HomeViewController.swift
//  UnsplashPictures
//
//  Created by Decagon on 19/12/2021.
//

import UIKit

class HomeViewController: UIViewController {
    
    private var photoArrayFromApiFetch = [UnsplashModel]()
    
    private let homeCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: HomeViewController.generateLayout())
        collectionView.backgroundColor = .systemBackground
        return collectionView
    }()
    
    var isPaginating = false
    static var isDonePaginating = false
//    var heightOfActivityIndicator: NSLayoutDimension =
    
    // MARK: - overrides
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchedPhotos()
        setupViews()
    }
    
    
    func fetchedPhotos() {
        ApiManager.shared.createArrayFromAPI(offset: photoArrayFromApiFetch.count) { [weak self] result, error in
            if let error = error {
                print("Error: \(error)")
                return
            }
            guard let responseData = result else {
                return
            }
            
            self?.photoArrayFromApiFetch = responseData

            DispatchQueue.main.async {
                self?.homeCollectionView.reloadData()
            }
        }
    }
    
    func setupViews() {
        view.addSubview(homeCollectionView)
        homeCollectionView.frame = view.bounds
        view.backgroundColor = .white
        navigationItem.title = "HOME"
        
        homeCollectionView.delegate = self
        homeCollectionView.dataSource = self
        homeCollectionView.register(HomeCollectionViewCell.self, forCellWithReuseIdentifier: HomeCollectionViewCell.homeCollectionViewIdentifier)
        homeCollectionView.register(PhotosLoadingFooter.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: PhotosLoadingFooter.identifier)
    }
}

// MARK: - UICollectionViewCompositionalLayout
extension HomeViewController {
    
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
      
        // Footer for activity indicator
        let height: NSCollectionLayoutDimension = Self.isDonePaginating ? .absolute(0) : .absolute(100)
        let footerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                heightDimension: height)
        
        let footer = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: footerSize,
                                                                         elementKind: UICollectionView.elementKindSectionFooter,
                                                                         alignment: .bottom)
        
      let section = NSCollectionLayoutSection(group: nestedGroup)
        section.boundarySupplementaryItems = [footer]
      
      let layout = UICollectionViewCompositionalLayout(section: section)
      return layout
    }
}

// MARK: - UICollectionViewDataSource, UICollectionViewDelegate
extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photoArrayFromApiFetch.count
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeCollectionViewCell.homeCollectionViewIdentifier , for: indexPath) as! HomeCollectionViewCell
        cell.unsplashPhoto = photoArrayFromApiFetch[indexPath.item]

        //initiate pagination
        if indexPath.item == photoArrayFromApiFetch.count - 1 && !isPaginating {
            
            isPaginating = true
            
            
            ApiManager.shared.createArrayFromAPI(offset: photoArrayFromApiFetch.count) { [weak self] result, error in
                if let error = error {
                    print("Error: \(error)")
                    return
                }
                guard let responseData = result else {
                    return
                }
                
                if responseData.count == 0 {
                    Self.isDonePaginating = true
                }
                self?.photoArrayFromApiFetch += responseData


                DispatchQueue.main.async {
                    self?.homeCollectionView.reloadData()
                }
                
                self?.isPaginating = false
            }
            
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let footer = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: PhotosLoadingFooter.identifier, for: indexPath)
        return footer
    }
}

