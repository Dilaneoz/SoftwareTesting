//
//  SwiftTestingTests.swift
//  SwiftTestingTests
//
//  Created by Atil Samancioglu on 20.01.2022.
//

import XCTest
@testable import SwiftTesting

// normal yani unit testlerimizi burada yazıcaz. aslında integration testle unit test arasında teknik bi fark yok terimsel farklar var. ui test yani kullanıcı arayüzü testi apayrı kodlarla yaptığımız testler yani bu kısım apayrı.

class SwiftTestingTests: XCTestCase { // XCTestCase testleri oluşturmak/çalıştırmak için ve sonuçlarını görmek için oluşturulmuş bir sınıf.
    
    let math = MathematicFunctions()


    func testAddFunction() {
        
        let result = math.addIntegers(x: 5, y: 8)
        
        XCTAssertEqual(result, 13) // Assert ya bu olsun ya da her şeyi çökert anlamına gelir. yani doğruysa test geçicek yanlışsa geçmeyecek. XCTAssert yazınca bunları test etmek için oluşturulmuş fonksiyonlar çıkar. XCTAssertEqual ile result ve 13 eşit mi bak deriz. func ın solundaki play e bastığımızda bu test çalıştırılcak ve sonuç gösterilecek. eşitse test geçilcek. burada kolay bi örnek yaptık. MathematicFunctions sınıfındaki addIntegers fonksiyonundaki artı eksi yapılsaydı hata vericekti
    }
    
    func testMultiplyFunction() {
        
        let result = math.multiplyNumbers(x: 5, y: 8)
        
        XCTAssertEqual(result, 40)
    }
    
    func testDivideFunction() {
        
        let result = math.divideIntegers(x: 10, y: 2)
        
        XCTAssertEqual(result, 5)
    }

}
