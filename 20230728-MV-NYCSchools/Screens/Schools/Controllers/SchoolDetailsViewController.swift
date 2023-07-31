//
//  SchoolDetailsViewController.swift
//  20230728-MV-NYCSchools
//
//  Created by Mani V on 7/28/23.
//

import UIKit

class SchoolDetailsViewController: UIViewController {
    
    @IBOutlet weak var readingScoreLabel: UILabel!
    @IBOutlet weak var mathScoreLabel: UILabel!
    @IBOutlet weak var writingScoreLabel: UILabel!
    @IBOutlet weak var detailBackgroundView: UIView!
    @IBOutlet weak var dbnLabel: UILabel!
    
    var detailViewModel: SchoolDetailViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureSchoolDetails()
    }
    
    private func setupUI() {
        
        self.title = "School Information"
        
        detailBackgroundView.clipsToBounds = false
        detailBackgroundView.layer.cornerRadius = 15
        detailBackgroundView.backgroundColor = .systemGray6
    }
    
    private func configureSchoolDetails() {
        
        dbnLabel.text = detailViewModel.getDbnValue()
        readingScoreLabel.text = detailViewModel.getReadingScore()
        mathScoreLabel.text = detailViewModel.getMathScore()
        writingScoreLabel.text = detailViewModel.getWritingScore()
        
    }
}
