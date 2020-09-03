//
//  mineCell.swift
//  U17Test
//
//  Created by hjun on 2020/9/3.
//  Copyright © 2020 hjun. All rights reserved.
//

import UIKit

class mineCell: UICollectionViewCell {
    private lazy var iconView: UIImageView = {
        let iw = UIImageView()
        iw.contentMode = .scaleAspectFit
        return iw
    }()
    
    private lazy var titleLabel: UILabel = {
        let tl = UILabel()
        tl.textAlignment = .center
        tl.font = UIFont.systemFont(ofSize: 14)
        tl.textColor = .black
        return tl
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupLayout() {
        contentView.addSubview(iconView)
        iconView.snp.makeConstraints{ make in
            make.left.right.equalToSuperview()
            make.top.equalTo(10)
            make.height.equalTo(contentView.snp.width).multipliedBy(0.5)
        }
        
        contentView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints{ make in
            make.left.bottom.right.equalToSuperview()
            make.top.equalTo(iconView.snp.bottom).offset(-15)
        }
    }
    
    var dict : Dictionary<String , String>? {
        didSet {
            guard let dict = dict else{return}
            iconView.image = UIImage(named: dict["icon"]!)
            titleLabel.text = dict["title"]
        }
    }
    
}
