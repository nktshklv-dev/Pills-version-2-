//
//  ViewController+DataSource .swift
//  Pills
//
//  Created by Nikita  on 3/11/23.
//

import Foundation
import UIKit

extension ViewController{
    
    typealias DataSource = UICollectionViewDiffableDataSource<Section, Item>
    typealias Snapshot = NSDiffableDataSourceSnapshot<Section, Item>
    
    func createDataSource() -> DataSource {
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
