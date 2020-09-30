class Mojibake

  def self.initialize(s) 
    s.split('').shuffle[0..12].join
  end

  def self.generate
    moji = "縺ゅ＞�∴縺撰托抵ゑｽｸｹｺｱｲｳｴｵｧｨｩｪ繧譁ｭ怜喧縺代ヱｿｼ繝讖溯ｻ遐皮ｶ樞包搾｡繹ｱ竭竇"
    initialize(moji)
  end
end