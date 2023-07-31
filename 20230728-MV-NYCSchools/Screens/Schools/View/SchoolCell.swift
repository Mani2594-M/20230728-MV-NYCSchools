//
//  SchoolCell.swift
//  20230728-MV-NYCSchools
//
//  Created by Mani V on 7/28/23.
//

import UIKit

class SchoolCell: UITableViewCell {

    @IBOutlet weak var schoolBackgroundView: UIView!
    @IBOutlet weak var schoolNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        configureBackgroundView()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    func configureSchoolCell(name: String?) {
        
        schoolNameLabel.text = name
    }
    
    func configureBackgroundView() {
        
        schoolBackgroundView.clipsToBounds = false
        schoolBackgroundView.layer.cornerRadius = 15
        schoolBackgroundView.backgroundColor = .systemGray6
    }
}
