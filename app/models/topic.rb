class Topic < ApplicationRecord
  validates :title, presence: true
  validates :default_name, presence: true

  after_initialize :set_default_values

    private

    def set_default_values
      self.default_name ||= '名無しさん'
      # self.start_date ||= Time.zone.today
    end
end