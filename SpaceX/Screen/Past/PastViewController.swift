//
//  PastViewController.swift
//  SpaceX
//
//  Created by Baki on 15.01.2025.
//

import UIKit
import TinyConstraints

final class PastViewController: BaseViewController<PastViewModel> {
   
   private let collectionView: UICollectionView = {
       let layout = UICollectionViewFlowLayout()
       layout.scrollDirection = .vertical

       let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
       collectionView.backgroundColor = .clear
       collectionView.showsHorizontalScrollIndicator = false
       collectionView.layer.borderWidth = 0.5
       collectionView.layer.borderColor = UIColor.separator.cgColor
       collectionView.layer.cornerRadius = 8
       collectionView.clipsToBounds = true
       return collectionView
   }()
    
    var refreshControl = UIRefreshControl()

   override func viewDidLoad() {
       super.viewDidLoad()
       addSubviews()
       configureContents()
       subscribeViewModel()
       viewModel.fetchUpcomingData()
   }
}

// MARK: - UILayout
extension PastViewController {
   
   private func addSubviews() {
       view.addSubview(collectionView)
       collectionView.edgesToSuperview(excluding: .top)
       collectionView.topToSuperview().constant = 20
       collectionView.leadingToSuperview()
       collectionView.trailingToSuperview()
   }
}

// MARK: - Configure Contents
extension PastViewController {
   
   private func configureContents() {
       view.backgroundColor = .white
       collectionView.delegate = self
       collectionView.dataSource = self
       collectionView.register(PastCell.self)
       collectionView.refreshControl = refreshControl
       
       refreshControl.addTarget(self, action: #selector(handleRefreshControl), for: .valueChanged)
   }
}

// MARK: - Subscribe View Model
extension PastViewController {
   
   private func subscribeViewModel() {
       viewModel.getDataDidSuccess = { [weak self] in
           guard let self = self else { return }
           DispatchQueue.main.async {
               self.collectionView.reloadData()
               self.refreshControl.endRefreshing()
           }
       }
   }
}

// MARK: - Actions
extension PastViewController {
    
    @objc
    func handleRefreshControl() {
        if refreshControl.isRefreshing {
            viewModel.fetchUpcomingData()
        }
    }
}

// MARK: - CollectionView Delegate
extension PastViewController: UICollectionViewDelegate {
   
}

// MARK: - CollectionView DataSource
extension PastViewController: UICollectionViewDataSource {
   
   func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       let count = viewModel.numberOfItemsAt()
       return count
   }
   
   func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       let cell: PastCell = collectionView.dequeueReusableCell(for: indexPath)
       let cellItem = viewModel.cellItemAt(indexPath)
       cell.set(viewModel: cellItem)
       return cell
   }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension PastViewController: UICollectionViewDelegateFlowLayout {
   
   func collectionView(_ collectionView: UICollectionView,
                       layout collectionViewLayout: UICollectionViewLayout,
                       sizeForItemAt indexPath: IndexPath) -> CGSize {
       let cellWidth = view.frame.width
       return CGSize(width: cellWidth, height: 80)
   }
   
   func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
       return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
   }
   
   func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
       return 10
   }
   
   func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
       return CGSize(width: collectionView.bounds.width, height: 50)
   }
}
