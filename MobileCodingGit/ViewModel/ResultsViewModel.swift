//
//  ResultsViewModel.swift
//  MobileCodingGit
//
//  Created by Ignacio Bononi on 21/05/19.
//  Copyright © 2019 Ignacio Bononi. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

protocol ResultsViewModelDelegate: class {
    func showDetail(gr: GitRepo)
}

final class ResultsViewModel {

    weak var delegate: ResultsViewModelDelegate?

    let gitrepos = BehaviorRelay<[GitRepo]>(value: [])
    
    init() {
        GitRepoService.shared.getGitRepos(){ gitrepos, error in
            self.gitrepos.accept(gitrepos)
        }
    }
    
    func delete(at row: Int){
        _ = gitrepos.delete(at: row)
    }
    
    func showGitRepo(at ip: IndexPath){
        let gr = gitrepos.value[ip.row]
        delegate?.showDetail(gr: gr)
    }
}
