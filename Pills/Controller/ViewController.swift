//
//  ViewController.swift
//  Pills
//
//  Created by Nikita  on 3/8/23.
//

import UIKit

class ViewController: UIViewController {
    
    typealias DataSource = UICollectionViewDiffableDataSource<Section, Item>
    private var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    private func createLayout() -> UICollectionViewLayout {
        
        
    }
    
    private func setupCollectionView(){
        collectionView = UICollectionView(frame: view.frame, collectionViewLayout: createLayout())
        
    }
}

