//
//  AlertExemplesController.swift
//  CSUtils_Example
//
//  Created by Chrystian on 14/04/2018.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import Foundation
import UIKit
import CSUtils

class AlertExemplesController: UIViewController {
    
    var alertTitle: String!
    var alertMensage: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        alertTitle = CSUtils.getLocalizableString("TITULO_ALERTA_TESTE")
        alertMensage = CSUtils.getLocalizableString("MENSAGEM_ALERTA_TESTE")
    }

    @IBAction func simpleAlertView(_ sender: Any) {
        let alert = CSUtils.showAlertController(alertTitle, mensage: alertMensage, alertButtons: [.DISMISS], completion: { return })
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func simpleAlertWithAction(_ sender: Any) {
        let alert = CSUtils.showAlertController(alertTitle, mensage: alertMensage, alertButtons: [.CANCEL, .OK], UIColor.red) {
            let alertBefore = CSUtils.showAlertController(self.alertTitle, mensage: self.alertMensage, alertButtons: [.DISMISS], completion: { return })
            self.present(alertBefore, animated: true, completion: nil)
        }
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func alertViewWithFields(_ sender: Any) {
        let alertViewController = CSUtils.showAlertControllerForLogin(alertTitle, mensage: alertMensage, alertButtons: [.CANCEL, .OK]) { (texts) in
            
            var message: String?
            for actualText in texts {
                if message != nil {
                    message = message! + "\n\(actualText)"
                }
                else {
                    message = actualText
                }
            }
            
            let alertBefore = CSUtils.showAlertController(nil, mensage: message!, alertButtons: [.DISMISS], completion: { return })
            self.present(alertBefore, animated: true, completion: nil)
        }
        
        present(alertViewController, animated: true, completion: nil)
    }
}
