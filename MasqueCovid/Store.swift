//
//  Store.swift
//  MasqueCovid
//
//  Created by omer ozkul on 24/04/2020.
//  Copyright © 2020 omer. All rights reserved.
//

import Foundation
import SwiftSoup

struct Store {
    let name: String
    let address: String
    let productionRate: String
    let price: String
    let delivery: String
    
    init(doc: Element) {
        name = (try? doc.select("[class=name-pro]").text()) ?? ""
        address = (try? doc.select("[class=addr-pro]").text()) ?? ""
        productionRate = (try? doc.select("[class=metier-pro]").array().first?.text()) ?? ""
        price = (try? doc.select("[class=metier-pro]").array()[1].text()) ?? ""
        delivery = (try? doc.select("[class=metier-pro]").array().last?.text()) ?? ""
    }
}


//<a href="/Home/DemandeVersFabricant?clefabricant=044b3d88-a63b-4c90-a04d-8bca36ca2b0e" class="infos-pro bloc-tbl-cell">
//    <p class="name-pro"><span class="background-green">1</span>Confectionneur : Telle que je suis</p>
//    <p class="addr-pro"></p>
//    <p class="addr-pro">01240  Certines</p>
//        <p class="metier-pro">Production par semaine : 101-500</p>
//        <p class="metier-pro">Mise à disposition : A titre gratuit ou &#xE0; prix co&#xFB;tant</p>
//        <p class="metier-pro">Mode de mise à disposition : A d&#xE9;finir avec le confectionneur</p>
//</a>
