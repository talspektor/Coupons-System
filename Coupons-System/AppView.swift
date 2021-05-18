//
//  AppView.swift
//  CouponSystem
//
//  Created by Tal talspektor on 16/01/2021.
//

import SwiftUI

struct AppView: View {
    @EnvironmentObject var user: AppObservable
    
    var body: some View {
        NavigationView {
//            if user.isLoggedIn {
//                HomeView()
//            } else {
                LoginView()
//            }
        }.navigationBarTitle("Coupon System")
//        if user.useMockData {
//            HomeView()
//        } else {
//            if user.isLoggedIn {
//                HomeView()
//            } else {
//                LoginView()
//            }
//        }
    }
}

struct AppView_Previews: PreviewProvider {
    static var user = AppObservable()
    static var previews: some View {
        AppView().environmentObject(user)
    }
}
