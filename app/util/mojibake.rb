class Mojibake

  def self.generate(length = 13)
    "縺ゅ＞�∴縺撰托抵ゑｽｸｹｺｱｲｳｴｵｧｨｩｪ繧譁ｭ怜喧縺代ヱｿｼ繝讖溯ｻ遐皮ｶ樞包搾｡繹ｱ竭竇"
      .split('').shuffle[0..length-1].join
  end

end