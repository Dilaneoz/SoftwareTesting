//
//  SwiftTestingUITests.swift
//  SwiftTestingUITests
//
//  Created by Atil Samancioglu on 20.01.2022.
//

import XCTest

// ui testlerimizi burada yazıcaz
// bunu yapmamızdaki amaç, öyle bi arayüz yapılmıştır ki bazı telefonda çalışır bazısında çalışmaz, arayüzde bi değişiklik olur tıklanmaz olur, kodda bi değişiklik olur arayüze tıkladığımızda istediğimiz sonuçları alamaz oluruz vs
class SwiftTestingUITests: XCTestCase {
    
    // uygulamayı başlatan kod burası yani ui testleri yazdığımız her fonksiyonda bu iki satırın olması gerekiyor ki uygulamayı açabilelim. bu kodlar simulatoru çalıştıracak ve uygulamayı açacak
    func testToDoItem() throws { // ekleme işlemi yapılıyor mu test edicez
        let app = XCUIApplication()
        app.launch()
        
        // sol alttaki kırmızı nokta yapmak istediğimizi kaydeder. tıkladığımızda kayda başlar. tıkladıktan sonra simulatoru açıp butonu kullanarak yeni girdi ekliyoruz. sonra simülatoru kapatıp kaydı durduruyoruz. yaptığımız işlemleri kod olarak buraya otomotik olarak yazar. tabi %100 yazamıyor.
        let addButton = app.navigationBars["SwiftTesting.View"].buttons["Add"] // app.navigationBars["SwiftTesting.View"].buttons["Add"] butonu böyle tanımlıyor
        
        let textField =  app.alerts["Add Item"].scrollViews.otherElements.collectionViews.textFields["Enter Item"] // burda textField ı bulmuş
        
        let okBUtton = app.alerts["Add Item"].scrollViews.otherElements.buttons["OK"]
        
        let addedCell = app.tables.cells.containing(.staticText, identifier:"my to do").element
        
        
        addButton.tap() // .tap tıkla demek. addButton a ne zaman tıklansın istersek bunu yazabiliriz
        textField.tap() // textField a git tıkla
        textField.typeText("my to do") // textField a yazı yaz. my to do yu yazarsa addedCell in oluşmuş olması gerekiyor
        okBUtton.tap()
        
                XCTAssertTrue(addedCell.exists) // true olan addedCell in var olması. biz bu kodları çalıştırdıktan sonra, my to do yazan addedCell ortaya çıkıyorsa demekki bu testten geçiyoruz
    }
    
    func testDeleteItem() throws { // silme işlemi yapılıyor mu test edicez. bu fonksiyonun başı üsttekiyle aynı olmalı çünkü bi şey ekleyelim ki silebilelim
        let app = XCUIApplication()
        app.launch()
        
        
        let addButton = app.navigationBars["SwiftTesting.View"].buttons["Add"]
        
        let textField =  app.alerts["Add Item"].scrollViews.otherElements.collectionViews.textFields["Enter Item"]
        
        let okBUtton = app.alerts["Add Item"].scrollViews.otherElements.buttons["OK"]
        
        let addedCell = app.tables.cells.containing(.staticText, identifier:"my to do").element
        
        
        //tables
        
        let tablesQuery = app.tables
        let deleteButton = tablesQuery.buttons["Delete"]

        
        addButton.tap()
        textField.tap()
        textField.typeText("my to do")
        okBUtton.tap()
        
        addedCell.swipeLeft() // bunu diyerek sola kaydırma işlemini gerçekleştirebiliyoruz
        deleteButton.tap() // bunu diyerek hem sola kaydırabilir hem de silebiliriz
        
        XCTAssertFalse(addedCell.exists) // sildikten sonra addedCell var mı assert edicez. false ise testi geçer çünkü silinme gerçekleşmiştir
                                           
    
    }
 
}
