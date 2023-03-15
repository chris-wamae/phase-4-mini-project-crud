class SpicesController < ApplicationController
    wrap_parameters format: []
def index
spices = Spice.all
render json: spices
end

def create 
new_spice = Spice.create(allow_params)
render json: new_spice,status:201
end

def update 
update_spice = params_id
update_spice.update(allow_params)
render json: update_spice
end

def destroy
delete_spice = params_id
delete_spice.destroy
end

def params_id
    Spice.find_by(id:params[:id])
end 

def throw_error
    render json: {error: "Not found"}, status: :not_found
end
private 

def allow_params
    params.permit(:title,:image,:description,:notes,:rating)
end

end
