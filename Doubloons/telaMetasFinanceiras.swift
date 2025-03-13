//
//  telaMetasFinanceiras.swift
//  Doubloons
//
//  Created by Turma01-11 on 28/02/25.
//

import SwiftUI

struct telaMetasFinanceiras: View {
    
    @State var titulo : String=""
    
    
    @State var meta = Meta(titulo: "", valor: nil, mensalmente: nil, total_acumulado: nil, data_criacao: 0)
    
    @ObservedObject var financeiroView = FinanceiroViewModel()
    
    @State var usuario : Financeiro = Financeiro(_id: "", _rev: "", nome: "", saldo_em_conta: 0, renda_bruta_mensal: 0, saldo_restante_mensal: 0, gastos_fixos: GastosFixos(total_gastos: 0, gastos: [Gasto(titulo: "", valor: 0)]), metas_financeiras: MetasFinanceiras(total_metas: 0, metas: [Meta(titulo: "teste", data_criacao: 1740405814346)]), reserva_emergencial: ReservaEmergencial(total_reserva: 0, mensalmente: 0, guardado_este_mes: 0, quantidade_de_meses_acumulados: 0, data_criacao: 0), tarefas: [Tarefa(titulo: "", descricao: "", prioridade: "", status: "")])
    
    @State var offsets = [CGSize](repeating: CGSize.zero, count: 6)

    private let swipeLeftLimit: CGFloat = -50
    private let swipeRightLimit: CGFloat = 50
    private let swipeLeftLimitToShow: CGFloat = -30
    private let swipeRightLimitToHide: CGFloat = 30
    
    var body: some View {
        VStack{
            VStack{
                HStack{
                    Text("Metas Financeiras")
                        .font(.title)
                        .fontWeight(.semibold)
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
                        Text("R$" + String(format: "%2.f", usuario.metas_financeiras.total_metas!))
                            .font(.title3)
                            .bold()
                            .padding(.leading, 20)
                    }
                    .padding(.bottom, 10)
                    Spacer()
                }
                .padding(.bottom, 10)
            }
            .background(LinearGradient(gradient: Gradient(colors: [.roxoC, .roxoE]), startPoint: .topTrailing, endPoint: .bottomLeading))
            .foregroundColor(.white)
            .clipShape(UnevenRoundedRectangle(cornerRadii: .init(topLeading: 20, bottomLeading: 20)))
            .shadow(radius: 10)
            .padding(.leading, 15)
        }
        Spacer().frame(height: 30)
        HStack{
            ScrollView{
            VStack{
                Text("Criar objetivo:")
                    .fontWeight(.semibold).padding(.leading, -173)
                HStack{
                    TextField("Insira um titulo", text: $meta.titulo)
                        .overlay(VStack{Divider().offset(x: 0, y: 15)})
                }.padding()
                HStack{
                    TextField("Valor do objetivo", value: $meta.valor, format: .number)
                        .overlay(VStack{Divider().offset(x: 0, y: 15)})
                }.padding()
                HStack{
                    TextField("Quantidade mensal pra guardar", value: $meta.mensalmente, format: .number)
                        .overlay(VStack{Divider().offset(x: 0, y: 15)})
                }.padding()
                
                HStack{
                    TextField("Total acumulado até o momento", value: $meta.total_acumulado, format: .number)
                        .overlay(VStack{Divider().offset(x: 0, y: 15)})
                }.padding()
                
                Spacer().frame(height: 15)
                HStack{
                    Button( action: {
                        meta.data_criacao = Int(Date().timeIntervalSince1970 * 1000)
                        
                        if(meta.valor != nil && meta.total_acumulado != nil && meta.mensalmente != nil) {
                            print(meta)
                            usuario.metas_financeiras.total_metas! += meta.valor!
                            usuario.metas_financeiras.metas.append(meta)
                            print(usuario)
                            financeiroView.post(usuario)
                        }
                        
                        
                        
                    }, label: {
                        Text("Criar")
                            .font(.title3)
                            .fontWeight(.semibold)
                    })
                    
                }
                .foregroundColor(.white)
                .frame(width: 130, height: 60)
                .background(LinearGradient(gradient: Gradient(colors: [.roxoC, .roxoE]), startPoint: .topTrailing, endPoint: .bottomLeading))
                .clipShape(UnevenRoundedRectangle(cornerRadii: .init(topLeading: 20, bottomLeading: 20, bottomTrailing: 20)))
                .shadow(radius: 5)
                .padding(.leading, -170)
                
                Spacer().frame(height: 15)
                
                Text("Metas criadas:").padding(.leading, -165).bold()
                
                
                    VStack {
                        ForEach(Array(usuario.metas_financeiras.metas.enumerated()), id: \.offset) { index, m in
                            
                            HStack{
                                VStack(alignment: .leading){
                                    HStack{
                                        Text("Título:").fontWeight(.semibold)
                                        Spacer()
                                        Text(m.titulo)
                                    }.padding(5).background(.cinzaclaro).clipShape(Rectangle()).cornerRadius(10)
                                    
                                    HStack{
                                        Text("Valor: ").fontWeight(.semibold)
                                        Spacer()
                                        Text(String(format: "R$%.2f", m.valor ?? 0))
                                    }.padding(5).background(.cinzaclaro).clipShape(Rectangle()).cornerRadius(10)
                                    
                                    HStack{
                                        Text("Mensalmente: ").fontWeight(.semibold)
                                        Spacer()
                                        Text(String(format: "R$%.2f", m.mensalmente ?? 0))
                                    }.padding(5).background(.cinzaclaro).clipShape(Rectangle()).cornerRadius(10)
                                    
                                    HStack{
                                        Text("Total Acumulado: ").fontWeight(.semibold)
                                        Spacer()
                                        Text(String(format: "R$%.2f", m.total_acumulado ?? 0))
                                    }.padding(5).background(.cinzaclaro).clipShape(Rectangle()).cornerRadius(10)
                                    
                                    HStack{
                                        Text("Data Criação: ").fontWeight(.semibold)
                                        Spacer()
                                        Text(Date(timeIntervalSince1970: TimeInterval(m.data_criacao/1000)).formatted(date: .numeric, time: .omitted).description)
                                    }.padding(5).background(.cinzaclaro).clipShape(Rectangle()).cornerRadius(10)
                                    
                                }
                                
                            }
                            .padding()
                            .frame(width: 350)
                            .background(.white)
                            .clipShape(Rectangle()).cornerRadius(10)
                            .shadow(radius: 10)
                            .offset(x: offsets[index].width)
                            .gesture(
                                DragGesture()
                                    .onChanged { gesture in
                                        // Prevent swipe to the right in default position
                                        if offsets[index].width == 0 && gesture.translation.width > 0 {
                                            return
                                        }
                                        
                                        // Prevent drag more than swipeLeftLimit points
                                        if gesture.translation.width < swipeLeftLimit {
                                            return
                                        }
                                        
                                        // Prevent swipe againt to the left if it's already swiped
                                        if offsets[index].width == swipeLeftLimit && gesture.translation.width < 0 {
                                            return
                                        }
                                        
                                      
                                        
                                        // If view already swiped to the left and we start dragging to the right
                                        // Firstly will check if it's swiped left
                                        if offsets[index].width >= swipeLeftLimit {
                                            // And here checking if swiped to the right more than swipeRightLimit points
                                            // If more - need to set the view to zero position
                                            if gesture.translation.width > swipeRightLimit {
                                                self.offsets[index] = .zero
                                                return
                                            }
                                            
                                            // Check if only swiping to the right - update distance by minus swipeLeftLimit points
                                            if offsets[index].width != 0 && gesture.translation.width > 0 {
                                                self.offsets[index] = .init(width: swipeLeftLimit + gesture.translation.width,
                                                                            height: gesture.translation.height)
                                                return
                                            }
                                        }
                                        
                                        self.offsets[index] = gesture.translation
                                    }
                                    .onEnded { gesture in
                                        withAnimation {
                                            // Left swipe handle:
                                            if self.offsets[index].width < swipeLeftLimitToShow {
                                                self.offsets[index].width = swipeLeftLimit
                                                return
                                            }
                                            if self.offsets[index].width < swipeLeftLimit {
                                                self.offsets[index].width = swipeLeftLimit
                                                return
                                            }
                                            
                                            // Right swipe handle:
                                            if gesture.translation.width > swipeRightLimitToHide {
                                                self.offsets[index] = .zero
                                                return
                                            }
                                            if gesture.translation.width < swipeRightLimitToHide {
                                                self.offsets[index].width = swipeLeftLimit
                                                return
                                            }
                                            
                                            self.offsets[index] = .zero
                                            
                                            
                                           
                                        }
                                        
                                        if(offsets[index].width <= -25){
                                            usuario.metas_financeiras.total_metas! -= m.valor!
                                            usuario.metas_financeiras.metas.remove(at: index)
                                            //financeiroView.post(usuario)
                                            return
                                        }
                                    }
                            )
                            
                        }.padding()
                    }
                    
                    
                }
                
            }
            .padding(.leading, 20)
        }
        Spacer()
    }
}



#Preview {
    telaMetasFinanceiras()
}
