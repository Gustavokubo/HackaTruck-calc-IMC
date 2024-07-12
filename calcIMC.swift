//
//  calcIMC.swift
//  Aula1
//
//  Created by Turma02-4 on 12/07/24.
//

import SwiftUI

struct calcIMC: View {
    @State private var peso: Double = 0.0
    @State private var altura: Double = 0.0
    @State private var imc: Double = 0.0
    @State private var corDeFundo: Color = .normal
    @State private var condicao: String = ""
    var body: some View {
        ZStack{
            Color(corDeFundo)
                .ignoresSafeArea()
            VStack{
                Text("Calculadora de IMC").font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/).bold()
                TextField("Digite seu peso", value: $peso, format: .number )
                    .frame(width: 350, height: 30)
                    .multilineTextAlignment(.center)
                    .keyboardType(.numberPad)
                    .background(.white)
                    .padding()
                    
                TextField("Digite seu peso", value: $altura, format: .number )
                    .frame(width: 350, height: 30)
                    .multilineTextAlignment(.center)
                    .keyboardType(.numberPad)
                    .background(.white)
                    .padding()
                Button("Calcular"){
                    imc = (peso/(altura * altura))
                    print(imc)
                    
                    if imc < 18.5{
                        corDeFundo = .baixoPeso
                        condicao = "Baixo Peso"
                        
                    } else if imc >= 18.5 && imc <= 24.99{
                        corDeFundo = .normal
                        condicao = "Normal"
                        print(condicao)
            
                    } else if imc >= 25.0 && imc <= 29.99{
                        corDeFundo = .sobrepeso
                        condicao = "Sobrepeso"
                        print(condicao)
                        
                    } else if imc >= 30.0 {
                        corDeFundo = .obesidade
                        condicao = "Obesidade"
                        print(condicao)
                    }
                }.buttonStyle(.borderedProminent).tint(.blue)
                Spacer()
                Text("\(condicao)").font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    Spacer()
                VStack{
                    Image("tabela-IMC")
                        .resizable()
                        .frame(width: 390, height: 200)
                }
            }
        }
    }
}

#Preview {
    calcIMC()
}
