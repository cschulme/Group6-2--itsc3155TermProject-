class TagsController < ApplicationController
    def index
        @tags = Tag.all
        
        if Tag.count == 0
           Tag.create(:tagName => "General", :description => "This is the default tag for your events.")
        end
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
        # Find the tag.
        @tag = Tag.find(params[:id])
        
        # Make sure the General tag can't be maliciously destroyed.
        if @tag.id == 1
           redirect_to tags_path 
        end
        
        # Assign any events associated to the delete tag to the General tag.
        @tagEvents = Tag.find(params[:id]).events
        @tagEvents.update(:tag_id => 1)
        
        # Destroy the tag.
        @tag.destroy
        
        redirect_to tags_path
    end
end

private
    def tag_params
       params.require(:tag).permit(:tagName, :description) 
    end
