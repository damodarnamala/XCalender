//
//  File.swift
//  
//
//  Created by Damodar, Namala (623-Extern) on 21/09/20.
//

import Foundation
import UIKit

public class XCalenderCell: UICollectionViewCell {
    
    public static let identifier = String(describing: self)
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        self.setUp()
    }
    
    required init?(coder decoder: NSCoder) {
        super.init(coder: decoder)
    }
    
    public override func awakeFromNib() {
        super.awakeFromNib()
        self.setUp()
        
    }
    
    
    public var headingLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .systemRed
        label.font = UIFont.preferredFont(forTextStyle: .headline)
        return label
    }()
    
    public var subheadline: UILabel =  {
        let label = UILabel()
        label.textColor = .darkGray
        label.textAlignment = .center
        label.font = UIFont.preferredFont(forTextStyle: .subheadline)
        return label
    }()
    
    public var divider: UIImageView =  {
        let imageview = UIImageView()
        imageview.layer.cornerRadius = 1
        return imageview
    }()
    
    public var background: UIImageView =  {
        let imageview = UIImageView()
        return imageview
    }()
    
    public override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    public  override var isSelected: Bool{
        didSet {
            if self.isSelected {
                self.background.layer.cornerRadius = 16
                UIView.animate(withDuration: 0.85, delay: 0, usingSpringWithDamping: 0.25, initialSpringVelocity: 4, options: .curveEaseInOut, animations: { [weak self] in
                    self?.transform = CGAffineTransform(scaleX: 1.25, y: 1.25)
                    self?.divider.backgroundColor = .red
                    self?.background.backgroundColor = UIColor.lightGray.withAlphaComponent(0.25)
                    self?.background.layer.cornerRadius = 8
                })
            } else {
                self.divider.backgroundColor = .clear
                self.background.layer.cornerRadius = 0
                self.transform = CGAffineTransform.identity
                self.background.backgroundColor = .clear
            }
        }
    }
    
    func setUp() {
        self.addSubview(headingLabel)
        self.addSubview(subheadline)
        self.addSubview(divider)
        self.addSubview(background)
        
        self.headingLabel.translatesAutoresizingMaskIntoConstraints = false
        self.subheadline.translatesAutoresizingMaskIntoConstraints = false
        self.divider.translatesAutoresizingMaskIntoConstraints = false
        
        self.headingLabel.leadingAnchor(equalTo: self.leadingAnchor, constant: px8)
        self.headingLabel.trailingAnchor(equalTo: self.trailingAnchor, constant: -px8)
        self.headingLabel.heightAnchor(equalTo: self.heightAnchor, multiplier: px0_4)
        self.headingLabel.topAnchor(equalTo: self.topAnchor, constant: px8)
        
        self.subheadline.leadingAnchor(equalTo: self.leadingAnchor, constant: px8)
        self.subheadline.trailingAnchor(equalTo: self.trailingAnchor, constant: -px8)
        self.subheadline.heightAnchor(equalTo: self.heightAnchor, multiplier: px0_4)
        self.subheadline.bottomAnchor(equalTo: self.bottomAnchor, constant: -px8)
        
        self.background.leadingAnchor(equalTo: self.leadingAnchor, constant: px8)
        self.background.trailingAnchor(equalTo: self.trailingAnchor, constant: -px8)
        self.background.topAnchor(equalTo: self.topAnchor, constant: px8)
        self.background.bottomAnchor(equalTo: self.bottomAnchor, constant: -px8)
        
        self.divider.centerXAnchor(equalTo: self.centerXAnchor)
        self.divider.centerYAnchor(equalTo: self.centerYAnchor)
        self.divider.heightAnchor(equalTo: px1_5)
        self.divider.leadingAnchor(equalTo: self.leadingAnchor, constant: px16)
        self.divider.trailingAnchor(equalTo: self.trailingAnchor, constant: -px16)
    }
}

extension XCalenderCell: ReusableView {
    
}
