class Warehouse < ApplicationRecord
    validates :name, :code, :description, :city, :area, :adress, :cep, presence: true
    validates :code, length:{is:3}
    validates :code, uniqueness:true
    
    #validates atributos, tipo_da_validacao: true
    
end
