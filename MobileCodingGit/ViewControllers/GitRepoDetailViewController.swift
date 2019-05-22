//
//  GitRepoDetailViewController.swift
//  MobileCodingGit
//
//  Created by Ignacio Bononi on 21/05/19.
//  Copyright © 2019 Ignacio Bononi. All rights reserved.
//

import UIKit
import Kingfisher

class GitRepoDetailViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var gitrepo: GitRepo!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        descriptionLabel.text = gitrepo.description
        imageView.kf.setImage(
            with: gitrepo.image,
            placeholder: UIImage.placeholder)
    }

    @IBAction func btnBackPressed(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
