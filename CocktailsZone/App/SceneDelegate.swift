import UIKit
import FirebaseAuth

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.windowScene = windowScene
        
        if UserDefaults.standard.bool(forKey: "Finished") {
            let sb = UIStoryboard(name: "Login", bundle: nil)
            let vc = sb.instantiateViewController(withIdentifier: "Login")
            let navigation = UINavigationController(rootViewController: vc)
            window?.rootViewController = navigation
        } else {
            let sb = UIStoryboard(name: "Onboarding", bundle: nil)
            let vc = sb.instantiateViewController(withIdentifier: "Onboarding")
            let navigation = UINavigationController(rootViewController: vc)
            window?.rootViewController = navigation
        }
        
        window?.makeKeyAndVisible()
        if Auth.auth().currentUser != nil {
            let sb = UIStoryboard(name: "TabBarController", bundle: nil)
            let vc = sb.instantiateViewController(withIdentifier: "TabBarController")
            let navigation = UINavigationController(rootViewController: vc)
            window?.rootViewController = navigation
            window?.makeKeyAndVisible()
        }
    }
    
    func sceneDidEnterBackground(_ scene: UIScene) {
        (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
    }
}
