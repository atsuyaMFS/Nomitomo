class PostController < ApplicationController
  def index
  end

  def show
  end

  def new
    @post=Post.new
  end
  
  def create
    @model_class_name = ModelClassName.new(params[:model_class_name])
  
    respond_to do |wants|
      if @model_class_name.save
        flash[:notice] = 'ModelClassName was successfully created.'
        wants.html { redirect_to(@model_class_name) }
        wants.xml  { render :xml => @model_class_name, :status => :created, :location => @model_class_name }
      else
        wants.html { render :action => "new" }
        wants.xml  { render :xml => @model_class_name.errors, :status => :unprocessable_entity }
      end
    end
  end

  def edit
  end
  
  private
  def post_params
    params.require(:post).permit(:title,:category,:body)
  end
  
end
