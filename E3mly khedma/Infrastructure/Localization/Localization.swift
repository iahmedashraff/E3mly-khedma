//
//  Localization.swift
//  E3mly khedma
//
//  Created by Ahmed Ashraf on 06/01/2022.
//

import UIKit



class LocalizationManager: Bundle {
    
    private static var bundle: Bundle!
    
    static var currentLang = UserDefaults.standard.string(forKey: "app_lang")
    
    public static func localizedBundle() -> Bundle! {
        if bundle == nil {
            let appLang = UserDefaults.standard.string(forKey: "app_lang") ?? "en"
            let path = Bundle.main.path(forResource: appLang, ofType: "lproj")
            bundle = Bundle(path: path!)
        }

        return bundle;
    }

    public static func setLanguage() {
        
        
        if currentLang == "ar"{
            currentLang = "en"
            UserDefaults.standard.set(currentLang, forKey: "app_lang")
            
        }else{
            currentLang = "ar"
            UserDefaults.standard.set(currentLang, forKey: "app_lang")
        }
        UserDefaults.standard.synchronize()
        adjustLayoutDirection()
        
        
        let path = Bundle.main.path(forResource: currentLang, ofType: "lproj")
        bundle = Bundle(path: path!)
        
        
        
        let mySceneDelegate : SceneDelegate = UIApplication.shared.connectedScenes.first!.delegate as! SceneDelegate
        let window = mySceneDelegate.window
        
        let sb = UIStoryboard(name: "Main", bundle: nil)
        window?.rootViewController = sb.instantiateViewController(withIdentifier: "StartAppVC")
        
        UIView.transition(with: window!, duration: 0.5, options: .transitionFlipFromLeft, animations: nil, completion: nil)
        
    }
    
    public static func adjustLayoutDirection() {
        if currentLang == "ar" {
            UIView.appearance().semanticContentAttribute = .forceRightToLeft
//            UIButton.appearance().semanticContentAttribute = .forceRightToLeft
//
        }else{
            UIView.appearance().semanticContentAttribute = .forceLeftToRight
//            UIButton.appearance().semanticContentAttribute = .forceLeftToRight
            
        }
    }
    
}


extension String {
    
    var localize: String {
        return NSLocalizedString(self, tableName: nil, bundle: LocalizationManager.localizedBundle(), value: "", comment: "")
    }

}

