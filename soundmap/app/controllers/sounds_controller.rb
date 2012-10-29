class SoundsController < ApplicationController
  # GET /sounds
  # GET /sounds.json
  def index
    @sounds = Sound.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @sounds }
    end
  end

  # GET /sounds/1
  # GET /sounds/1.json
  def show
    @sound = Sound.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @sound }
    end
  end

  # GET /sounds/new
  # GET /sounds/new.json
  def new
    @sound = Sound.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @sound }
    end
  end

  # GET /sounds/1/edit
  def edit
    @sound = Sound.find(params[:id])
  end

  # POST /sounds
  # POST /sounds.json
  def create
    @sound = Sound.new(params[:sound])
	Rails.logger.error 'display path in create!!!'
	Rails.logger.error params[:sound][:path]
	Rails.logger.error 'This is the uploadfile from create'	
	Rails.logger.error params[:upload]
	#post = Sound.uploadfile(params[:upload])

    respond_to do |format|
      if @sound.save
        #format.html { redirect_to @sound, :notice => 'Sound was successfully created.' }
        #format.json { render :json => @sound, :status => :created, :location => @sound }
	#format.html { render :action => "new" }
	format.html {render :action => "uploader"}
      else
        format.html { render :action => "new" }
        format.json { render :json => @sound.errors, :status => :unprocessable_entity }
      end
    end
	#post = Sound.save(params[:upload])
	#post = Sound.uploadfile(params[:upload])
  end

  # PUT /sounds/1
  # PUT /sounds/1.json
  def update
    @sound = Sound.find(params[:id])

    respond_to do |format|
      if @sound.update_attributes(params[:sound])
        format.html { redirect_to @sound, :notice => 'Sound was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @sound.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /sounds/1
  # DELETE /sounds/1.json
  def destroy
    @sound = Sound.find(params[:id])
    @sound.destroy

    respond_to do |format|
      format.html { redirect_to sounds_url }
      format.json { head :no_content }
    end
  end

  def uploadFile
	Rails.logger.error 'Display path in uploadFile!!'
	Rails.logger.error params[:upload]
    post = Sound.uploadfile(params[:upload])
    render :text => "File has been uploaded successfully"
  end
end
