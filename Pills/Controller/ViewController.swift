//
//  ViewController.swift
//  Pills
//
//  Created by Nikita  on 3/8/23.
//

import UIKit

class ViewController: UIViewController {
    
    typealias DataSource = UICollectionViewDiffableDataSource<Section, Item>
    typealias Snapshot = NSDiffableDataSourceSnapshot<Section, Item>
    
    private var dataSource: DataSource!
    private var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        
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
    
    private func setupCollectionView(){
        collectionView = UICollectionView(frame: view.frame, collectionViewLayout: createLayout())
        view.addSubview(collectionView)
        collectionView.register(InfoViewCell.self, forCellWithReuseIdentifier: InfoViewCell.identifier)
        collectionView.dataSource = createDataSource()
        
    }
    
    private func createDataSource() -> DataSource {
        dataSource = DataSource(collectionView: collectionView) { collectionView, indexPath, item in
            switch item.itemView {
                case .infoView:
                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: InfoViewCell.identifier, for: indexPath) as? InfoViewCell else { return nil }
                return cell
            case .vaccination: print("Vaccination view")
                return nil
            case .pill(Pill(name: "Pill", imageName: "ImageName", description: "Decrp")): print("Pill")
                return nil
            default:
                print("default")
                return nil
            }
        }
        
        var snapshot = Snapshot()
        snapshot.appendSections([.info, .vaccinatedView, .main])
        snapshot.appendItems([Item(itemView: .infoView)], toSection: .info)
        snapshot.appendItems([Item(itemView: .vaccination)], toSection: .vaccinatedView)
        snapshot.appendItems([Item(itemView: .pill(Pill(name: "name", imageName: "imageName", description: "String")))])
        dataSource.apply(snapshot)
        return dataSource
    }
}

