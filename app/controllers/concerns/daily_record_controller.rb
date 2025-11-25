class DailyRecordsController < ApplicationController
  def create
    record = DailyRecords::Create.call!(record_params)
    render json: DailyRecordSerializer.new(record), status: :created
  end

  def index
    records = DailyRecord.all.order(created_at: :desc)
    render json: records.map { |r| DailyRecordSerializer.new(r) }
  end

  private

  def record_params
    params.permit(:type, :time, moneyCounts: [ :unit, :count ])
  end
end
