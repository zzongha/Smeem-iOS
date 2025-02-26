//
//  RandomSubjectView.swift
//  Smeem-iOS
//
//  Created by Joon Baek on 2023/05/03.
//

import UIKit

import SnapKit

class RandomSubjectView: UIView {
    
    private let questionLabel: UILabel = {
        let label = UILabel()
        label.font = .b1
        label.textColor = .point
        label.setTextWithLineHeight(lineHeight: 21)
        label.text = "Q."
        return label
    }()
    
    private let contentLabel: UILabel = {
        let label = UILabel()
        label.font = .b4
        label.textColor = .smeemBlack
        label.numberOfLines = 0
        label.setTextWithLineHeight(lineHeight: 22)
//        label.text = "     " + "한 줄일 때"
        label.text = "     " + "오늘부터 딱 일주일 후! 설레는 크리스마스네요.\n일주일 전부터 세워보는 나의 크리스마스 계획은?"
        return label
    }()
    
    private let refreshButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .gray200
        //TODO: 에셋 나오면 추가할게여!
        //button.setImage(<#T##image: UIImage?##UIImage?#>, for: <#T##UIControl.State#>)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        setRandomSubjectViewUI()
        setRandomSubjectViewLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension RandomSubjectView {
    private func setRandomSubjectViewUI() {
        backgroundColor = .gray100
    }
    
    private func setRandomSubjectViewLayout() {
        addSubviews(questionLabel, contentLabel, refreshButton)
        
        questionLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(20)
            $0.leading.equalToSuperview().offset(18)
        }
        
        contentLabel.snp.makeConstraints {
            $0.top.equalTo(questionLabel)
            $0.leading.equalTo(questionLabel)
            $0.width.equalToSuperview().offset(-36)
        }
        
        refreshButton.snp.makeConstraints {
            $0.bottom.equalToSuperview().offset(-20)
            $0.trailing.equalToSuperview().offset(-18)
            //TODO: 에셋 나오면 삭제 예정
            $0.width.height.equalTo(18)
        }
        
        setRandomSubjectViewHeight()
    }
    
    private func setRandomSubjectViewHeight() {
        let labelWidth = UIScreen.main.bounds.width - 36
        contentLabel.preferredMaxLayoutWidth = labelWidth
        
        contentLabel.setNeedsLayout()
        contentLabel.layoutIfNeeded()
        
        let contentLabelHeight = contentLabel.frame.height
        
        snp.makeConstraints {
            $0.height.equalTo(contentLabelHeight < 20 ? 88 : 110)
        }
    }
}
