import UIKit
import Flutter
import Firebase
import GoogleMaps

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GMSServices.provideAPIKey("AIzaSyCaXOxBSoefofM-yjMqTPbrJT-qaAoN4GA")
    FirebaseApp.configure()
    GeneratedPluginRegistrant.register(with: self)
    return true
  }
}
