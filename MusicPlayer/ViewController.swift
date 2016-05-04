//
//  ViewController.swift
//  MusicPlayer
//
//  Created by mac on 4/28/16.
//  Copyright © 2016 Juan Sebastian Castro. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    var canciones: Array<Array<String>> = Array<Array<String>>() // arreglo de arreglos // arreglo de arreglos para almacenar canciones
    //var canciones1 = ["prueba"]
    var imagenes:[String] = ["Elvis.jpg","Frank.jpg", "Luciano.jpg", "Michael.jpg", "Queen.jpg", "Zaz.jpg"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // canciones que van en el picker
        canciones.append(["Elvis - Hound Dog"])
        canciones.append(["Frank - Theme from New York, New York"])
        canciones.append(["Luciano - La donna e mobile"])
        canciones.append(["Michael - Thriller"])
        canciones.append(["Queen - We Will Rock You"])
        canciones.append(["Zaz - Paris Sera Toujours Paris"])
        
        mostrarCaratula.image = UIImage(named: "Elvis.jpg")
   
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int { // indica que el número de componentes de la seleccion
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int { // indica que el número de renglones para el primer y único componente es igual al número de elementos que tengamos en el arreglo de canciones
        return self.canciones.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return self.canciones[row][0]
    }


    @IBOutlet weak var mostrarTitulo: UILabel!
    
    @IBOutlet weak var mostrarCaratula: UIImageView!
    
    var musica = 0
    private var reproductor : AVAudioPlayer!

    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        musica = row
        tocarCancion()
        
    }
    func tocarCancion () {
        if musica == 0{
            print("Elvis - Hound Dog")
            mostrarCaratula.image = UIImage(named: "Elvis.jpg") // mostrar caratula
            mostrarTitulo.text = "Elvis - Hound Dog" // mostrar titulo
            let sonidoURL = NSBundle.mainBundle().URLForResource("Elvis - Hound Dog", withExtension: "mp3") // convierte el path
            do{
                try reproductor = AVAudioPlayer(contentsOfURL: sonidoURL!)
                if !reproductor.playing{// reproduce cancion
                    reproductor.play()
                }
            }catch{
                print("Error al cargar el archivo de sonido")
            }
            
        }else if musica == 1{
            print("Ha seleccionado -> Frank - Theme from New York, New York")
            mostrarCaratula.image = UIImage(named: "Frank.jpg")
            mostrarTitulo.text = "Frank - Theme from New York, New York"
            let sonidoURL = NSBundle.mainBundle().URLForResource("Frank - Theme from New York, New York", withExtension: "mp3") // convierte el path
            do{
                try reproductor = AVAudioPlayer(contentsOfURL: sonidoURL!)
                if !reproductor.playing{// reproduce cancion
                    reproductor.play()
                }
            }catch{
                print("Error al cargar el archivo de sonido")
            }
            
            
        }else if musica == 2 {
            print("Ha seleccionado -> Luciano - La donna è mobile")
            mostrarCaratula.image = UIImage(named: "Luciano.jpg")
            mostrarTitulo.text = "Luciano - La donna è mobile"
            let sonidoURL = NSBundle.mainBundle().URLForResource("Luciano - La donna e mobile", withExtension: "mp3") // convierte el path
            do{
                try reproductor = AVAudioPlayer(contentsOfURL: sonidoURL!)
                if !reproductor.playing{// reproduce cancion
                    reproductor.play()
                }
            }catch{
                print("Error al cargar el archivo de sonido")
            }
            
            
        }else if musica == 3{
            print("Ha seleccionado -> Michael - Thriller")
            mostrarCaratula.image = UIImage(named: "Michael.jpg")
            mostrarTitulo.text = "Michael - Thriller"
            let sonidoURL = NSBundle.mainBundle().URLForResource("Michael - Thriller", withExtension: "mp3") // convierte el path
            do{
                try reproductor = AVAudioPlayer(contentsOfURL: sonidoURL!)
                if !reproductor.playing{// reproduce cancion
                    reproductor.play()
                }
            }catch{
                print("Error al cargar el archivo de sonido")
            }
            
            
        }else if musica == 4{
            print("Ha seleccionado -> Queen - We Will Rock You")
            mostrarCaratula.image = UIImage(named: "Queen.jpg")
            mostrarTitulo.text = "Queen - We Will Rock You"
            let sonidoURL = NSBundle.mainBundle().URLForResource("Queen - We Will Rock You", withExtension: "mp3") // convierte el path
            do{
                try reproductor = AVAudioPlayer(contentsOfURL: sonidoURL!)
                if !reproductor.playing{// reproduce cancion
                    reproductor.play()
                }
            }catch{
                print("Error al cargar el archivo de sonido")
            }
            
            
        }else if musica == 5 {
            print("Ha seleccionado -> Zaz - Paris Sera Toujours Paris")
            mostrarCaratula.image = UIImage(named: "Zaz.jpg")
            mostrarTitulo.text = "Zaz - Paris Sera Toujours Paris"
            let sonidoURL = NSBundle.mainBundle().URLForResource("Zaz - Paris Sera Toujours Paris", withExtension: "mp3") // convierte el path
            do{
                try reproductor = AVAudioPlayer(contentsOfURL: sonidoURL!)
                if !reproductor.playing{// reproduce cancion
                    reproductor.play()
                }
            }catch{
                print("Error al cargar el archivo de sonido")
            }
            
        }
    
    }// else if


    
    @IBAction func controlPlayer(sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0{
            reproductor.pause()
        }
        
        if sender.selectedSegmentIndex == 1{
            reproductor.play()
        }
        
        if sender.selectedSegmentIndex == 2{
            reproductor.stop()
            reproductor.currentTime = 0.0
        }
        
    }
    
    @IBOutlet weak var controlVolumen: UISlider!

    @IBAction func volumen(sender: AnyObject) { // controlar el volumen
        reproductor.volume = controlVolumen.value
    }
  
    @IBAction func shuffleButton() {
        musica  = Int(arc4random())%6
        print("\(musica)")
        tocarCancion()
        /*musica = aleatorio
        canciones1[aleatorio]*/
        
        
    }

    
}

