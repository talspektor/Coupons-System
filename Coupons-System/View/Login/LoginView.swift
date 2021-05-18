//
//  LoginView.swift
//  Coupons
//
//  Created by Tal talspektor on 28/01/2021.
//

import SwiftUI

struct LoginView: View {
    @ObservedObject var app = AppObservable()
    
//    @State private var email: String = ""
//    @State private var password: String = ""
    
    private var types: [UserType] = [.admin, .company, .customer]
    @ObservedObject private var viewModel = LoginViewModel()
    
    let verticalPaddingForFrom = 40.0
    var selection: String?
    
    var body: some View {
        NavigationView {
            ZStack {
                RadialGradient(gradient: Gradient(colors: [.blue, .red]),
                               center: .center,
                               startRadius: 100,
                               endRadius: 470)
                
                VStack(spacing: CGFloat(verticalPaddingForFrom)) {
                    Text("Welcome to Coupons System")
                        .font(.title)
                        .foregroundColor(Color.white)
                        .multilineTextAlignment(.center)
                    
                    HStack {
                        Image(systemName: "person")
                            .foregroundColor(.secondary)
                        
                        TextField("Enter your email", text: $viewModel.email)
                            .foregroundColor(.black)
                    }
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10)
                    
                    HStack {
                        Image(systemName: "key")
                            .foregroundColor(.secondary)
                        
                        SecureField("Enter password", text: $viewModel.password)
                            .foregroundColor(.black)
                    }
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10)
                    
                    VStack {
                        Text("Choose user type")
                            .padding(4)
                            
                        HStack {
                            Button("\(types[0].rawValue)") {
                                self.viewModel.app.selectedType = self.types[0]
                            }.buttonStyle(MyButtonStyle())

                            Button("\(types[1].rawValue)") {
                                self.viewModel.app.selectedType = self.types[1]
                            }.buttonStyle(MyButtonStyle())

                            Button("\(types[2].rawValue)") {
                                self.viewModel.app.selectedType = self.types[2]
                            }.buttonStyle(MyButtonStyle())

                        }.padding(4)
                        HStack {
                            Text("UserType: \(self.app.selectedType.rawValue)")
                                .multilineTextAlignment(.center)
                                .padding(4)
                        }
                        
                        
                    }.background(Color.white)
                    .cornerRadius(10)
                    .padding(4)

                    NavigationLink(destination: HomeView(), isActive: $app.isLoggedIn) {
                        Button(action: {
                            //Call service loin
                            self.viewModel.login(type: self.app.selectedType, email: self.viewModel.email, password: self.viewModel.password)
                        }, label: {
                            Text("Login")
                                .padding()
                        })
                    }
                    
                    .background(Color.black)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    
                }
                .padding(.horizontal, CGFloat(verticalPaddingForFrom))
                }
            .navigationBarTitle("Login")
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
struct MyButtonStyle: ButtonStyle {

  func makeBody(configuration: Self.Configuration) -> some View {
    configuration.label
      .padding(2)
        .foregroundColor(.blue)
      .background(configuration.isPressed ? Color.gray : Color.white)
  }

}
