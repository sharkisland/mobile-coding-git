//
//  GitRepoListViewController.swift
//  MobileCodingGit
//
//  Created by Ignacio Bononi on 21/05/19.
//  Copyright © 2019 Ignacio Bononi. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class GitRepoListViewController: UIViewController {


    @IBOutlet weak var tableView: UITableView!
    
    let viewModel = ResultsViewModel()
    
    private let disposeBag = DisposeBag()
    var gitrepo: GitRepo!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        viewModel.delegate = self
        setupBinding()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupBinding(){
        tableView
            .rx
            .itemSelected
            .subscribe(onNext: { [weak self] ip in
                self?.viewModel.showGitRepo(at: ip)
            }).disposed(by: disposeBag)
        
        tableView
            .rx
            .itemDeleted
            .subscribe(onNext: { [weak self] ip in
                self?.viewModel.delete(at: ip.row)
            }).disposed(by: disposeBag)
        
        viewModel
            .gitrepos
            .bind(to: tableView.rx.items(
                cellIdentifier: "GitRepoTableViewCell",
                cellType: GitRepoTableViewCell.self))
            { [unowned self] row, entry, cell in
                
                cell.configure(with: entry)
                
                
            }.disposed(by: disposeBag)
        

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destinationVC = segue.destination as? GitRepoDetailViewController
        else {return}
        destinationVC.gitrepo = gitrepo
    }


}
extension GitRepoListViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 175.0
    }
}

extension GitRepoListViewController: ResultsViewModelDelegate{
    func showDetail(gr: GitRepo) {
        gitrepo = gr
        performSegue(withIdentifier: "showDetail", sender: self)
    }
}

