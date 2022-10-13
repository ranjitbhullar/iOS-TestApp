//
//  Dependency.swift
//  TestApp
//
//  Created by Ranjit Singh
//

import Swinject

public class Dependency {
    public static var container: Container?
    public init(container: Container) {
        Dependency.container = container
    }
}
