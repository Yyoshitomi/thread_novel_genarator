class Post < ApplicationRecord

  belongs_to :topic

  validates :topic,  presence: true
  validates :name,   presence: true, length: { maximum: 100 }
  validates :honbun, presence: true, length: { maximum: 5000 }
  validates :number, presence: true, numericality: { only_interger: true, less_than_or_equal_to: 1100 } 


  def default_resnum
    pre_res = topic.posts.last
    if pre_res
      pre_res.number + 1
    else
      1
    end
  end

  def id_generator
    if generate_id == true
      SecureRandom.base64[0, 12]
    else generate_id == false
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
    end
end