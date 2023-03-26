//
//  Post.swift
//  TestProject
//
//  Created by Ronan Henry on 26/03/2023.
//

import Foundation

struct Post: Identifiable {
    let id = UUID()
    let profile: Profile
    let location: String
    let imageURL: URL
}
