//
//  mineHeadView.swift
//  U17Test
//
//  Created by hjun on 2020/9/3.
//  Copyright © 2020 hjun. All rights reserved.
//

import UIKit

class mineHeadView: UIView {

    lazy var bgImageView : UIImageView = {
       let bgIamgeView = UIImageView()
        bgIamgeView.contentMode = .scaleAspectFill
        bgIamgeView.image = UIImage(named: "mine_sky_bg")
        return bgIamgeView
    }()
    
    lazy var magBtn : UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(named: "noice_pop"), for: .normal)
        return btn
    }()
    
    lazy var headBtn : UIButton = {
       let headBtn = UIButton()
        headBtn.setImage(UIImage(named: "sortPlace"), for: .normal)
        headBtn.backgroundColor = .white
        return headBtn
    }()
    lazy var nikeNameLab: UILabel = {
       let lab = UILabel()
        lab.text = "超级漫友"
        lab.font = .systemFont(ofSize: 25)
        lab.textColor = .white
        return lab
    }()
    
    lazy var introLab : UILabel = {
       let introLab = UILabel()
        introLab.text = "主人已经来到有妖气1天"
        introLab.font = .systemFont(ofSize: 13)
        introLab.textColor = .white
        return introLab
    }()
    
    private lazy var giftBtn: UIButton = {
         let btn = UIButton()
         btn.layer.backgroundColor = UIColor.init(red: 0/255.0, green: 0/255.0, blue: 0/255.0, alpha: 0.3).cgColor
         btn.layer.cornerRadius = 6
         btn.setTitle("    需等待2天  每周定时领取订阅漫画阅读券", for: .normal)
         btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 13)
         btn.setImage(UIImage(named: "timeAct"), for: .normal)
         return btn
     }()

     private lazy var btmView: UIView = {
         let v = UIView()
         v.layer.backgroundColor = UIColor.init(red: 255/255.0, green: 255/255.0, blue: 255/255.0, alpha: 1.0).cgColor
         v.layer.shadowColor = UIColor.init(red: 135/255.0, green: 142/255.0, blue: 154/255.0, alpha: 0.3).cgColor
         v.layer.shadowOffset = CGSize(width: 0, height: 2)
         v.layer.shadowOpacity = 1
         v.layer.shadowRadius = 2
         v.layer.cornerRadius = 6
         v.layer.borderWidth = 1.0
         v.layer.borderColor = UIColor.background.cgColor
         return v
     }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupLayout() {
        addSubview(bgImageView)
        bgImageView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview().inset(UIEdgeInsets(top: 0, left: 0, bottom: 70, right: 0))
            
        }
        addSubview(headBtn)
               headBtn.snp.makeConstraints { (make) in
                   make.left.equalTo(15)
                   make.bottom.equalTo(bgImageView).offset(-95)
                   make.width.equalTo(70)
                   make.height.equalTo(70)
               }
               headBtn.layer.masksToBounds = true
               headBtn.layer.cornerRadius = 35
               headBtn.layer.borderColor = UIColor.white.cgColor
               headBtn.layer.borderWidth = 3

               addSubview(nikeNameLab)
               nikeNameLab.snp.makeConstraints { (make) in
                   make.left.equalTo(headBtn).offset(85)
                   make.bottom.equalTo(headBtn).offset(-30)
                   make.width.equalTo(screenWidth - 100)
               }
               
               addSubview(introLab)
               introLab.snp.makeConstraints { (make) in
                   make.left.equalTo(headBtn).offset(85)
                   make.bottom.equalTo(headBtn).offset(-10)
                   make.width.equalTo(screenWidth - 100)
               }
               
               addSubview(magBtn)
               magBtn.snp.makeConstraints { (make) in
                   make.right.equalTo(-15)
                   make.top.equalTo(nikeNameLab.snp_top).offset(-50)
                   make.width.equalTo(40)
                   make.height.equalTo(40)
               }
               
               addSubview(giftBtn)
               giftBtn.snp.makeConstraints { (make) in
                   make.left.equalTo(15)
                   make.width.equalTo(screenWidth - 30)
                   make.bottom.equalTo(bgImageView).offset(-45)
                   make.height.equalTo(40)
               }
               
               addSubview(btmView)
               btmView.snp.makeConstraints { (make) in
                   make.left.equalTo(15)
                   make.width.equalTo(screenWidth - 30)
                   make.bottom.equalToSuperview().offset(-6)
                   make.height.equalTo(100)
               }
        
         let stackV = UIStackView()
                stackV.spacing = 0
                stackV.alignment = .fill
                stackV.distribution = .fillEqually

                let lb1 = UILabel()
                lb1.text = "未开通\n\n我的VIP"
                lb1.font = .systemFont(ofSize: 15)
                lb1.textColor = .lightGray
                lb1.textAlignment = .center
                lb1.numberOfLines = 0

                let lb2 = UILabel()
                lb2.text = "余额 0\n\n我的妖气币"
                lb2.font = .systemFont(ofSize: 15)
                lb2.textColor = .lightGray
                lb2.textAlignment = .center
                lb2.numberOfLines = 0

                let line = UILabel()
                line.backgroundColor = .background
                line.frame = CGRect(x: (screenWidth - 30)/2-1, y: 25, width: 1, height: 50)

        //        line.snp.makeConstraints { (make) in
        //            make.center.equalTo(stackV)
        //        }
                stackV.addSubview(line)

                stackV.addArrangedSubview(lb1)
                stackV.addArrangedSubview(lb2)
                btmView.addSubview(stackV)

                stackV.snp.makeConstraints { (make) in
                    make.edges.equalTo(btmView.snp_edges)
                }


               
    }
    
}

