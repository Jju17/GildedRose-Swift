public class GildedRose {
    
    // MARK: - Properties
    
    var items: [Item]

    // MARK: - Initializer
    
    public init(items: [Item]) {
        self.items = items
    }
    
    // MARK: - Interface
    
    public func updateQuality() {
        self.items.forEach { item in
            if item.isSpecialItem {
                self.updateSpecialItemQuality(for: item)
            } else {
                self.updateStandardItemQuality(for: item)
            }
        }
    }
    
    // MARK: - Inner work
    
    private func updateStandardItemQuality(for item: Item) {
        if item.isExpired {
            item.decreaseQuality(by: 2)
        } else {
            item.decreaseQuality(by: 1)
        }
        
        item.updateSellIn()
    }
    
    private func updateSpecialItemQuality(for item: Item) {
        guard let specialItem = SpecialItemType(rawValue: item.name)
        else { return }
        
        specialItem.updateQuality(for: item)
        specialItem.updateSellIn(for: item)
    }
    
    
    
}
