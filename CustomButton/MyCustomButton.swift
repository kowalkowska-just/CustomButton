//
//  MyCustomButton.swift
//  CustomButton
//
//  Created by Justyna Kowalkowska on 30/10/2020.
//

import UIKit

class MyCustomButton: UIButton {
    
    private let myTitleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    
    private let mySubtitleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    
    private let myIconView: UIImageView = {
        let imageView = UIImageView()
        imageView.tintColor = .white
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private var viewModel: MyCustomButtonViewModel?

    override init(frame: CGRect) {
        self.viewModel = nil
        super.init(frame: frame)
    }
    
    init(with viewModel: MyCustomButtonViewModel) {
        self.viewModel = viewModel
        super.init(frame: .zero)

        addSubviews()
        configure(with: viewModel)
    }
    
    private func addSubviews() {
        guard !myTitleLabel.isDescendant(of: self) else {
            return
        }
        addSubview(myTitleLabel)
        addSubview(mySubtitleLabel)
        addSubview(myIconView)
    }
    
    public func configure(with viewModel: MyCustomButtonViewModel) {
        
        layer.masksToBounds = false
        layer.cornerRadius = 8
//        layer.borderColor = UIColor.secondarySystemBackground.cgColor
//        layer.borderWidth = 1.5
        
        layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        layer.shadowOpacity = 0.5
        layer.shadowRadius = 2
        layer.shadowColor = UIColor.darkGray.cgColor
        
        addSubviews()

        myTitleLabel.text = viewModel.title
        mySubtitleLabel.text = viewModel.subtitle
        myIconView.image = UIImage(systemName: viewModel.imageName)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        /*
         [     ][  title   ]
         [  i  ][          ]
         [     ][ subtitle ]
         */
        
        myIconView.frame = CGRect(
            x: 5,
            y: 5,
            width: 50,
            height: self.frame.height-10
        ).integral
        
        myTitleLabel.frame = CGRect(
            x: 60,
            y: 5,
            width: frame.width-65,
            height: (frame.height-10)/2
        ).integral
        
        mySubtitleLabel.frame = CGRect(
            x: 60,
            y: (frame.height+10)/2,
            width: frame.width-65,
            height: (frame.height-10)/2
        ).integral
    }
    
}

struct MyCustomButtonViewModel {
    let title: String
    let subtitle: String
    let imageName: String
}
