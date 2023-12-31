//
//  ViewModel.swift
//  URLImageUI
//
//  Created by gnksbm on 2023/10/07.
//

import SwiftUI

class ViewModel: ObservableObject {
    @Published var myModels: [MyModel] = []
    private let networkManager: NetworkManager = .shared
    private let urlStrings: [String] = [
        "https://wallpaperaccess.com/download/europe-4k-1369012",
        "https://wallpaperaccess.com/download/europe-4k-1318341"
    ]

    init() {
        Task {
            await fetchData()
        }
    }

    func fetchData() async {
        await urlStrings.asyncForEach { [weak self] str in
            guard let url = URL(string: str),
                  let self
            else { return }
            let result = await self.networkManager.fetchImage(url: url)
            switch result {
            case .success(let success):
                await MainActor.run {
                    self.myModels.append(.init(imageData: success))
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func reFetch() async {
        await MainActor.run {
            myModels = []
        }
        await fetchData()
    }
}
