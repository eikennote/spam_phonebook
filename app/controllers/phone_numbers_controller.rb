class PhoneNumbersController < ApplicationController
  before_action :set_phone_number, only: %i[ show edit update destroy ]
  before_action :authenticate_user!

  # GET /phone_numbers or /phone_numbers.json
  def index
    @phone_numbers = PhoneNumber.all
  end

  # GET /phone_numbers/1 or /phone_numbers/1.json
  def show
  end

  # GET /phone_numbers/new
  def new
    @phone_number = PhoneNumber.new
  end

  # GET /phone_numbers/1/edit
  def edit
  end

  # POST /phone_numbers or /phone_numbers.json
  def create
    @phone_number = PhoneNumber.find_by(number: phone_number_params[:number])
    if @phone_number
      @phone_number.increment!(:count)
      redirect_to phone_numbers_path, notice: "既存番号のカウントを更新しました"
    else
      @phone_number = PhoneNumber.new(phone_number_params)
      if @phone_number.save
        redirect_to @phone_number, notice: "電話番号を登録しました"
      else
        render :new, status: :unprocessable_entity
      end
    end
  end

  # PATCH/PUT /phone_numbers/1 or /phone_numbers/1.json
  def update
    respond_to do |format|
      if @phone_number.update(phone_number_params)
        format.html { redirect_to @phone_number, notice: "Phone number was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @phone_number }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @phone_number.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /phone_numbers/1 or /phone_numbers/1.json
  def destroy
    @phone_number.destroy!

    respond_to do |format|
      format.html { redirect_to phone_numbers_path, notice: "Phone number was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_phone_number
      @phone_number = PhoneNumber.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def phone_number_params
      params.expect(phone_number: [ :number, :description, :count ])
    end

    def phone_number_params
      params.require(:phone_number).permit(:number, :description)
    end
end
