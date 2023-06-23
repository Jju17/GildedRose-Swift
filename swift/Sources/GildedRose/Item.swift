public class Item {
    public var name: String
    public var sellIn: Int
    public var quality: Int

    public init(name: String, sellIn: Int, quality: Int) {
        self.name = name
        self.sellIn = sellIn
        self.quality = quality
    }
}

extension Item: CustomStringConvertible {
    public var description: String {
        name + ", " + String(sellIn) + ", " + String(quality)
    }
    
    public var isSpecialItem: Bool {
        return SpecialItemType(rawValue: self.name) != nil
    }
    
    public func decreaseQuality(by qualityRate: Int, forceDecrease: Bool = false) {
        guard (self.quality >= qualityRate) || forceDecrease
        else {
            self.quality = AppConstants.minItemQuality
            return
        }
        
        self.quality -= qualityRate
    }
    
    public func increaseQuality(by qualityRate: Int, forceIncrease: Bool = false) {
        guard (self.quality + qualityRate <= AppConstants.maxItemQuality) || forceIncrease
        else {
            self.quality = AppConstants.maxItemQuality
            return
        }
        
        self.quality += qualityRate
    }
}
