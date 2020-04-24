//
//  FirstViewController.swift
//  MasqueCovid
//
//  Created by omer ozkul on 24/04/2020.
//  Copyright © 2020 omer. All rights reserved.
//

import UIKit
import Alamofire
import SwiftSoup

class FirstViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        scrape()
    }

    var stores: [Store] = []

    // Grabs the HTML from https://masques-barrieres.afnor.org/Home/FabricantsParDepartement for parsing.
    func scrape() -> Void {
        let urlStr = "https://masques-barrieres.afnor.org/Home/FabricantsParDepartement?departementCode=01"
        AF.request(urlStr).responseString { (response) in
            switch response.result {
            case .success(let html):
                self.parseHTML(html: html)
            case .failure(_): return
            }
        }
    }

    func parseHTML(html: String) -> Void {
        do {
           let doc: Document = try SwiftSoup.parse(html)
            guard let items = try? doc.body()?.select("[class=col-sm-8]").array() else { return }
            for item in items {
                self.stores.append(Store(doc: item))
            }
        } catch Exception.Error(let type, let message) {
            print(message)
        } catch {
            print("error")
        }
    }

}

