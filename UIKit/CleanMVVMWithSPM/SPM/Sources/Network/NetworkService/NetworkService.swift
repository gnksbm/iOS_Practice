//
//  NetworkService.swift
//  AppStore
//
//  Created by gnksbm on 2023/11/15.
//  Copyright © 2023 https://github.com/gnksbm/Clone_AppStore. All rights reserved.
//

import Foundation

import RxSwift

public protocol NetworkService {
    func fetch(endPoint: EndPoint) async throws -> Data
    func fetch(endPoint: EndPoint) -> Observable<Data>
}
