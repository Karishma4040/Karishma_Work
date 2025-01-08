import SwiftUI

// Step 1: Create a LoginView with enhanced UI and validation
struct LoginView: View {
    @State var username: String = ""
    @State var password: String = ""
    @State var showError: Bool = false
    @State var errorMessage: String = ""
    @State var isPasswordVisible: Bool = false
    @State var showSuccess: Bool = false
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.white, Color.blue.opacity(0.3)]), startPoint: .top, endPoint: .bottom)
                            .edgesIgnoringSafeArea(.all)
            
        VStack {
            Text("Login")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.blue)
                .padding(.bottom, 40)
            
            TextField("Username", text: $username)
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(5.0)
                .padding(.bottom, 20)
                .autocapitalization(.none)
                .disableAutocorrection(true)
            
            ZStack {
                if isPasswordVisible {
                    TextField("Password", text: $password)
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(5.0)
                        .padding(.bottom, 20)
                } else {
                    SecureField("Password", text: $password)
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(5.0)
                        .padding(.bottom, 20)
                }
                HStack {
                    Spacer()
                    Button(action: {
                        isPasswordVisible.toggle()
                    }) {
                        Image(systemName: isPasswordVisible ? "eye" : "eye.slash")
                            .foregroundColor(.gray)
                            .padding(.trailing, 20)
                    }
                }
            }
            
            if showError {
                Text(errorMessage)
                    .foregroundColor(.red)
                    .padding(.bottom, 20)
            }
            
            if showSuccess {
                Text("Login Successful!")
                    .foregroundColor(.green)
                    .padding(.bottom, 20)
            }
            
            Button(action: {
                validateLogin()
            }) {
                Text("Login")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(width: 220, height: 60)
                    .background(Color.blue)
                    .cornerRadius(15.0)
            }
        }
    }
    }
    
    // Step 2: Add validation logic
   func validateLogin() {
        if username.isEmpty || password.isEmpty {
            showError = true
            showSuccess = false
            errorMessage = "Please enter both username and password."
        } else if password.count < 8 {
            showError = true
            showSuccess = false
            errorMessage = "Password must be at least 8 characters long."
        } else if !password.contains(where: { $0.isUppercase }) {
            showError = true
            showSuccess = false
            errorMessage = "Password must contain at least one uppercase letter."
        } else if !password.contains(where: { $0.isLowercase }) {
            showError = true
            showSuccess = false
            errorMessage = "Password must contain at least one lowercase letter."
        } else if !password.contains(where: { $0.isNumber }) {
            showError = true
            showSuccess = false
            errorMessage = "Password must contain at least one number."
        } else if !password.contains(where: { "!@#$%^&*()_+-=[]{}|;:'\",.<>?/".contains($0) }) {
            showError = true
            showSuccess = false
            errorMessage = "Password must contain at least one special character."
        } else {
            showError = false
            showSuccess = true
            // Handle successful login
        }
    }
}

