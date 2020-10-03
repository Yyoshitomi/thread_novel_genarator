require 'mojibake'

MOJI =  "縺ゅ＞�∴縺撰托抵ゑｽｸｹｺｱｲｳｴｵｧｨｩｪ繧譁ｭ怜喧縺代ヱｿｼ繝讖溯ｻ遐皮ｶ樞包搾｡繹ｱ竭竇"

RSpec.describe Mojibake do
  describe 'generate' do
    it '文字化けっぽい文字列が出力されること' do
      mojibake_str = Mojibake.generate
      expect(MOJI.split('').any?{ |t| mojibake_str.include?(t) }).to be_truthy
    end

    it '指定した長さの文字列が作成できること' do
      mojibake_str = Mojibake.generate(5)
      expect(mojibake_str.length).to eq 5
    end

    it '長さが与えられない時は13文字になること' do
      mojibake_str = Mojibake.generate
      expect(mojibake_str.length).to eq 13
    end
  end
end