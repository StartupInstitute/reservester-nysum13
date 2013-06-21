class Test1sController < ApplicationController
  # GET /test1s
  # GET /test1s.json
  def index
    @test1s = Test1.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @test1s }
    end
  end

  # GET /test1s/1
  # GET /test1s/1.json
  def show
    @test1 = Test1.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @test1 }
    end
  end

  # GET /test1s/new
  # GET /test1s/new.json
  def new
    @test1 = Test1.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @test1 }
    end
  end

  # GET /test1s/1/edit
  def edit
    @test1 = Test1.find(params[:id])
  end

  # POST /test1s
  # POST /test1s.json
  def create
    @test1 = Test1.new(params[:test1])

    respond_to do |format|
      if @test1.save
        format.html { redirect_to @test1, notice: 'Test1 was successfully created.' }
        format.json { render json: @test1, status: :created, location: @test1 }
      else
        format.html { render action: "new" }
        format.json { render json: @test1.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /test1s/1
  # PUT /test1s/1.json
  def update
    @test1 = Test1.find(params[:id])

    respond_to do |format|
      if @test1.update_attributes(params[:test1])
        format.html { redirect_to @test1, notice: 'Test1 was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @test1.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /test1s/1
  # DELETE /test1s/1.json
  def destroy
    @test1 = Test1.find(params[:id])
    @test1.destroy

    respond_to do |format|
      format.html { redirect_to test1s_url }
      format.json { head :no_content }
    end
  end
end
