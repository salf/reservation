class TablesController < ApplicationController
  before_action :obtain_table, only: [:edit, :update, :destroy]

  def index
    @tables = Table.all
  end

  def new
    @table = Table.new
  end

  def edit
  end

  def create
    @table = Table.new(table_params)
    if @table.valid?
      @table.save
      flash[:notice] = "Table for #{@table.person_volume} #{'person'.pluralize(@table.person_volume)} was added!"
      redirect_to tables_path
    else
      flash[:alert] = "Table was not added."
      render action: :new
    end
  end

  def update
    if @table.update_attributes(table_params)
      flash[:notice] = "Table updated."
      redirect_to tables_path
    else
      flash[:alert] = "Table was not updated."
      render action: :edit
    end
  end

  def destroy
    if @table.reservations.any?
      flash[:alert] = "Table could not be removed: Please remove reservations first."
    else
      @table.destroy
      flash[:notice] = "Table was removed."
    end
    redirect_to tables_path
  end

  private

  def obtain_table
    @table = Table.find(params[:id])
  end

  def table_params
    params.require(:table).permit(
      :name,
      :person_volume,
      :active,
      :position
    )
  end
end
