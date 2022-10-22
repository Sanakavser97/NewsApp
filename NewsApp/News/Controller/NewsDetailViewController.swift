//
//  NewsDetailViewController.swift
//  NewsApp
//
//  Created by Sana Kavser  on 22/10/22.
//

import Foundation

import UIKit
import Combine

class NewsDetailViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var category: UILabel!
    @IBOutlet weak var newsImageView: UIImageView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var readTimeLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var imageBorderView: UIView!
    @IBOutlet weak var customTopView: CustomNotRightBottomMaskedView!
    @IBOutlet weak var customBottomView: CustomNotLeftTopMaskedView!
    
    var viewModel: NewsDetailViewModel?
    var newsImage: UIImage?
    var dismissedView = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
       setLabels()
        
    }
    
    func setUI(){
        newsImageView.layer.cornerRadius = 10
        imageBorderView.setCustomShadow(cornerRadius: 10, shadowOpacity: 0.5, offset: CGSize(width: 0.0, height: 4.0), shadowRadius: 4)

        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        if !dismissedView{
            customAnimateOpen()
        }
        
    }
    
   
    func customAnimateOpen(){
        UIView.animate(withDuration: 2.0, delay: 0.5, options: .curveEaseOut, animations: {
          var topFrame = self.customTopView.frame
            topFrame.origin.y -= topFrame.size.height * 0.6
            topFrame.origin.x -= topFrame.size.width * 0.5
          
          var bottomFrame = self.customBottomView.frame
          bottomFrame.origin.y += bottomFrame.size.height * 0.65
            bottomFrame.origin.x += bottomFrame.size.width * 0.5
          
          self.customTopView.frame = topFrame
          self.customBottomView.frame = bottomFrame
        }, completion: { finished in
          
        })
    }


    
    func setLabels() {
        titleLabel.text = viewModel?.record?.title
        category.text = viewModel?.record?.primaryTag
        newsImageView.image = newsImage
        dateLabel.text = viewModel?.record?.publishedAt?.convertDate(ofFormat: FormatDate.yyyMMddHHmmsssSSSZZZZZ.value, toFormat: FormatDate.MMMdyyyy.value)
        readTimeLabel.text = viewModel?.getReadMinutes(time:viewModel?.record?.readTime ?? "1")
        contentLabel.text = viewModel?.record?.content
        
    }
    
    @IBAction func dismissButtonTapped(_ sender: Any) {
        dismissedView = true
        dismiss(animated: true, completion: nil)
    }
    
    
}
