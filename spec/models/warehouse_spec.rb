require 'rails_helper'

RSpec.describe Warehouse, type: :model do
    describe '#is valid?' do
        context 'presence' do
            it 'false when name is empty' do
                #Arrange
                    warehouse=Warehouse.new(name:'', code:'RIO', adress:'Endereço', cep: '25000-000',
                                        city: 'Rio', area: 1000, description:'Alguma Descrição')
                #Act
                    result=warehouse.valid?
                #Assert
                    expect(result).to eq(false)
            end
            it 'false when code is empty' do
                #Arrange
                    warehouse=Warehouse.new(name:'name', code:'', adress:'Endereço', cep: '25000-000',
                                        city: 'Rio', area: 1000, description:'Alguma Descrição')
                #Act
                    result=warehouse.valid?
                #Assert
                    expect(result).to eq(false)
            end
            it 'false when adress is empty' do
                #Arrange
                    warehouse=Warehouse.new(name:'name', code:'code', adress:'adress', cep: '25000-000',
                                        city: 'Rio', area: 1000, description:'Alguma Descrição')
                #Act
                    result=warehouse.valid?
                #Assert
                    expect(result).to eq(false)
            end
            it 'false when cep is empty' do
                #Arrange
                    warehouse=Warehouse.new(name:'name', code:'code', adress:'adress', cep: '',
                                        city: 'Rio', area: 1000, description:'Alguma Descrição')
                #Act
                    result=warehouse.valid?
                #Assert
                    expect(result).to eq(false)
            end
            it 'false when city is empty' do
                #Arrange
                    warehouse=Warehouse.new(name:'name', code:'code', adress:'adress', cep: 'cep',
                                        city: '', area: 1000, description:'Alguma Descrição')
                #Act
                    result=warehouse.valid?
                #Assert
                    expect(result).to eq(false)
            end
            it 'false when area is empty' do
                #Arrange
                    warehouse=Warehouse.new(name:'name', code:'code', adress:'adress', cep: 'cep',
                                        city: 'city', area: nil , description:'Alguma Descrição')
                #Act
                    result=warehouse.valid?
                #Assert
                    expect(result).to eq(false)
            end
            it 'false when description is empty' do
                #Arrange
                    warehouse=Warehouse.new(name:'name', code:'code', adress:'adress', cep: 'cep',
                                        city: 'city', area: 1000 , description:'')
                #Act
                    result=warehouse.valid?
                #Assert
                    expect(result).to eq(false)
            end
            it 'false when fields are empty' do
                #Arrange
                    warehouse=Warehouse.new(name:'', code:'', adress:'', cep: '',
                                        city: '', area: nil , description:'')
                #Act
                    result=warehouse.valid?
                #Assert
                    expect(result).to eq(false)
            end
            it 'true when fields are full' do
                #Arrange
                    warehouse=Warehouse.new(name:'name', code:'123', adress:'adress', cep: 'cep',
                                        city: 'city', area: 8000 , description:'description')
                #Act
                    result=warehouse.valid?
                #Assert
                    expect(result).to eq(true)
            end
        end
        context 'length code' do    
            it 'The code has 3 characters for strings greater than 3' do
                #Arrange
                    warehouse=Warehouse.new(name:'name', code:'1234', adress:'adress', cep: 'cep',
                                        city: 'city', area: 8000 , description:'description')
                #Act
                    result=warehouse.valid?
                #Assert
                    expect(result).to eq(false)
            end
            it 'The code has 3 characters for strings smaller than 3' do
                #Arrange
                    warehouse=Warehouse.new(name:'name', code:'12', adress:'adress', cep: 'cep',
                                        city: 'city', area: 8000 , description:'description')
                #Act
                    result=warehouse.valid?
                #Assert
                    expect(result).to eq(false)
            end
            it 'The code has 3 characters for strings equal to 3' do
                #Arrange
                    warehouse=Warehouse.new(name:'name', code:'123', adress:'adress', cep: 'cep',
                                        city: 'city', area: 8000 , description:'description')
                #Act
                    result=warehouse.valid?
                #Assert
                    expect(result).to eq(true)
            end
        end
        context 'uniqueness' do
            it 'The code has 3 characters for strings equal to 3' do
                #Arrange
                    first_warehouse=Warehouse.create(name:'name1', code:'123', adress:'adress1', cep: 'cep1',
                                        city: 'city1', area: 80001 , description:'description1')
                    second_warehouse=Warehouse.new(name:'name2', code:'123', adress:'adress2', cep: 'cep2',
                                            city: 'city2', area: 80002 , description:'description2')  
                #Act
                    result=second_warehouse.valid?
                #Assert
                    expect(result).to eq(false)
            end
        end
    end    
end
