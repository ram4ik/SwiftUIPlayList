//
//  ExpandableRows.swift
//  SwiftUIPlayList
//
//  Created by ramil on 29.06.2020.
//

import SwiftUI

struct TutorialItem: Identifiable {
    let id = UUID()
    let title: String
    var tutorialItems: [TutorialItem]?
}

struct ExpandableRows: View {
    let tutorialItems: [TutorialItem] = [
        sampleUIKit(),
        sampleSwiftUI()
    ]
    
    var body: some View {
        NavigationView {
            List(tutorialItems, children: \.tutorialItems) { tutorial in
                Text(tutorial.title)
            }.navigationBarTitle(Text("Expandable Rows"))
        }
    }
}

struct ExpandableRows_Previews: PreviewProvider {
    static var previews: some View {
        ExpandableRows()
    }
}

func sampleUIKit() -> TutorialItem {
    return .init(title: "UIKit", tutorialItems: [
        .init(title: "UICollectionView"),
        .init(title: "UIScrollView")
    ])
}

func sampleSwiftUI() -> TutorialItem {
    return .init(title: "SwiftUI", tutorialItems: [
        .init(title: "NavigationView"),
        .init(title: "UIScrollView"),
        .init(title: "Expanding Rows")
    ])
}
