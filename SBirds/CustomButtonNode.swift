//
//  CustomButtonNode.swift
//  SBirds
//
//  Created by justin zhang on 2022/11/13.
//

import SpriteKit

enum ButtonNodeState {
    case Active, Selected, Hidden
}

class CustomButtonNode: SKSpriteNode {
    
    var isButtonEnabled: Bool = true
    
    var selectedHandler: () -> Void = {print("No Button action is set")}
    
    var state: ButtonNodeState = .Active {
        didSet {
            switch state {
            case .Active:
                // when the button is active we want to enable user interaction and set the alpha to fully visible
                self.isUserInteractionEnabled =  true
                self.alpha = 1
                break
            case . Selected:
                // when the button is selected we want to make the button slightly transparent
                self.alpha = 0.7
                break
            case .Hidden:
                // when the button is hidden we want disable button interaction and hide and make the alpha fully invisible
                self.isUserInteractionEnabled =  false
                self.alpha = 0
                break
            }
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.isUserInteractionEnabled =  true
    }
    
    // MARK: - Touch handling
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if isButtonEnabled{
            // change state
            state = .Selected
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if isButtonEnabled {
            // run code assigned by other section
            selectedHandler()
            // change state back to active
            state = .Active
        }
    }
    
}
