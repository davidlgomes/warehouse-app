class WarehousesController < ApplicationController
    def show
        id = params[:id]
        if !Warehouse.all.empty?
            @warehouse=Warehouse.find(id)
        end
        return 'Não foi cadastrado'
    end
    def new
    
    end

    def create
        warehouse_params=params.require(:warehouse).permit(:name, :code, 
                                        :city, :description, :cep, :area) 
        warehouse = Warehouse.new(warehouse_params)
        warehouse.save
        redirect_to root_path
    end
end