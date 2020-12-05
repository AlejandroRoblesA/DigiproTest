//
//  FormView.swift
//  DigiproTest
//
//  Created by Alejandro Robles on 03/12/20.
//

import UIKit

//MARK: - Class
class FormViewController: UIViewController {
    
    //MARK: - ImageView
    var headerImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "digipro")
        image.layer.cornerRadius = 20
        image.layer.borderWidth = 3
        image.contentMode = .scaleAspectFit
        image.layer.borderColor = UIColor.white.cgColor
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    //MARK: - TextFields
    var maternalSurnameTextField: UITextField = {
        let textField = UITextField()
        textField.textAlignment = .center
        textField.backgroundColor = .white
        textField.attributedPlaceholder = NSAttributedString(string: "Apellido Materno", attributes: [NSAttributedString.Key.foregroundColor : DigiproColors().blue])
        textField.textColor = DigiproColors().green
        textField.layer.cornerRadius = 10
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    lazy var lastNameTextField: UITextField = {
        let textField = UITextField()
        textField.textAlignment = .center
        textField.backgroundColor = .white
        textField.attributedPlaceholder = NSAttributedString(string: "Apellido Paterno", attributes: [NSAttributedString.Key.foregroundColor : DigiproColors().blue])
        textField.textColor = DigiproColors().green
        textField.layer.cornerRadius = 10
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    lazy var nameTextField: UITextField = {
        let textField = UITextField()
        textField.textAlignment = .center
        textField.backgroundColor = .white
        textField.attributedPlaceholder = NSAttributedString(string: "Nombre", attributes: [NSAttributedString.Key.foregroundColor : DigiproColors().blue])
        textField.textColor = DigiproColors().green
        textField.layer.cornerRadius = 10
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    lazy var emailTextField: UITextField = {
        let textField = UITextField()
        textField.textAlignment = .center
        textField.backgroundColor = .white
        textField.attributedPlaceholder = NSAttributedString(string: "Correo electrónico", attributes: [NSAttributedString.Key.foregroundColor : DigiproColors().blue])
        textField.textColor = DigiproColors().green
        textField.layer.cornerRadius = 10
        textField.keyboardType = .emailAddress
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    lazy var phoneNumberTextField: UITextField = {
        let textField = UITextField()
        textField.textAlignment = .center
        textField.backgroundColor = .white
        textField.attributedPlaceholder = NSAttributedString(string: "Teléfono", attributes: [NSAttributedString.Key.foregroundColor : DigiproColors().blue])
        textField.textColor = DigiproColors().green
        textField.layer.cornerRadius = 10
        textField.keyboardType = .phonePad
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    //MARK: - Button
    lazy var sendButton: UIButton = {
        let button = UIButton()
        button.setTitle("Enviar", for: .normal)
        button.backgroundColor = DigiproColors().green
        button.clipsToBounds = true
        button.layer.cornerRadius = 20
        button.layer.borderWidth = 3
        button.layer.borderColor = UIColor.white.cgColor
        button.addTarget(self, action: #selector(handleSendButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    //MARK: - Constraints
    func setupConstraints(){
        
        ///3er TextFiedl
        view.addSubview(maternalSurnameTextField)
        maternalSurnameTextField.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        maternalSurnameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
        maternalSurnameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true
        maternalSurnameTextField.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        ///2nd TextField
        view.addSubview(lastNameTextField)
        lastNameTextField.bottomAnchor.constraint(equalTo: maternalSurnameTextField.topAnchor, constant: -30).isActive = true
        lastNameTextField.leadingAnchor.constraint(equalTo: maternalSurnameTextField.leadingAnchor).isActive = true
        lastNameTextField.trailingAnchor.constraint(equalTo: maternalSurnameTextField.trailingAnchor).isActive = true
        lastNameTextField.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        ///1st TextField
        view.addSubview(nameTextField)
        nameTextField.bottomAnchor.constraint(equalTo: lastNameTextField.topAnchor, constant: -30).isActive = true
        nameTextField.leadingAnchor.constraint(equalTo: maternalSurnameTextField.leadingAnchor).isActive = true
        nameTextField.trailingAnchor.constraint(equalTo: maternalSurnameTextField.trailingAnchor).isActive = true
        nameTextField.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        ///4th TextField
        view.addSubview(emailTextField)
        emailTextField.topAnchor.constraint(equalTo: maternalSurnameTextField.bottomAnchor, constant: 30).isActive = true
        emailTextField.leadingAnchor.constraint(equalTo: maternalSurnameTextField.leadingAnchor).isActive = true
        emailTextField.trailingAnchor.constraint(equalTo: maternalSurnameTextField.trailingAnchor).isActive = true
        emailTextField.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        ///5th TextField
        view.addSubview(phoneNumberTextField)
        phoneNumberTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 30).isActive = true
        phoneNumberTextField.leadingAnchor.constraint(equalTo: maternalSurnameTextField.leadingAnchor).isActive = true
        phoneNumberTextField.trailingAnchor.constraint(equalTo: maternalSurnameTextField.trailingAnchor).isActive = true
        phoneNumberTextField.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        ///Image
        view.addSubview(headerImage)
        headerImage.bottomAnchor.constraint(equalTo: nameTextField.topAnchor, constant: -50).isActive = true
        headerImage.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        headerImage.widthAnchor.constraint(equalToConstant: 100).isActive = true
        headerImage.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        ///Button
        view.addSubview(sendButton)
        sendButton.topAnchor.constraint(equalTo: phoneNumberTextField.bottomAnchor, constant: 30).isActive = true
        sendButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        sendButton.widthAnchor.constraint(equalToConstant: 200).isActive = true
        sendButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
}
