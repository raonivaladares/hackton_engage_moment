//
//  Product.swift
//  ios_engage_moment
//
//  Created by Raoni de Oliveira Valadares on 23/03/19.
//  Copyright © 2019 Raoni de Oliveira Valadares. All rights reserved.
//

import Foundation

struct Product {
    let id: String
    let name: String
    let brandID: String
    let ShortDescription: String
}

//{
//    “id”: “p_123",
//    “brand_id”: “b_abc”,
//    “short_description”: "aaaa",
//    “description”: "bbb",
//    “wholesale_price_cents”: 500,
//    “retail_price_cents”: 1000,
//    “active”: true,
//    “name”: “Faire’s fantastic candle”,
//    “unit_multiplier”: 8,
//    “options”: [
//    {
//    “id”: “po_123”,
//    “product_id”: “p_123”,
//    “active”: true,
//    “name”: “Vanilla Scent”,
//    “sku”: “vanilla-2019",
//    “available_quantity”: 42,
//    “backordered_until”: “20190208T000915.000Z”,
//    “created_at”: “20190314T000915.000Z”,
//    “updated_at”: “20190315T000915.000Z”
//    }
//    ],
//    “created_at”: “20190314T000915.000Z”,
//    “updated_at”: “20190315T000915.000Z”
//}
