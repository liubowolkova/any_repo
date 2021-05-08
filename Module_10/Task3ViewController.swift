//
//  Task3ViewController.swift
//  Module_10
//
//  Created by Любовь Волкова on 02.05.2021.
//

import MapKit
import UIKit

enum LabelTypes {
    case title, subtitle, p, span, nums
}

enum ButtonTypes {
    case fill, bordered
}

enum ButtonSize {
    case m, l
}

enum ButtonAlign {
    case fill, center
}

class Task3ViewController: UIViewController {
    @IBOutlet weak var scrollView: UIScrollView!
    private lazy var mainImage = UIImage(named: "Pic_1.png")
    private lazy var frameSize = view.frame.size
    
    //Basic containers
    private lazy var imageContainer = createImageContainer(image: mainImage!)
    private lazy var infoContainer = createInfoContainer()
    
    private lazy var imageSlider = createImageSlider(count: 5)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let sliderStack = createSliderStack(views: imageSlider)
        imageContainer.addSubview(sliderStack)
        setSliderStackAnchors(stack: sliderStack, superView: imageContainer)
        scrollView.addSubview(imageContainer)
        setImageContainerAnchors(container: imageContainer, superView: scrollView)
        
        let title = createLabel(name: "Fantastic gradient", type: .title)
        let subtitle = createLabel(name: "Some images", type: .subtitle)
        let pText = "What do you need for making interesting gradient? All you need is Figma and Imagination!"
        let p = createLabel(name: pText, type: .p)
        let menuButton = createButton(title: "Menu", type: .bordered)
        //let map = MKMapView()
        let spanText = "Creating gradient is free. You can pay 1$ if you really want waste some money"
        let span = createLabel(name: spanText, type: .span)
        let makeButton = createButton(title: "Make gradient", type: .fill)
        let getButton = createButton(title: "Get button", type: .bordered)
        infoContainer.addArrangedSubview(title)
        infoContainer.addArrangedSubview(subtitle)
        infoContainer.addArrangedSubview(p)
        infoContainer.addArrangedSubview(menuButton)
        //infoContainer.addArrangedSubview(map)
        infoContainer.addArrangedSubview(span)
        infoContainer.addArrangedSubview(makeButton)
        infoContainer.addArrangedSubview(getButton)
        setButtonAnchors(button: menuButton, size: .m, align: .center, superView: infoContainer)
        setButtonAnchors(button: makeButton, size: .l, align: .fill, superView: infoContainer)
        setButtonAnchors(button: getButton, size: .m, align: .fill, superView: infoContainer)
        scrollView.addSubview(infoContainer)
        setInfoContainerAnchors(container: infoContainer, superView: scrollView, topView: imageContainer)
        
//        let imageContainerHeight = imageContainer.bounds.size.height
//        let infoContainerHeight = infoContainer.bounds.size.height
//        scrollView.contentSize = CGSize(width: frameSize.width, height: imageContainerHeight + infoContainerHeight + 10)
        scrollView.contentSize = CGSize(width: frameSize.width, height: frameSize.height)
    }
    
    private func createImageContainer(image: UIImage) -> UIImageView {
        let container = UIImageView()
        container.image = image
        
        return container
    }
    
    private func setImageContainerAnchors(container: UIImageView, superView: UIView) {
        container.translatesAutoresizingMaskIntoConstraints = false
        container.topAnchor.constraint(equalTo: superView.topAnchor).isActive = true
        container.leftAnchor.constraint(equalTo: superView.leftAnchor).isActive = true
        container.widthAnchor.constraint(equalToConstant: frameSize.width).isActive = true
        container.heightAnchor.constraint(equalToConstant: frameSize.width / 3 * 2).isActive = true
    }
    
    private func createImageSlider(count: UInt) -> [UIView] {
        var sliders: [UIView] = []
        
        for i in 0..<count {
            let circleView = UIView()
            circleView.layer.cornerRadius = 5
            if i == 0 {
                circleView.layer.backgroundColor = CGColor(red: 0, green: 0, blue: 1, alpha: 1)
            } else {
                circleView.layer.borderWidth = 1
                circleView.layer.borderColor = CGColor(red: 0, green: 0, blue: 1, alpha: 1)
                circleView.layer.backgroundColor = .none
            }
            sliders.append(circleView)
        }
        
        return sliders
    }
    
    private func createSliderStack(views: [UIView]) -> UIStackView {
        let stack = UIStackView(arrangedSubviews: views)
        stack.axis = .horizontal
        stack.alignment = .fill
        stack.distribution = .fillEqually
        stack.spacing = 10
        
        return stack
    }
    
    private func setSliderStackAnchors(stack: UIStackView, superView: UIView) {
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.centerXAnchor.constraint(equalTo: superView.centerXAnchor).isActive = true
        stack.bottomAnchor.constraint(equalTo: superView.bottomAnchor, constant: -20).isActive = true
        stack.widthAnchor.constraint(equalToConstant: 90).isActive = true
        stack.heightAnchor.constraint(equalToConstant: 10).isActive = true
    }
        
    private func createInfoContainer() -> UIStackView {
        let infoView = UIStackView()
        infoView.axis = .vertical
        infoView.alignment = .center
        infoView.distribution = .fillProportionally
        infoView.spacing = 10
        infoView.layer.cornerRadius = 10
        infoView.layer.masksToBounds = true
        
        // infoView.backgroundColor = .red
        
        return infoView
    }
    
    private func setInfoContainerAnchors(container: UIStackView, superView: UIView, topView: UIView) {
        container.translatesAutoresizingMaskIntoConstraints = false
        container.topAnchor.constraint(equalTo: topView.bottomAnchor, constant: -10).isActive = true
        container.leftAnchor.constraint(equalTo: superView.leftAnchor, constant: 15).isActive = true
        container.widthAnchor.constraint(equalToConstant: frameSize.width - 30).isActive = true
    }
    
    private func createLabel(name: String, type: LabelTypes) -> UILabel {
        let label = UILabel()
        label.text = name
        label.numberOfLines = 0
        var fontName: String
        var fontSize: CGFloat
        var color: UIColor
        var aligment: NSTextAlignment
        
        switch type {
        case .title:
            fontName = "Thonburi-Bold"
            fontSize = 26
            color = .black
            aligment = .center
        case .subtitle:
            fontName = "HelveticaNeue"
            fontSize = 20
            color = .gray
            aligment = .center
        case .p:
            fontName = "HelveticaNeue"
            fontSize = 18
            color = .black
            aligment = .left
        case .span:
            fontName = "HelveticaNeue"
            fontSize = 16
            color = .lightGray
            aligment = .center
        case .nums:
            fontName = "Thonburi-Bold"
            fontSize = 22
            color = .black
            aligment = .center
        }
        
        label.font = UIFont(name: fontName, size: fontSize)
        label.textColor = color
        label.textAlignment = aligment
        
        return label
    }
    
    private func createIcon(name: String, color: UIColor) -> UIImageView{
        let icon = UIImage(systemName: name)
        let iconContainer = UIImageView()
        iconContainer.image = icon
        iconContainer.tintColor = color
        
        return iconContainer
    }
    
    private func createButton(title: String, type: ButtonTypes) -> UIButton {
        let button = UIButton()
        button.layer.borderWidth = 2
        button.layer.borderColor = CGColor(red: 0, green: 0, blue: 1, alpha: 1)
        button.layer.cornerRadius = 10
        button.setTitle(title, for: .normal)
        
        switch type {
        case .fill:
            button.backgroundColor = .blue
            button.setTitleColor(.white, for: .normal)
        case .bordered:
            button.backgroundColor = .none
            button.setTitleColor(.blue, for: .normal)
        }
        
        return button
    }
    
    private func setButtonAnchors(button: UIButton, size: ButtonSize, align: ButtonAlign, superView: UIView) {
        button.translatesAutoresizingMaskIntoConstraints = false
        
        let height: CGFloat = size == .m ? 60 : 70
        button.heightAnchor.constraint(equalToConstant: height).isActive = true
        
        let multiplier: CGFloat = align == .center ? 0.9 : 1
        button.widthAnchor.constraint(equalTo: superView.widthAnchor, multiplier: multiplier).isActive = true
    }
    
    private func setMapAnchors(map: MKMapView, superView: UIView) {
        map.translatesAutoresizingMaskIntoConstraints = false
        map.widthAnchor.constraint(equalTo: superView.widthAnchor).isActive = true
        map.heightAnchor.constraint(equalToConstant: 200).isActive = true
    }
}
