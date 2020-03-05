class EmailsController < ApplicationController
  def index
    @emails = Email.all
  end

  def create
    @email = Email.new
    puts "*" * 100
    @email = Email.new(object: Faker::Lorem.word , body: Faker::Lorem.paragraphs, read: false)
    if @email.save
    puts "#" * 100
      respond_to do |format|
        format.html { redirect_to emails_path }
        format.js { }
      end

    else 
      redirect_to emails_path
    end

  end

  def show
    @email = Email.find(params[:id])
    respond_to do |format|
      format.html { }
      format.js { }
    end
  end

  def destroy
    @email = Email.find(params[:id])
    @email.destroy
    respond_to do |format|
        format.html { redirect_to emails_path }
        format.js { } 
    end
    
  end

  def update
    @email = Email.find(params[:id])
    puts "*" * 100
    puts params[:read]
    puts "*" * 100
    @email.update(email_params)
    respond_to do |format|
        format.html { redirect_to emails_path }
        format.js { } 
    end
  end

  def edit
  end


  private

  def email_params
    params.permit(:object, :body, :read, :id)
  end

end
