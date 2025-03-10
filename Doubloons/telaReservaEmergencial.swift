//
//  telaGastos.swift
//  telaGastos
//
//  Created by Turma01-11 on 27/02/25.
//

import SwiftUI

struct telaReservaEmergencial: View {
    @State var valorReservaEmergencial:String=""
    var body: some View {
        VStack{
            VStack{
                HStack{
                    Text("Reserva Emergencial")
                        .font(.title)
                        .bold()
                        .padding(.top, 20)
                        .padding(.leading, 20)
                        .padding(.bottom, 5)
                    Spacer()
                    Image(systemName: "line.3.horizontal")
                        .resizable()
                        .frame(width: 40, height: 20)
                        .foregroundStyle(.white)
                        .padding()
                }
                HStack{
                    HStack{
                        Text("R$ 522,04")
                            .font(.title3)
                            .bold()
                            .padding(.leading, 20)
                    }
                    .padding(.bottom, 10)
                    Spacer()
                }
                .padding(.bottom, 10)
            }
            .background(LinearGradient(gradient: Gradient(colors: [Color.green, Color.black]), startPoint: .topTrailing, endPoint: .bottomLeading))
            .foregroundColor(.white)
            .clipShape(UnevenRoundedRectangle(cornerRadii: .init(topLeading: 20, bottomLeading: 20)))
            .shadow(radius: 10)
            .padding(.leading, 15)
            Spacer().frame(height: 30)
            
            
            
            Text("Criar uma reserva:").bold().padding(.trailing,200)
            TextField("Digite o valor a ser guardado todo mês",text:$valorReservaEmergencial).underline().padding(.leading,24)
            
            HStack{
                Text("Criar")
                    .fontWeight(.semibold)
                    .foregroundStyle(.white)
            }.frame(width: 150, height: 60)
                .background(LinearGradient(gradient: Gradient(colors:[.green, .black]),startPoint: .topTrailing, endPoint: .bottomLeading))
                .clipShape(UnevenRoundedRectangle(cornerRadii: .init(bottomLeading: 10, topTrailing: 10)))
                .shadow(radius: 8).padding(.trailing,200).padding(.top)
            Spacer().frame(height: 30)
            
            Text("Reserva:").bold().padding(.trailing,275)
            
            ZStack{
                HStack{
                    Text("Total Acumulado: R$ ")
                }.frame(width: 350,height: 100).background(.white)
                    .clipShape(Rectangle()).cornerRadius(10)
                    .shadow(radius: 10)
            }
            
            HStack{
                Spacer().frame(width: 50)
                Text("Saldo Restante Mensal")
                    .foregroundStyle(.white)
                    .fontWeight(.semibold)
                
                Spacer().frame(width: 45)
                
                Text("$522,04")
                    .foregroundStyle(.white)
                    .fontWeight(.semibold)
                
            }.frame(width: 370, height: 60)
                .background(.cinzaescuro)
                .clipShape(UnevenRoundedRectangle(cornerRadii: .init(bottomTrailing: 10, topTrailing: 10)))
                .shadow(radius: 8)
                .offset(x: -65)
        }
    }
}
#Preview {
    telaReservaEmergencial()
}
