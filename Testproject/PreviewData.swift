//
//  PreviewData.swift
//  TestProject
//
//  Created by Ronan Henry on 26/03/2023.
//

import Foundation

extension Profile {
    static let preview1 = Profile(
        pictureURL: URL(string: "https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&w=400"),
        name: "Quentin (preview 2)",
        title: "Autre Développeur",
        url: URL(string: "https://google.com")
    )
    
    static let preview2 = Profile(
        name: "Quentin (preview)",
        title: "Développeur",
        description: "Ceci  est une longue description sur plusieurs lignes Ceci est une longue description sur plusieurs lignes Ceci est une longue description sur plusieurs lignes"
    )
}
