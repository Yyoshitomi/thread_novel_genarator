class Topic < ApplicationRecord
  validates :title,        presence: true, length: { maximum: 100 }
  validates :default_name, presence: true, length: { maximum: 100 }
  validates :time_display, inclusion: { in: [true, false] }
  validates :start_date,   presence: true, length: { maximum: 30 }, if: :time_display?

  def time_display?
    :time_display == true
  end

  # t = Time.now
  # @strTime = t.strftime("%c")

  after_initialize :set_default_values

    private

    def set_default_values
      self.default_name ||= '名無しさん'
      self.start_date ||= Time.now.strftime("%F %T")
    end
end