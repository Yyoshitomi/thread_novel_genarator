class Topic < ApplicationRecord
  validates :title,        presence: true, length: { maximum: 100 }
  validates :default_name, presence: true, length: { maximum: 100 }
  validates :time_display, inclusion: { in: [true, false] }
  validates :start_date,   length: { maximum: 30 }

  def corrupt_start_date
    self.start_date = "縺ゅ＞縺翫≧縺医♀"
  end


  after_initialize :set_default_values

    private

    def set_default_values
      self.default_name ||= '名無しさん'
      if time_display?
        self.start_date ||= Time.now.strftime("%F %T")
      else
        self.start_date = nil
      end
    end
end