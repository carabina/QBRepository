//
//  Repository.swift
//  Fahrerclub
//
//  Created by Stefan Kofler on 10.03.18.
//  Copyright © 2018 Zeppelin GmbH. All rights reserved.
//

import Foundation

public enum RepositoryEditResult<Model> {
    case success(Model)
    case error(Error)
}

public protocol Repository {
    associatedtype Model

    func getAll(_ completion: (AnyCollection<Model>) -> Void)
    func getElements(fileredBy predicateFormat: String, _ args: Any..., completion: (AnyCollection<Model>) -> Void)
    func getElement<Id>(withId id: Id, completion: (Model?) -> Void)
    func create(_ model: Model, cascading: Bool, completion: (RepositoryEditResult<Model>) -> Void)
    func create(_ models: [Model], cascading: Bool, completion: (RepositoryEditResult<[Model]>) -> Void)
    func update(_ model: Model, cascading: Bool, completion: (RepositoryEditResult<Model>) -> Void)
    func delete(_ model: Model, cascading: Bool, completion: (Error?) -> Void)
    func deleteAll(cascading: Bool, _ completion: (Error?) -> Void)
}
