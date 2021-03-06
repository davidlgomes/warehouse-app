require 'rails_helper'

describe 'Usuário cadastra um galpão' do 
    it 'a partir da tela inicial' do
        #Arrange
        #Act
        visit(root_path)
        click_on('Cadastrar Galpão')
        
        #Assert
        expect(page).to have_field('Nome')
        expect(page).to have_field('Descrição')
        expect(page).to have_field('Código')
        expect(page).to have_field('Endereço')
        expect(page).to have_field('CEP')
        expect(page).to have_field('Área')
    end
    it 'e com sucesso' do
        #Arrange
        #Act
        visit root_path
        click_on 'Cadastrar Galpão'
        fill_in 'Nome', with: 'Rio de Janeiro'
        fill_in 'Descrição', with: 'Galpão da Zona Portuária do Rio'
        fill_in 'Código', with: 'RIO'
        fill_in 'Endereço', with: 'Avenida do Museu do Amanhã, 1000'
        fill_in 'Cidade', with: 'Rio de Janeiro'
        fill_in 'CEP', with: '20100-000'
        fill_in 'Área', with: '32000'
        click_on 'Enviar'
        
        #Assert
        expect(current_path).to eq root_path
        expect(page).to have_content 'Galpão Cadastrado com Sucesso'
        expect(page).to have_content 'Rio de Janeiro'
        expect(page).to have_content 'RIO'
        expect(page).to have_content '32000 m2'

    end
    it 'com dados incompletos' do
        #Arrange
        #Act
        visit(root_path)
        click_on('Cadastrar Galpão')
        fill_in 'Nome', with: ''
        fill_in 'Descrição', with: ''
        fill_in 'Código', with: ''
        fill_in 'Endereço', with: ''
        fill_in 'Cidade', with: ''
        fill_in 'CEP', with: ''
        fill_in 'Área', with: ''
        click_on('Enviar')
        #Assert
        expect(page).to have_content 'Galpão não Cadastrado!'
        
    end
end