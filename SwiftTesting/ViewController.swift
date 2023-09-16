//
//  ViewController.swift
//  SwiftTesting
//
//  Created by Atil Samancioglu on 20.01.2022.
//

import UIKit
// test piramitinde en altta unit testler var ortada integration testler en üstte de ui testler var. unit test en küçük birimi test ettiğimiz yazılımsal testlerdir. mesela bi sınıfı ya da sınıfın fonksiyonlarını test ettiğimiz testler. piramitin en altında olma sebebi en küçük şeyi test ettiğimiz testler olması ve en fazla yer kaplayan olması, yazdığımız testlerin %70i unit testlerden oluşur. üste doğru çıktıkça sayı azalır. önemsel olarak değil sayısal olarak.
// integration test yine yazılımsal olarak yaptığımız testler unitten farkı birçok farklı componentten aldığı sonucu test etmeye çalışabilir. en küçük fonksiyonu değil belki ama bi viewmodel ı viewmodel ın içerisindeki sonuçların doğru bi şekilde yansıtılıp yansıtılmadığını vs test ettiğimiz bi test grubu olarak düşünebiliriz
// uitest ise user interface yani kullanıcı arayüzü testleri. buton koyduk gerçekten o butona tıklanıyor mu tıklanıyorsa istediğimiz yer açılıyor mu vb testler
// projeyi oluştururken include tests i seçeriz
class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    
    var toDoList = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }


    @IBAction func addClicked(_ sender: Any) {
        
        let alert = UIAlertController(title: "Add Item", message: "Enter Your To Do Item", preferredStyle: .alert)
        alert.addTextField { textField in // addTextField uyarı mesajının içine text field koyar böylelikle kullanıcıdan girdi alabiliyoruz
            textField.placeholder = "Enter Item"
        }
        let okButton = UIAlertAction(title: "OK", style: .default) { action in
            
            guard let textField = alert.textFields?[0], let inputText = textField.text, !inputText.isEmpty else { // uyarı mesajı içinde birden fazla text field olabileceği için textFields ı bir dizi içinde veriyor. bizde bir tane olucağı için 0. eleman dedik. textField.text ile de "textField.placeholder = "Enter Item"" burada yazılan text i alabiliyoruz. !inputText.isEmpty bu da inputText boş değil demek
                return // bunlar tutmazsa return yap
            }
            self.toDoList.insert(inputText, at: 0) // append deseydik en sona eklerdi. en son eklenen en başta çıksın istiyorsak insert demek lazım
            self.tableView.insertRows(at: [.init(row: 0, section: 0)], with: .automatic) // reloaddata demiyoruz çünkü en başa eklenmesini istiyoruz. addClicked in içinde indexpath yok o yüzden [.init(row: 0, section: 0)] bu şekilde yazarız. with: .automatic burası animasyonu istiyor
        }
        
        alert.addAction(okButton)
        
        self.present(alert, animated: true, completion: nil)
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDoList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        var content = cell.defaultContentConfiguration()
        content.text = toDoList[indexPath.row]
        cell.contentConfiguration = content
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            self.toDoList.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
}

