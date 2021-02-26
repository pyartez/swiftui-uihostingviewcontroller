//
//  ContentView.swift
//  SwiftUI Router
//
//  Created by Phil Yates on 12/02/2021.
//

import SwiftUI
import UIKit

final class ContentPresenter: ObservableObject {
    weak var navigationController: UINavigationController?
    
    func buttonTapped() {
        // Do whatever we like
        // ...
        // Navigate
        let vc = UIHostingController(rootView: DetailView())
        navigationController?.pushViewController(vc, animated: true)
    }
}

struct ContentView: View {
    @ObservedObject private var presenter: ContentPresenter
    
    init(presenter: ContentPresenter) {
        self.presenter = presenter
    }
    
    var body: some View {
        Button(action: { presenter.buttonTapped() }) {
            Text("Navigate")
        }
    }
}

struct DetailView: View {
    var body: some View {
        Text("Detail View")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(presenter: ContentPresenter())
    }
}
