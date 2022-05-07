class WarehousesController < ApplicationController
    def show
        id = params[:id]
        if !Warehouse.all.empty?
            @warehouse=Warehouse.find(id)
        end
        return 'Não foi cadastrado'
    end
    def new
        @warehouse=Warehouse.new()
    end

    def create
        warehouse_params=params.require(:warehouse).permit(:name, :code, 
                                        :city, :description, :cep, :area, :adress) 
        @warehouse = Warehouse.new(warehouse_params)
        if @warehouse.save()
        #flash[:notice]="Galpão Cadastrado com Sucesso!"
            redirect_to root_path, notice: 'Galpão Cadastrado com Sucesso!'
        else 
            flash.now[:notice] = 'Galpão não Cadastrado!'
            render 'new'
        end       
    end
end