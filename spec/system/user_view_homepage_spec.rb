require 'rails_helper'

describe 'Usuário Visita Tela Inicial' do 
    it 'e vê o nome do app' do
        #Arrange

        #Act
            visit('/')
        #Assert
            expect(page).to have_content('Sistema de Galpões e Estoque')
    end
end