//
//  MathematicFunctions.swift
//  SwiftTesting
//
//  Created by Atil Samancioglu on 20.01.2022.
//

import Foundation

class MathematicFunctions { // matematik fonksiyonlarını istediğimiz gibi davranıyo mu test edicez. profesyonel hayatta müşteriye ben test ettim her şey çalışıyor diyemeyiz bu testi objektif bi şekilde burada yapmamız gerekir. daha da önemlisi adamın biri yarın öbür gün gelip bizim fonksiyonumuzu değiştirirse burada, bu testlerden geçemediğini görmesi lazım. fonksiyon istenilen sonucu veriyorsa sorun olmaz ama yanlış yazıldıysa diye test olması lazım ki eskiden doğru çalışan şey bozuluyorsa onu görelim. profesyonel hayatta testler çok önemli
    
    func addIntegers(x: Int, y: Int) -> Int { // burada diycez ki mesela addIntegers a 3 ve 5 verdim 8 cevabı çıktı mı
        return x + y
    }
    
    func multiplyNumbers(x: Int, y: Int) -> Int {
        return x * y
    }
    
    func divideIntegers(x: Int, y: Int) -> Int {
        return x / y
    }
    
}
