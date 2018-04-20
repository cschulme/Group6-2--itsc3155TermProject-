class TagsController < ApplicationController
    def index
        @tags = Tag.all 
    end
    
    def show
        @tag = Tag.find(params[:id])
    end
    
    def new
        @tag = Tag.new
    end
    
    def create
        @tag = Tag.new(tag_params)
       
        if @tag.save
            redirect_to @tag
        else
            render 'new'
        end
    end
    
    def edit
        @tag = Tag.find(params[:id])
    end
    
    def update
        @tag = Tag.find(params[:id])
        
        if @tag.update(tag_params)
            redirect_to @tag
        else
            render 'edit'
        end
    end
    
    def destroy
        @tagEvents = Tag.find(params[:id]).events
        @tagEvents.update(:tag_id => 1)
        @tag = Tag.find(params[:id])
        @tag.destroy
        
        redirect_to tags_path
    end
end

private
    def tag_params
       params.require(:tag).permit(:tagName, :description) 
    end
