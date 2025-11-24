module DailyRecords
  class Create
    def self.call!(params)
      new(params).call!
    end

    def initialize(params)
      @type = params[:type]
      @time = params[:time]
      @money_counts = params[:moneyCounts] || []
    end

    def call!
      raise BadRequestError, "Type required" if @type.blank?
      raise BadRequestError, "Time required" if @time.blank?

      record = DailyRecord.create!(
        type: @type.tr("-", "_"),
        time: @time
      )

      @money_counts.each do |mc|
        next if mc[:count].to_i <= 0

        money = MoneyCount.find_or_create_by!(unit: mc[:unit])

        DailyRecordItem.create!(
          daily_record: record,
          money_count: money,
          count: mc[:count]
        )
      end

      record
    end
  end
end
