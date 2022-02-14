//
//  ViewController.swift
//  Rx-CollectionView
//
//  Created by 박상우 on 2022/02/14.
//

import UIKit
import RxCocoa
import RxSwift

class ViewController: UIViewController, UICollectionViewDelegate {
    @IBOutlet weak var collectionView: UICollectionView!
    let dataSourceItems = Observable.of(0..<10)
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureCollectionView()
        self.configureLayout()
        self.bind()
    }

    private func bind() {
        collectionView.rx.setDelegate(self)
            .disposed(by: disposeBag)
        
        // dataSource
        dataSourceItems
            .bind(to: collectionView.rx
                    .items(cellIdentifier: CustomCell.identifier, cellType: CustomCell.self)) { index, color, cell in
                cell.setLabel(index)
            }
            .disposed(by: disposeBag)
        
        // Delegate(itemSelected)
        collectionView.rx
            .itemSelected
            .subscribe(onNext: { index in
                print("index: \(index)")
            })
            .disposed(by: disposeBag)
        
    }
    
    private func configureCollectionView() {
        self.collectionView.register(UINib(nibName: CustomCell.identifier, bundle: nil),
                                     forCellWithReuseIdentifier: CustomCell.identifier)
    }
    
    private func configureLayout() {
        guard let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout else { return }
        
        layout.itemSize = CGSize(width: 200, height: 200)
        layout.minimumLineSpacing = 20
    }

}

