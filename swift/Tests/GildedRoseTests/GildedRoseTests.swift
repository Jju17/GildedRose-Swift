@testable import GildedRose
import XCTest

class GildedRoseTests: XCTestCase {
    
    // MARK: - Global Unit Tests
    
    func testOfAllTypesPossibleAfterOneDay() throws {
        try? self.testItem(agedBrieItem, qualityShouldBe: agedBrieItem.quality+1)
        
        try? self.testItem(backstagePassesItem, qualityShouldBe: backstagePassesItem.quality+1)
        
        try? self.testItem(conjuredItem, qualityShouldBe: conjuredItem.quality-2)
        
        try? self.testItem(standardItem, qualityShouldBe: standardItem.quality-1)
        
        try? self.testItem(sulfurasItem, qualityShouldBe: 80)
    }
    
    // MARK: - Specific Unit Tests
    
    // AgedBrie Item
    
    func testAgedBrieItemShouldNotSurpassMaxQuality() {
        try? self.testItem(agedBrieItemWithMaxQuality, qualityShouldBe: AppConstants.maxItemQuality)
    }
    
    func testAgedBrieItemShouldIncreaseQualityTwiceAsFast( ) {
        try? self.testItem(agedBrieItemWithLimitSellIn, qualityShouldBe: agedBrieItemWithLimitSellIn.quality+2)
    }
    
    // Backstage Passes Item
    
    func testBackstagePassesItem() {
        try? self.testItem(agedBrieItemWithMaxQuality, qualityShouldBe: AppConstants.maxItemQuality)
    }
    
    func testBackstagePassesShouldIncreaseQualityTwiceAsFast() {
        try? self.testItem(backstagePassesItemWithSellInAtTen, qualityShouldBe: backstagePassesItemWithSellInAtTen.quality+2)
    }
    
    func testBackstagePassesShouldIncreaseQualityThreeTimesFaster() {
        try? self.testItem(backstagePassesItemWithSellInAtFive, qualityShouldBe: backstagePassesItemWithSellInAtFive.quality+3)
    }
    
    func testBackstagePassesShouldBeZeroAfterConcert() {
        try? self.testItem(backstagePassesItemWithSellInAtOne, qualityShouldBe: AppConstants.minItemQuality)
    }
    
    // Conjured Item
    
    func testConjuredItemShouldDegradeTwiceAsFast() {
        try? self.testItem(conjuredItem, qualityShouldBe: conjuredItem.quality-2)
    }
    
    func testConjuredItemShouldDegradeTwiceAsFastWithNegativeSellIn() {
        try? self.testItem(conjuredItemWithNegativeSellIn, qualityShouldBe: conjuredItemWithNegativeSellIn.quality-4)
    }
    
    // Standard Item
    
    func testStandardItemMinQuality() {
        try? self.testItem(standardItem, afterDays: 50, qualityShouldBe: AppConstants.minItemQuality)
    }
    
    func testStandardItemWithNegativeSellIn() {
        try? self.testItem(standardItemWithSellInToZero, qualityShouldBe: standardItemWithSellInToZero.quality-2)
    }
    
    // Sulfuras Item
    
    func testSulfurasItemShouldNotMutateQualityOrValue() {
        let items = [sulfurasItem]
        let app = GildedRose(items: items)
        
        let originalQuality = items[0].quality
        let originalSellIn = items[0].sellIn
        
        app.updateQuality()
        
        XCTAssertEqual(items[0].quality, originalQuality)
        XCTAssertEqual(items[0].sellIn, originalSellIn)
        
    }
    
    
    
    // MARK: - Reusable test method
    
    private func testItem(_ item: Item, afterDays days: Int = 1, qualityShouldBe finalQuality: Int) throws {
        let items = [item]
        let app = GildedRose(items: items)
        
        for _ in 0..<days {
            app.updateQuality()
        }
        
        XCTAssertEqual(items[0].quality, finalQuality)
    }
}
