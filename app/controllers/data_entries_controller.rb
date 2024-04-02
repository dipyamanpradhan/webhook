class DataEntriesController < ApplicationController
  before_action :verify_params, only: [:create, :update]

  def create
    @data_entry = DataEntry.new(data_entry_params)
    if @data_entry.save
      notify_third_party_api
      render json: @data_entry, status: :created
    else
      render json: @data_entry.errors, status: :unprocessable_entity
    end
  end

  def update
    @data_entry = DataEntry.find(params[:id])
    if @data_entry.update(data_entry_params)
      notify_third_party_api
      render json: @data_entry, status: :ok
    else
      render json: @data_entry.errors, status: :unprocessable_entity
    end
  end

  private

  def data_entry_params
    params.require(:data_entry).permit(:name, :data)
  end

  def verify_params
    render json: { error: 'Missing parameters' }, status: :bad_request if data_entry_params.blank?
  end

  def third_party_api
    WEBHOOK_CONFIG.values.each do |endpoint|
      HTTParty.post(endpoint, body: { name: data_entry.name, data: data_entry.data })
    end
  end
end
