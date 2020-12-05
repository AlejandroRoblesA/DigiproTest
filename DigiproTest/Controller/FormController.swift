//
//  ViewController.swift
//  DigiproTest
//
//  Created by Alejandro Robles on 03/12/20.
//

import UIKit

//MARK: - Extensions
extension FormViewController{
    
    //MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        nameTextField.text = nil
        lastNameTextField.text = nil
        maternalSurnameTextField.text = nil
        emailTextField.text = nil
        phoneNumberTextField.text = nil
    }
    
    //MARK: - Functions
    func setupView(){
        navigationItem.title = "Formulario"
        view.backgroundColor = DigiproColors().background
        phoneNumberTextField.delegate = self
        setupConstraints()
    }
    
    @objc func handleSendButton(){
        
        if (validationTextField().isEmpty){
            errorAlert(title: validationTextField().titulo!, message: "El campo de \(validationTextField().titulo!) no puede dejarse vacio.")
        }
        else{
            if (isValidEmail(email: emailTextField.text!)){
                saveData()
                
                let user =  UsersController()
                navigationController?.pushViewController(user, animated: true)
                print("Información agregada a la base de datos")
            }
            else{
                errorAlert(title: "Correo electrónico", message: "El correo electrónico ingresado no contienen un formato valido.\n\nPor ejemplo:\nemail@digipro.com")
            }
        }
    }
    
    func errorAlert(title: String, message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true)
    }
    
    func validationTextField() -> (titulo : String?,  isEmpty: Bool){
        if (!nameTextField.hasText){
            return ("Nombre", true)
        }
        else{
            if(!lastNameTextField.hasText){
                return ("Apellido Paterno", true)
            }
            else{
                if (!maternalSurnameTextField.hasText){
                    return ("Apellido Materno", true)
                }
                else{
                    if (!emailTextField.hasText){
                        return ("Correo electrónico", true)
                    }
                    else{
                        if (!phoneNumberTextField.hasText){
                            return ("Teléfono", true)
                        }
                    }
                }
            }
            return (nil, false)
        }
    }
    
    func isValidEmail(email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: email)
    }
    
    func saveData(){

        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let form = Form(context: context)
        form.name = nameTextField.text
        form.lastName = lastNameTextField.text
        form.maternalSurname = maternalSurnameTextField.text
        form.email = emailTextField.text
        form.phone = phoneNumberTextField.text
        
        do{
            try context.save()
        }
        catch{
            print(error.localizedDescription)
        }
    }
}
//MARK: - TextFieldDelegate
extension FormViewController: UITextFieldDelegate{
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let allowedCharacters = CharacterSet(charactersIn:"0123456789")
        let characterSet = CharacterSet(charactersIn: string)
        let currentString: NSString = textField.text! as NSString
        let maxLength = 10
        let newString: NSString = currentString.replacingCharacters(in: range, with: string) as NSString
        return  allowedCharacters.isSuperset(of: characterSet) && (newString.length <= maxLength)
    }
}
