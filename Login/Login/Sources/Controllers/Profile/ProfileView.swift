//
//  ProfileView.swift
//  Login
//
//  Created by Moacir Ezequiel Lamego on 20/07/2022.
//

import Foundation
import UIKit

class ProfileView: ViewDefault {
    override func setupVisualElements() {
        super.setupVisualElements()
        
        
//        self.contentView.backgroundColor = UIColor(patternImage: UIImage(named: "Logo")!)
    }
}


/*
    - Usar titulo nas telas
        - Usar largeTitle.
 
    - Tem que ter ScrollView
    - Quando abrir lista (Campo Faixa Etaria e Genero)
        - Em cima da lista tem que ter dois botoes
            Cancelar que nao seleciona nada na lista e fecha a lista
            Selecionar que seleciona o item da lista que esta em cima e fecha a lista
    - Tem que utilizar as cores pré definidas
    - Tem que ao salvar (nao faz nada)
        - mas abre uma tela com o nome de EnderecoViewController
            - Com a primeira label
                - CEP
            - Primeiro text field o campo cep e do lado dele um botao com uma lupa
 
 
 Faixa Etaria
     0..15
     16..25
     26..35
     36..50
     >50
 
 Genero
    Carinha Masculina
    Cainha Feminina
    Não quero Informar
 
 CPF
    - Com mascara
        123.456.789-01
    - Calculo Digito Verificador
             if "80626963915".isValidCPF {
                 print("Valido")
             }
             
             if "80626963914".isValidCPF {
                 print("Valido")
             } else {
                 print("InValido")
             }
             
 Telefone
    - Com Mascara
        (99) 99999-9999
 
 */


