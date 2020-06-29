//
//  CreateHyperLinks.swift
//  SwiftUIPlayList
//
//  Created by ramil on 29.06.2020.
//

import SwiftUI

struct CreateHyperLinks: View {
    var body: some View {
        Link("HyperLink", destination: URL(string: "https://www.apple.com")!)
    }
}

struct CreateHyperLinks_Previews: PreviewProvider {
    static var previews: some View {
        CreateHyperLinks()
    }
}
