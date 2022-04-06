
import Cocoa
import SwiftUI

var statusBarController: StatusBarController?

@main
class AppDelegate: NSObject, NSApplicationDelegate {

    //statusBarController: StatusBarController?
    let dial = Dial()

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        dial.start();
        statusBarController = StatusBarController.init(dial)
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        dial.stop();
    }
}

