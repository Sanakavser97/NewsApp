//
//  NewsListViewController.swift
//  NewsApp
//
//  Created by Sana Kavser  on 21/10/22.
//

import UIKit
import Combine

class NewsListViewController: UIViewController {
    
    var viewModel = NewsListViewModel()
    private var cancellables: Set<AnyCancellable> = []

    @IBOutlet weak var customTitleView: CustomMaskedView!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var newsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        bindViewModel()
        viewModel.fetchNewsList()
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

    }
    
    private func bindViewModel() {
        viewModel.$newsDataFetched
            .sink { [weak self] (value) in
                if value {
                    self?.newsTableView.reloadData()
                }
            }
            .store(in: &cancellables)
        
        viewModel.$loader
            .sink { [weak self] (value) in
                if value {
                    self?.view.showLoader()
                } else {
                    self?.view.removeLoader()
                }
            }
            .store(in: &cancellables)
        
        
        viewModel.$errorString
            .sink { [weak self] (value) in
                self?.present(ErrorAlertView.alertView(value) , animated: true, completion: nil)
            }
            .store(in: &cancellables)
        
        viewModel.$resignKeyboard
            .sink { [weak self] (value) in
                if value {
                    self?.searchBar.resignFirstResponder()
                }
            }
            .store(in: &cancellables)
    }
    
    func setupUI(){
        addDoneButtonOnKeyboard()
        customTitleView.setCustomShadow(cornerRadius: 20, shadowOpacity: 0.5, offset: CGSize(width: 2, height: 2), shadowRadius: 5)
        setupSearchBar()
    }

    func setupSearchBar(){
        searchBar.backgroundImage = UIImage()
        searchBar.searchTextField.backgroundColor = .white
        searchBar.searchTextField.setCustomShadow(cornerRadius: 5, shadowOpacity: 0.5, offset: CGSize(width: 2, height: 2), shadowRadius: 5)
    }
    
    func dataView(noData: Bool){
        let noDataLabel: UILabel  = UILabel(frame: CGRect(x: 0, y: 0, width: newsTableView.bounds.size.width, height: newsTableView.bounds.size.height))
        view.addSubview(noDataLabel)
        noDataLabel.text = noData ? Constants.noData.string : " "
        noDataLabel.textColor = UIColor.gray
        noDataLabel.font = UIFont(name: Constants.appFontRegular.string, size: 20)
        noDataLabel.textAlignment = .center
        newsTableView.backgroundView = noDataLabel
        newsTableView.separatorStyle = .none
    }
    
    func addDoneButtonOnKeyboard(){
        let doneToolbar: UIToolbar = UIToolbar(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50))
        doneToolbar.barStyle = .default
        
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let done: UIBarButtonItem = UIBarButtonItem(title: Constants.doneKey.string, style: .done, target: self, action: #selector(self.doneButtonAction))
        
        let items = [flexSpace, done]
        doneToolbar.items = items
        doneToolbar.sizeToFit()
        
        searchBar.searchTextField.inputAccessoryView = doneToolbar
    }
    
    @objc func doneButtonAction(){
        searchBar.searchTextField.resignFirstResponder()
    }
}



extension NewsListViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if viewModel.filteredRecords.count == 0 && viewModel.dataFetched{
            dataView(noData: true)
            return 0
        } else {
            dataView(noData: false)
            return viewModel.filteredRecords.count
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.NewsCellKey.string) as? NewsTableViewCell
        let record = viewModel.filteredRecords[indexPath.row]
        cell?.titleLabel.text = record.title
        cell?.categoryLabel.text = record.primaryTag
        
        cell?.dateLabel.text = record.publishedAt?.convertDate(ofFormat: FormatDate.yyyMMddHHmmsssSSSZZZZZ.value, toFormat: FormatDate.MMMdyyyy.value)
        if let readTime = record.readTime {
            cell?.readTimeLabel.text = viewModel.getReadMinutes(time: readTime)
        }
        if let imageUrl = record.postImageUrl {
            viewModel.downloadImages(imageURL: imageUrl){ imageResult in
                 cell?.newsImageView.image = imageResult
            }
                
        }
        
        return cell ?? UITableViewCell()
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) as? NewsTableViewCell {
            
            let detailVC = UIStoryboard(name: StoryboardConstant.main.id, bundle: nil).instantiateViewController(withIdentifier: VCConstant.newsDetailViewController.id) as! NewsDetailViewController
            detailVC.modalPresentationStyle = .custom
            detailVC.transitioningDelegate = self
            detailVC.newsImage = cell.newsImageView.image
            detailVC.viewModel = NewsDetailViewModel(record: viewModel.filteredRecords[indexPath.row])
            doneButtonAction()
            present(detailVC, animated: true, completion: nil)
            
            
        }
    }
}





extension NewsListViewController : UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        viewModel.getFilteredRecords(searchText: searchText)
        newsTableView.reloadData()
    }
    
}
