import UIKit


class FormValidator {
    
    enum validationType {
        case firstName
        case lastName
        case email
        case password
        case confirmpassword
        case address
        case phone
        case varificationCode
    }
    
    var errorMessage: String?
    
    func validateInput(type: validationType, _ string: String ) {
        if errorMessage != nil { return }
        let trimString = string.trimmingCharacters(in: .whitespacesAndNewlines)
        
        switch type {
 
        case .firstName:

            if trimString.count < 3 || trimString.count > 30 {
                errorMessage = "First name is required, between 3-30 characters"
            }
            
        case .lastName:
            if trimString.count < 3 || trimString.count > 30 {
                errorMessage = "Last name is required, between 3-30 characters"
            }
        case .email:
        
            let emailRexExp = "^[A-Z0-9a-z._%+-]{3,}+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
            let pred = NSPredicate(format:"SELF MATCHES %@", emailRexExp)
            let isvalidInput = pred.evaluate(with: string)
            if isvalidInput == false {
                errorMessage = "valid email is required"
            }
        case .password:
        if string.count < 6 || string.count > 32 {
            errorMessage = "password is required, between 6-32 characters"
        }
            
        case .confirmpassword:
            if string.count < 6 || string.count > 32 {
                       errorMessage = "password is required, between 6-32 characters"
            }
        case .address:
            if string.count < 2 {
                errorMessage = "address is required, at least 3 characters"
                
            }
        case .varificationCode:
            if string.count < 3 {
                errorMessage = "varification code is required, at least 4 characters"
                
            }
        case .phone:
            if  trimString.count < 9 || trimString.count > 15 {
                errorMessage = "Phone is required, between 9-15 digits"
            }
        }


        func match(password: String, confirmPassword: String ) {
            if errorMessage != nil { return }
            
            if password != confirmPassword {
                errorMessage = "Confirm password does not match with Password, same input is required"
            }
        }
        
    }
    
}

 //MARK:-  view controller
func  isValidFormInput() -> Bool {
    
    let formValidator = FormValidator()
    formValidator.validateInput(type: .firstName, "abc")
    formValidator.validateInput(type: .lastName, "abc")
    formValidator.validateInput(type: .email, "abc@gmailcom")
    formValidator.validateInput(type: .phone, "123456789")
   
    if let description = formValidator.errorMessage {
        print(description )
        return false
    }

    return true

}

func SignupBtnTapped( ) {
    if isValidFormInput() {
        print("---SAFE NETWORK CALL---")
    }
}

SignupBtnTapped()





