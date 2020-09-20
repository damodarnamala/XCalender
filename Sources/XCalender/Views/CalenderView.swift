

//  Created by Damodar, Namala
//  Copyright © 2020 Damodar, Namala. All rights reserved.
//


import Foundation
import UIKit

@objc public protocol XCalenderDelegate {
    @objc optional func didSelected(date: Date)
    @objc optional func didSelectedDate(string: String)
}

@IBDesignable
final public class XCallenderView: UIView {
    
    var dateCollection: UICollectionView = {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        layout.itemSize = CGSize(width: 64, height: 84)
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(XCalenderCell.self, forCellWithReuseIdentifier: XCalenderCell.identifier)
        collectionView.backgroundColor = UIColor.white
        return collectionView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setUp()
    }
    
    public override func awakeFromNib() {
        super.awakeFromNib()
        setUp()
    }
    
    required init?(coder decoder: NSCoder) {
        super.init(coder: decoder)
    }
    
    var currentDate: Date = Date()
    var selectedDate: Date = Date()

    public var dalegate: XCalenderDelegate?
    private var hasSelectedDate = false
    var arrayDates: [Date] = []
    
    func setUp() {
        self.addSubview(self.dateCollection)
        hasSelectedDate = false
        self.dateCollection.translatesAutoresizingMaskIntoConstraints = false
        self.dateCollection.leadingAnchor(equalTo: self.leadingAnchor)
        self.dateCollection.trailingAnchor(equalTo: self.trailingAnchor)
        self.dateCollection.topAnchor(equalTo: self.topAnchor)
        self.dateCollection.bottomAnchor(equalTo: self.bottomAnchor)
        
        self.dateCollection.delegate = self
        self.dateCollection.dataSource = self
        updateMonthsInfo()
    }
    
    func updateMonthsInfo() {
        hasSelectedDate = false

        self.arrayDates = self.selectedDate.datesInMonth
        DispatchQueue.main.async {
            self.dateCollection.reloadData()
        }
    }
    
    public func getMonth(by value: Int) {
        
        guard let date =  self.currentDate.month(by: value) else { return }
        updateMonthsInfo()
        hasSelectedDate = false
        self.selectedDate = date
        self.dalegate?.didSelected?(date: date)
    }
}

extension XCallenderView: UICollectionViewDelegate, UICollectionViewDataSource {
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.arrayDates.count
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: XCalenderCell = collectionView.dequeueReusableCell(for: indexPath)
        let date =  self.arrayDates[indexPath.row]
        print(date, self.currentDate)
        if date.isEqualTo(self.selectedDate) && !hasSelectedDate {
            cell.isSelected = true
        }
        let result = date.string(with: "dd EEE").components(separatedBy: " ")
        cell.headingLabel.text = result[0]
        cell.subheadline.text = result[1]
        return cell
    }
    
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        hasSelectedDate = true
        let dateSelected = self.arrayDates[indexPath.item]
        self.selectedDate = dateSelected
        self.dalegate?.didSelected?(date: dateSelected)
        
        print("Selected : \(dateSelected)")
        
    }
}

