//
//  SignUp.swift
//  kommal
//
//  Created by Ghada al ajmi on 14/06/1446 AH.
//
import SwiftUI

struct SignUp: View {
    @State private var username: String = "" // لتخزين إدخال اسم المستخدم
    @State private var password: String = "" // لتخزين إدخال كلمة المرور
    @State private var isSheetPresented = false
    
    var body: some View {
        NavigationStack { // إضافة NavigationStack للتنقل بين الشاشات
            ZStack {
                // الخلفية المتدرجة
                LinearGradient(gradient: .init(colors: [.blu1, .blu2, .blu3, .blu4]), startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()
                
                VStack {
                    // الدوائر الخلفية
                    Circle()
                        .fill(Color.circle.opacity(0.19))
                        .frame(width: 562, height: 612)
                        .offset(y: -225)
                    
                
                }
                ZStack{
                    Circle()
                        .fill(Color.circle.opacity(0.19)) // شفافية 50%
                                    .frame(width: 562, height: 612).offset(y:200)// حجم الدائرة
                                
                }
                
                VStack(spacing: 10) {
                    // الشعار
                    Image("logo1")
                        .frame(width: 150, height: 150)
                    
                    // البطاقة البيضاء
                    VStack(spacing: 30) {
                        // حقل اسم المستخدم
                        TextField("Username", text: $username)
                            .padding()
                            .frame(width: 290.0, height: 50.0)
                            .background(Color.white)
                            .cornerRadius(7)
                        
                        
                        // حقل كلمة المرور
                        SecureField("Password", text: $password)
                            .padding()
                            .frame(width: 290.0, height: 50.0)
                            .background(Color.white)
                            .cornerRadius(7)
                    
                        
                        HStack {
                            Text("I don't have an account")
                                .foregroundColor(.white)
    
                            Button("Sign up") {
                                // إظهار الشيت عند الضغط
                                isSheetPresented = true
                            }
                            .foregroundColor(.ylw)
                            .fontWeight(.bold)
                        }
                        
                        .sheet(isPresented: $isSheetPresented){
                            // محتوى الشيت
                            RegistrationSheet()
                        }
    
                        .padding(.vertical, 5.0)
                        .overlay(
                               Rectangle()
                                   .frame(height: 1) // ارتفاع الخط
                                .foregroundColor(.white) // لون الخط
                                   .padding(.top, 35), // مسافة بين النص والخط
                               alignment: .bottom
                           )
                        // زر التسجيل
                        Button(action: {
                            // الإجراء عند النقر
                            print("Get Started: \(username), \(password)")
                        }) {
                            Text("Get Started")
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .frame(width: 140.0, height: 50.0)
                                .background(Color.ylw)
                                .cornerRadius(7)
                        }
                        .padding()
                        
                        // زر Continue as a guest
                        NavigationLink(destination: MainScreen1()) {
                            Text("Continue as a guest")
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                        }
                        .padding(.vertical)
                    }
                }
                .padding()
                .cornerRadius(20)
                .shadow(radius: 5)
              //  .padding(.horizontal,20) // لتوسيط البطاقة
            }
        }
    }
    
    // كود محتوى الشيت
  
    struct RegistrationSheet: View {
        @Environment(\.dismiss) private var dismiss // لإغلاق الشيت
        @State private var name: String = ""
        @State private var phoneNumber: String = ""
        @State private var password: String = ""
        @State private var confirmPassword: String = ""

        var body: some View {
            NavigationStack {
                ZStack {
                    // تغيير لون الخلفية إلى البيج وملء الشاشة
                    Color("bg").ignoresSafeArea()

                    VStack {
                        Spacer() // لإضافة مسافة في الأعلى
                        
                        // العنوان وزر الإغلاق
                        HStack {
                            Text("Create Account")
                                .font(.headline)
                                .fontWeight(.bold)
                                

                            Spacer()

                            Button(action: {
                                dismiss() // إغلاق الشيت
                            }) {
                                Image(systemName: "xmark")
                                    .foregroundColor(.gray)
                                    .padding()
                                    .frame(width: 25.0, height: 25.0)
                                    .background(Color.white.opacity(0.7))
                                    .clipShape(Circle())
                                    .shadow(radius: 2)
                            }
                        }
                        .padding(.horizontal, 20)
                        .padding(.top, 20)

                        // خط فاصل
                        Divider()
                            .background(Color.gray.opacity(0.5))
                            .padding(.horizontal, 20)

                        // خانات الإدخال مع الرموز
                        VStack(spacing: 20) {
                            HStack {
                                Image(systemName: "person.fill")
                                    .foregroundColor(.gray)
                                TextField("Username", text: $name)
                            }
                            .padding()
                            .frame(width: 300.0, height: 50.0)
                            .background(Color.white)
                            .cornerRadius(7)

                            HStack {
                                Image(systemName: "phone.fill")
                                    .foregroundColor(.gray)
                                TextField("Phone Number", text: $phoneNumber)
                                    .keyboardType(.phonePad)
                            }
                            .padding()
                            .frame(width: 300.0, height: 50.0)
                            .background(Color.white)
                            .cornerRadius(7)

                            HStack {
                                Image(systemName: "lock.fill")
                                    .foregroundColor(.gray)
                                SecureField("Password", text: $password)
                            }
                            .padding()
                            .frame(width: 300.0, height: 50.0)
                            .background(Color.white)
                            .cornerRadius(7)

                            HStack {
                                Image(systemName: "lock.fill")
                                    .foregroundColor(.gray)
                                SecureField("Confirm Password", text: $confirmPassword)
                            }
                            .padding()
                            .frame(width: 300.0, height: 50.0)
                            .background(Color.white)
                            .cornerRadius(7)

                            Button(action: {
                                // تنفيذ الإجراء المطلوب
                                print("Name: \(name), Phone: \(phoneNumber), Password: \(password), Confirm: \(confirmPassword)")
                            }) {
                                Text("Create Account")
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                    .frame(maxWidth: .infinity)
                                    .padding()
                                    .frame(width: 160.0, height: 50.0)
                                    .background(Color.ylw)
                                    .cornerRadius(10)
                                    .shadow(radius: 5)
                            }
                        }
                        .padding(.top, 10)

                        Spacer() // لإضافة مسافة في الأسفل
                    }
                }
                .navigationTitle("")
                .navigationBarTitleDisplayMode(.inline)
                .presentationDetents([.medium]) // التحكم في ارتفاع الشيت
            }
        }
    }
}

#Preview {
    SignUp()
}
