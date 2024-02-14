//
//  ViewController.swift
//  NavigationApp
//
//  Created by Andrei Shpartou on 13/02/2024.
//

import UIKit

class ViewController: UIViewController {

    // link to storyboard
    let storyboardInstance = UIStoryboard(name: "Main", bundle: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.navigationItem.prompt = "Clue"
        self.navigationItem.title = "Tittle of the Scene"
        self.navigationItem.backButtonTitle = "Back"
    }

    @IBAction func toGreenScene(_ sender: UIButton) {
        let nextViewController = storyboardInstance.instantiateViewController(withIdentifier: "greenViewController")
        self.navigationController?.pushViewController(nextViewController, animated: true)
    }
    
    @IBAction func toYellowScene(_ sender: UIButton) {
        let nextViewController = storyboardInstance.instantiateViewController(withIdentifier: "yellowViewController")
        self.navigationController?.pushViewController(nextViewController, animated: true)
        
    }
    
    @IBAction func toRootScene(_ sender: UIButton) {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    @IBAction func toPreviousScene(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }

    func NavigationOptions() {
        // 1.Возврат к определенной сцене
        // перебираем все элементы стека
        self.navigationController?.viewControllers.forEach { viewController in
            // определяем требуемый контроллер
            // ViewController - проверяем на тип, здесь может быть указан любой VC любой сцены
            if viewController is ViewController {
                // производим возврат к нему
                self.navigationController?.popToViewController(viewController, animated: true)
            }
        }
        
        // 2. Работа с корневой сценой // изменяем корневую сцену
        let someViewController = ViewController()
        self.navigationController?.viewControllers[0] = someViewController

    }
    

}

