//
//  ViewController.swift
//  20230728-MV-NYCSchools
//
//  Created by Mani V on 7/28/23.
//

import UIKit

class SchoolsViewController: UIViewController {
    
    @IBOutlet weak var schoolsTableView: UITableView!
    private var viewModel = SchoolViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        configureTableView()
    }
}

extension SchoolsViewController {
    
    func configureTableView() {
        
        schoolsTableView.register(UINib(nibName: "SchoolCell", bundle: nil), forCellReuseIdentifier: "SchoolCell")
        initiateSchoolViewModel()
        observeEvent()
    }
    
    func initiateSchoolViewModel() {
        viewModel.fetchSchools()
    }
    
    // Method for data binding and communication
    func observeEvent() {
        
        viewModel.eventHandler = { [weak self] event in
            guard let self else { return }
            
            switch event {
            case .loading:
                print("Schools are loading")
            case .stopLoading:
                print("Stop Loading.")
            case .dataLoaded:
                print("Data is Loaded")
                DispatchQueue.main.async {
                    self.schoolsTableView.reloadData()
                }
            case .error(let error):
                print(error as Any)
            }
        }
    }
}

// MARK: DATA SOURCE METHODS

extension SchoolsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return viewModel.getNumberOfSchools()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "SchoolCell") as? SchoolCell else {
            return UITableViewCell()
        }
        cell.configureSchoolCell(name: viewModel.getSchoolName(index: indexPath.row))
        return cell
    }
}

// MARK: DELEGATE METHODS

extension SchoolsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let school = viewModel.getSchool(index: indexPath.row)
        performSegue(withIdentifier: SegueConstants.schoolDetails, sender: school)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if (segue.identifier == SegueConstants.schoolDetails) {
            if let destinationViewController = segue.destination as? SchoolDetailsViewController, let school = sender as? School {
                destinationViewController.detailViewModel = SchoolDetailViewModel(school: school)
            }
        }
    }
}
