require 'rails_helper'

describe 'Usuário Visita Tela Inicial' do 
    it 'e vê o nome do app' do
        #Arrange

        #Act
            visit('/')
        #Assert
            expect(page).to have_content('Sistema de Galpões e Estoque')
    end
    it 'e vê os galpões cadastrados' do
        #Arrange
            Warehouse.create(name:'Rio' , code:'SDU', city:'Rio de Janeiro', area:60_000, adress:'Av. do Porto, 1000',cep:'20000-000', description:'aaa')
            Warehouse.create(name:'Maceio', code:'MCZ', city:'Maceio', area:50_000,adress:'Av. Atlântica, 5000',cep:'50000-000', description:'aaa')
        #Act
            visit('/')
        #Assert
            expect(page).not_to have_content('Não existe galpões cadastrados')
            expect(page).to have_content('Rio')
            expect(page).to have_content('Codigo: SDU')
            expect(page).to have_content('Cidade: Rio de Janeiro')
            expect(page).to have_content('60000 m2')

            expect(page).to have_content('Maceio')
            expect(page).to have_content('Codigo: MCZ')
            expect(page).to have_content('Cidade: Maceio')
            expect(page).to have_content('50000 m2')
    end
    
end