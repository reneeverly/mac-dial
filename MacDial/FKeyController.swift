

import Foundation
import AppKit
import Carbon

func HIDPostFKey(key: CGKeyCode) {
    let src = CGEventSource(stateID: CGEventSourceStateID.hidSystemState)
    
    let ad = CGEvent(keyboardEventSource: src, virtualKey: key, keyDown: true)
    let au = CGEvent(keyboardEventSource: src, virtualKey: key, keyDown: false)
    
    let loc = CGEventTapLocation.cghidEventTap
    
    ad?.post(tap: loc)
    au?.post(tap: loc)
}


class FKeyController : Controller {
    
    var lastClick = Date().timeIntervalSince1970
    
    public var index = 0
    
    static var keylist:[Int] = [kVK_F13, kVK_F16, kVK_F17, kVK_F18, kVK_F19, kVK_F20]
    
    func onDown() {
        
    }
    
    func onUp() {
        HIDPostFKey(key: CGKeyCode(FKeyController.keylist[index]))
    }
    
    
    
    func onRotate(_ rotation: Dial.Rotation,_ scrollDirection: Int) {
        
        let modifiers = [NSEvent.ModifierFlags.shift, NSEvent.ModifierFlags.option]
        
        switch (rotation) {
        case .Clockwise(let _repeat):
            index += 1
            if (index >= FKeyController.keylist.count) {
                index = 0
            }
            break
        case .CounterClockwise(let _repeat):
            index -= 1
            
            if (index < 0) {
                index = FKeyController.keylist.count - 1;
            }
            break
        }
        statusBarController?.updateIcon(indexer: index)
    }
    
    
}
