//
//  BulbasaurTests.swift
//  BulbasaurTests
//
//  Created by Usama Fouad on 18/02/2023.
//

import XCTest
@testable import Bulbasaur

final class BulbasaurTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testGameHas18PokeTypes() {
        assert(PokeType.allCases.count == 18)
    }
    
    func testNoRepeatedPokeType() {
        let allPokeTypes = Set(PokeType.allCases)
        
        assert(allPokeTypes.count == 18)
    }
    
    func testGameLogicRatesHas18Rows() {
        assert(GameLogic().rates.count == 18)
    }
    
    func testAllGameLogicRatesHas18Columns() {
        let rates = GameLogic().rates
        
        for rate in rates {
            assert(rate.count == 18)
        }
    }
    
    func testAllGameLogicRatesHasRateOf0_Half_1Or2() {
        let rates = GameLogic().rates
        let possibleRates = [0, 0.5, 1, 2]
        
        for rate in rates {
            for itemRate in rate {
                assert(possibleRates.contains(itemRate))
            }
        }
    }
    
    func testRateOfFireAttackIceDefender() {
        assert(GameLogic().getRate(attacker: PokeType(.fire), defender1: PokeType(.ice)) == 2.0)
    }
    
    func testRateOfFireAttackIceBugDefenders() {
        assert(GameLogic().getRate(attacker: PokeType(.fire), defender1: PokeType(.ice), defender2: PokeType(.bug)) == 4.0)
    }
}
