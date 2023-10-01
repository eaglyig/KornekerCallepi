//
//  Home.swift
//  KornekerCallepi
//
//  Created by Ihor Orlenko on 27.09.2023.
//

import SwiftUI

struct MultiplicationView: View {
    @State var mDimensionA = 2
    @State var nDimensionA = 2
    @State var matrixValsA = Array(repeating: Array<Double?>(repeating: nil, count: 2), count: 2)
    
    @State var mDimensionB = 2
    @State var nDimensionB = 2
    @State var matrixValsB = Array(repeating: Array<Double?>(repeating: nil, count: 2), count: 2)
    var body: some View {
        VStack(alignment: .center, spacing: 50) {
            
            HStack {
                Stepper("Rows of matrix A:", value: $mDimensionA, in: 2...5)
                Stepper("Columns of matrix A:", value: $nDimensionA, in: 2...5)
                
                Spacer()
                
                Stepper("Rows of matrix B:", value: $nDimensionA, in: 2...5)
                Stepper("Columns of matrix B:", value: $mDimensionB, in: 2...5)
            }
            .padding(.top, 25)
            .padding(.horizontal, 50)
            
            Spacer()
            
            HStack {
                Spacer()
                MatrixView(mDimension: $mDimensionA, nDimension: $nDimensionA, matrixVals: $matrixValsA)
                Spacer()
                MatrixView(mDimension: $nDimensionA, nDimension: $mDimensionB, matrixVals: $matrixValsB)
                Spacer()
            }
            
            Spacer()
        }
    }
}

struct MatrixView: View {
    @Binding var mDimension: Int
    @Binding var nDimension: Int
    @Binding var matrixVals: Array<Array<Double?>>
    var body: some View {
        VStack {
            ForEach(0..<mDimension, id:\.self) { row in
                HStack {
                    ForEach(0..<nDimension, id:\.self) { column in
                        TextField("", text: Binding(
                            get: {
                                if matrixVals.count > row && matrixVals[0].count > column {
                                    guard let elem = matrixVals[row][column] else { return "" }
                                    return String(elem)
                                } else { return "" }
                            },
                            set: { newValue in
                                rearrangeMatrix()
                                self.matrixVals[row][column] = Double(newValue) ?? 1.0
                            }
                        ))
                        
                        .background(Color.gray)
                        .frame(width: 35 - CGFloat(nDimension*3), height: 55 - CGFloat(mDimension * 3), alignment: .center)
                        .padding(.horizontal, 12 - CGFloat(nDimension))
                        .padding(.vertical, 0 - CGFloat(mDimension / 2))
                        
                    }
                }
            }
        }
    }
    
    private func rearrangeMatrix() {
        var newMatrixVals = Array(repeating: Array<Double?>(repeating: nil, count: nDimension), count: mDimension)
        for row in 0..<matrixVals.count {
            for column in 0..<matrixVals[0].count {
                newMatrixVals[row][column] = self.matrixVals[row][column]
            }
        }
        
        matrixVals = newMatrixVals
    }
}

#Preview {
    ContentView()
}
