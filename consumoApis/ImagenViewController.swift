//
//  ImagenViewController.swift
//  consumoApis
//
//  Created by Mac18 on 25/10/21.
//

import UIKit

class ImagenViewController: UIViewController {

    @IBOutlet weak var ImagenUrlImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        if let url = URL(string: "https://www.adslzone.net/app/uploads-adslzone.net/2019/04/borrar-fondo-imagen.jpg"){
            DispatchQueue.global().async { [weak self] in
                if let data = try? Data(contentsOf: url) {
                    if let image = UIImage(data: data) {
                        DispatchQueue.main.async {
                          self?.ImagenUrlImage.image = image
                        }
                    }
                }
        }
             
              }
          
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
