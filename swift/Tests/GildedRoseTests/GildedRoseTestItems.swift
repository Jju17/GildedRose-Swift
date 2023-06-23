//
//  GildedRoseTestItems.swift
//  
//
//  Created by Julien Rahier on 23/06/2023.
//

import GildedRose

// MARK: - Aged Brie Items

// Quality increase with time
let agedBrieItem = Item(name: "Aged Brie",
                        sellIn: 20,
                        quality: 25)

// Quality should not exceed max item quality
let agedBrieItemWithMaxQuality = Item(name: "Aged Brie",
                                      sellIn: 20,
                                      quality: 50)

// Quality should increase twice as fast when sellIn < 0
let agedBrieItemWithLimitSellIn = Item(name: "Aged Brie",
                                       sellIn: 0,
                                       quality: 25)

// MARK: - Backstage Items

// Quality increase with time
let backstagePassesItem = Item(name: "Backstage passes to a TAFKAL80ETC concert",
                               sellIn: 20,
                               quality: 25)

// Quality increase by 2 when sellIn <= 10
let backstagePassesItemWithSellInAtTen = Item(name: "Backstage passes to a TAFKAL80ETC concert",
                                              sellIn: 10,
                                              quality: 25)

// Quality increase by 3 when sellIn <= 5
let backstagePassesItemWithSellInAtFive = Item(name: "Backstage passes to a TAFKAL80ETC concert",
                                               sellIn: 5,
                                               quality: 25)


// Quality drops to 0 when sellIn == 0
let backstagePassesItemWithSellInAtOne = Item(name: "Backstage passes to a TAFKAL80ETC concert",
                                              sellIn: 0,
                                              quality: 25)

// MARK: - Conjured Items

// Quality degrade twice as fast as standard items
let conjuredItem = Item(name: "Conjured Mana Cake",
                        sellIn: 20,
                        quality: 25)

// Quality degrade twice as fast as standard items with sellIn < 0
let conjuredItemWithNegativeSellIn = Item(name: "Conjured Mana Cake",
                                          sellIn: -1,
                                          quality: 25)


// MARK: - Standard Items

let standardItem = Item(name: "Standard Item",
                        sellIn: 20,
                        quality: 25)

// Quality degradetwice as fast when sellIn < 0
let standardItemWithSellInToZero = Item(name: "Standard Item",
                                        sellIn: 0,
                                        quality: 25)

// MARK: - Sulfuras Item

// Quality & SellIn should never mutate
let sulfurasItem = Item(name: "Sulfuras, Hand of Ragnaros",
                        sellIn: 1,
                        quality: 80)

