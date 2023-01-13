//
//  Tab.swift
//  Daily
//
//  Created by Michael Gillund on 1/9/23.
//

import Foundation
import SwiftUI

struct Tab: Identifiable,Hashable{
    var id: String = UUID().uuidString
    var name: String
    var isHome: Bool
}

var pages: [Tab] = [
    .init(name: "Today", isHome: true),
    .init(name: "News", isHome: false),
]

// MARK: Custom Modifier
extension View{
    @ViewBuilder
    func offsetX(completion: @escaping (CGFloat)->())->some View{
        self
            .overlay {
                GeometryReader{proxy in
                    let minX = proxy.frame(in: .global).minX
                    Color.clear
                        .preference(key: OffsetKey.self, value: minX)
                        .onPreferenceChange(OffsetKey.self) { value in
                            completion(value)
                        }
                }
            }
    }
}

// MARK: Offset Preference Key
struct OffsetKey: PreferenceKey{
    static var defaultValue: CGFloat = 0
    
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}
// MARK: Universal Interaction Manager
class InteractionManager: NSObject,ObservableObject,UIGestureRecognizerDelegate{
    @Published var isInteracting: Bool = false
    @Published var isGestureAdded: Bool = false
    
    func addGesture(){
        if !isGestureAdded{
            let gesture = UIPanGestureRecognizer(target: self, action: #selector(onChange(gesture: )))
            gesture.name = "UNIVERSAL"
            gesture.delegate = self
            guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene else{return}
            guard let window = windowScene.windows.last?.rootViewController else{return}
            window.view.addGestureRecognizer(gesture)
            isGestureAdded = true
        }
    }
    
    // MARK: Removing Gesture
    func removeGesture(){
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene else{return}
        guard let window = windowScene.windows.last?.rootViewController else{return}
        
        window.view.gestureRecognizers?.removeAll(where: { gesture in
            return gesture.name == "UNIVERSAL"
        })
        isGestureAdded = false
    }
    
    @objc
    func onChange(gesture: UIPanGestureRecognizer){
        isInteracting = (gesture.state == .changed)
    }
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
}
