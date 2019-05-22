//
//  GitService.swift
//  MobileCodingGit
//
//  Created by Ignacio Bononi on 21/05/19.
//  Copyright © 2019 Ignacio Bononi. All rights reserved.
//

import Foundation

final class GitRepoService {
    
    static let shared = GitRepoService()
    private init(){ }
    
    private let urlString = "https://api.github.com/search/repositories?q=created:%3E2017-10-22&sort=stars&order=desc"
    private let decoder = JSONDecoder()
    
    typealias GitRepoHandler = ([GitRepo], ServiceError?)->Void
    
    func getGitRepos(completion: @escaping GitRepoHandler){
        
        guard let url = URL(string: urlString) else {
            completion([], .badRequest)
            return
        }
        
        URLSession.shared.dataTask(with: url){ data, response, error in
            
            var _gitrepos: [GitRepo] = []
            var _error: ServiceError?
            defer { completion(_gitrepos, _error) }
            
            if error != nil {
                _error = .serverError
                return
            }
           
            guard let serverData = data else {
                _error = .noData
                return
            }
            
            do {
              
                
                let result = try self.decoder.decode(GitResponse.self, from: serverData)
                _gitrepos = result.items.compactMap{ GitRepo(from: $0) }
            }catch{
                _error = .serverError
                print(error.localizedDescription)
            }
        }.resume()
    }
}
