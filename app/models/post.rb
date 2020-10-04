class Post < ApplicationRecord

  belongs_to :topic

  validates :topic,  presence: true
  validates :name,   presence: true, length: { maximum: 100 }
  validates :honbun, presence: true, length: { maximum: 5000 }
  validates :number, presence: true, numericality: { only_interger: true, less_than_or_equal_to: 1100 } 
  validates :date,   length: { maximum: 30 }


  def default_resnum
    pre_res = topic.posts.last
    if pre_res
      pre_res.number + 1
    else
      1
    end
  end

  def date_generator
    if generate_date
      Time.now.strftime("%F %T")
    else
      Mojibake.generate()
    end
  end

  def id_generator
    if generate_id
      SecureRandom.base64[0, 12]
    else
      Mojibake.generate
    end
  end

  after_initialize :set_default_values

    def set_default_values
      self.name ||= topic.default_name

      if number == nil
        self.number ||= default_resnum
      end

      if on_id == true
        self.ch_id ||= id_generator
      else on_id == false
        self.ch_id = nil
      end

      if topic.time_display?
        self.date ||= date_generator
      else
        self.date = nil
      end
    end
end