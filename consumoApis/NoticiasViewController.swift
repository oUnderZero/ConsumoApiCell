//
//  NoticiasViewController.swift
//  consumoApis
//
//  Created by Mac14 on 26/05/21.
//

import UIKit
import SafariServices

struct Noticia: Codable{
    var title: String
    var description: String?
    var urlToImage: String?
    var url: String?
}

struct Noticias: Codable {
    var articles: [Noticia]
}

class NoticiasViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    var noticias = [Noticia]()
  
    
    
    @IBOutlet weak var tablaN: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tablaN.register(UINib(nibName: "NoticiasCell", bundle: nil), forCellReuseIdentifier: "cell")
        let urlString = "https://newsapi.org/v2/top-headlines?country=mx&apiKey=3247be9794b8415a95e6d5d5c8967333"
        // Do any additional setup after loading the view.
        if let url = URL(string: urlString){
            if let datos = try? Data(contentsOf: url){
                parsear(json: datos)
            }
        }

        // Do any additional setup after loading the view.
    }
    
func parsear(json: Data){
    let decoder = JSONDecoder()
    
    if let jsonPeticiones = try? decoder.decode(Noticias.self, from: json){
        noticias = jsonPeticiones.articles
        tablaN.reloadData()
    }
}

func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return noticias.count
}
    
    //metodo par ajustar el tamaño
    
    

func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let celda = tablaN.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! NoticiasCell
    celda.tituloLabel.text = noticias[indexPath.row].title
    
    celda.descripcionLabel.text = noticias[indexPath.row].description
    if let url = URL(string: noticias[indexPath.row].urlToImage ?? "https://www.google.com/search?q=error&sxsrf=AOaemvKlNLZ4EodKVlQh4HguT1hYatc-lg:1635218235211&source=lnms&tbm=isch&sa=X&ved=2ahUKEwiDmqjQjufzAhWkmGoFHWB0BcoQ_AUoAXoECAEQAw&biw=958&bih=941&dpr=1#imgrc=lW26eWKCX_sTbM"){
        DispatchQueue.global().async {
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        celda.imagenNoticiaImage.image = image
                    }
                }
            }
        }
         
          }

    
    return celda
    
}
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let url = URL(string: noticias[indexPath.row].url ?? "error 404"){
            let safariVC = SFSafariViewController(url: url)
            present(safariVC, animated: true, completion: nil)
            
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250
    }
}
