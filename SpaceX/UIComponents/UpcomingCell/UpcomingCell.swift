//
//  UpcomingCell.swift
//  SpaceX
//
//  Created by Baki on 15.01.2025.
//


import TinyConstraints
import UIKit

public class UpcomingCell: UICollectionViewCell, ReusableView {
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.height(40)
        imageView.width(40)
        imageView.backgroundColor = .clear
        imageView.tintColor = .label
        return imageView
    }()
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 4
        stackView.alignment = .leading
        return stackView
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 17)
        label.textColor = .label
        return label
    }()
    
    private let dateLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 13)
        label.textColor = .secondaryLabel
        return label
    }()
    
    private let chevronImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "chevron.right")
        imageView.tintColor = .systemGray3
        imageView.contentMode = .scaleAspectFit
        imageView.width(20)
        return imageView
    }()
    
    private let separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = .separator
        view.height(0.5)
        return view
    }()
    
    weak var viewModel: UpcomingCellProtocol?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureContents()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configureContents()
    }
    
    private func configureContents() {
        backgroundColor = .systemBackground
        
        contentView.addSubview(imageView)
        imageView.leadingToSuperview().constant = 16
        imageView.centerYToSuperview()
        
        contentView.addSubview(stackView)
        stackView.addArrangedSubview(nameLabel)
        stackView.addArrangedSubview(dateLabel)
        
        stackView.leadingToTrailing(of: imageView).constant = 12
        stackView.centerYToSuperview()
        
        contentView.addSubview(chevronImageView)
        chevronImageView.trailingToSuperview().constant = -16
        chevronImageView.centerYToSuperview()
        
        stackView.trailingToLeading(of: chevronImageView).constant = -12
        
        contentView.addSubview(separatorView)
        separatorView.leadingToSuperview().constant = 16
        separatorView.trailingToSuperview().constant = -16
        separatorView.bottomToSuperview()
        
    }
    
    public func set(viewModel: UpcomingCellProtocol) {
        self.viewModel = viewModel
        self.nameLabel.text = viewModel.name
        self.dateLabel.text = viewModel.date
        
        if viewModel.imageUrl.isEmpty {
            imageView.image = UIImage(systemName: "exclamationmark.circle.fill")
        } else {
            imageView.setImage(viewModel.imageUrl)
        }
    }
}
