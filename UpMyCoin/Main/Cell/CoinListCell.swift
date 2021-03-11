//
//  CoinListCell.swift
//  UpMyCoin
//
//  Created by Min on 2021/03/10.
//

import UIKit

class CoinListCell: UITableViewCell, NibIdentifiable, ClassIdentifiable {

    @IBOutlet weak var koreanNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setData(with data: CoinResponse) {
        koreanNameLabel.text = data.koreanName
    }
}
