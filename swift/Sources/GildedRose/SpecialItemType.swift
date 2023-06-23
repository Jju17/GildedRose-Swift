//
//  SpecialItemType.swift
//  
//
//  Created by Julien Rahier on 23/06/2023.
//

import Foundation

public enum SpecialItemType: String, CaseIterable {
    case agedBrie = "Aged Brie"
    case backstagePasses = "Backstage passes to a TAFKAL80ETC concert"
    case conjured = "Conjured Mana Cake"
    case sulfuras = "Sulfuras, Hand of Ragnaros"
    
    // MARK: - Interface
    
    func updateQuality(for item: Item) {
        switch self {
        case .agedBrie:
            if item.isExpired {
                item.increaseQuality(by: 2)
            } else {
                item.increaseQuality(by: 1)
            }
        case .backstagePasses:
            self.updateBackStagePassesQuality(item)
        case .conjured:
            if item.isExpired {
                item.decreaseQuality(by: 4)
            } else {
                item.decreaseQuality(by: 2)
            }
        case .sulfuras:
            return // Quality does not change for legendary item
        }
    }
    
    func updateSellIn(for item: Item) {
        switch self {
        case .agedBrie:
            item.updateSellIn()
        case .backstagePasses:
            item.updateSellIn()
        case .conjured:
            item.updateSellIn()
        case .sulfuras:
            return // SellIn does not change for legendary item
        }
    }
    
    // MARK: - Inner work
    
    private func updateBackStagePassesQuality(_ item: Item) {
        switch item.sellIn {
        case ...0:
            item.quality = AppConstants.minItemQuality
        case 1...5:
            item.increaseQuality(by: 3)
        case 6...10:
            item.increaseQuality(by: 2)
        default:
            item.increaseQuality(by: 1)
        }
    }
}
