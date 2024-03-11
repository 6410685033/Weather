//
//  LoadingView.swift
//  Weather
//
//  Created by Thammasat Thonggamgaew on 23/2/2567 BE.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        ProgressView().progressViewStyle(CircularProgressViewStyle(tint: .white))
            .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview {
    LoadingView()
}
