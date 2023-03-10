//
//  ViewController.swift
//  Pills
//
//  Created by Nikita  on 3/8/23.
//

import UIKit

class ViewController: UIViewController {

    var dataSource: DataSource!
    var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        
    }
    
    private func setupCollectionView(){
        collectionView = UICollectionView(frame: view.frame, collectionViewLayout: createLayout())
        view.addSubview(collectionView)
        collectionView.register(InfoViewCell.self, forCellWithReuseIdentifier: InfoViewCell.identifier)
        collectionView.dataSource = createDataSource()
        
    }
    
    private func createLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout { (sectionIndex: Int, layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? in
            
            let currentSection = Section(rawValue: sectionIndex)
            let currentSize = currentSection?.getSize()
            let width = currentSize!.0
            let height = currentSize!.1
            
            let size = NSCollectionLayoutSize(widthDimension: .absolute(width), heightDimension: .absolute(height))
            let item = NSCollectionLayoutItem(layoutSize: size)
            
            
            let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
            let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
            
            let section = NSCollectionLayoutSection(group: group)
            section.contentInsets = NSDirectionalEdgeInsets(
              top: 0,
              leading: layoutEnvironment.container.contentSize.width/12,
              bottom: 0,
              trailing: layoutEnvironment.container.contentSize.width/4
            )
            return section
        }
        return layout
    }
}

