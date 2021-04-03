//
//  InsertableTextField.swift
//  Chatty
//
//  Created by Oleg Krikun on 03.04.2021.
//

import SwiftUI

class InsertableTextField: UITextField {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        placeholder = "Write something here...!"
        font = UIFont.systemFont(ofSize: 16)
        clearButtonMode = .whileEditing
        borderStyle = .none
        layer.cornerRadius = 15
        layer.masksToBounds = true
        
        let image = UIImage(systemName: "smiley")
        let imageView = UIImageView(image: image)
        imageView.setupColor(color: .lightGray)
        leftView = imageView
        leftView?.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
        leftViewMode = .always
        
        let buttom = UIButton(type: .system)
        buttom.setImage(UIImage(named: "Sent"), for: .normal)
        rightView = buttom
        rightView?.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
        rightViewMode = .always
    }
    
    override func leftViewRect(forBounds bounds: CGRect) -> CGRect {
        var rect = super.leftViewRect(forBounds: bounds)
        rect.origin.x += 12
        return rect
    }
    
    override func rightViewRect(forBounds bounds: CGRect) -> CGRect {
        var rect = super.rightViewRect(forBounds: bounds)
        rect.origin.x += -8
        return rect
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: 38, dy: 0)
    }
    
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: 38, dy: 0)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: 38, dy: 0)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - SwiftUI for Canvas
struct InsertableTFProvider: PreviewProvider {
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        let profileViewContoller = ProfileViewController()
        
        func makeUIViewController(context: Context) -> some UIViewController {
            return profileViewContoller
        }
        
        func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        }
    }
}
