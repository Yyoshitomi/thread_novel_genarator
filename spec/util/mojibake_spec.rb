require 'mojibake'

RSpec.describe Mojibake do
  describe 'generate' do
    it '文字化けっぽい文字列が出力されること' do
      moji = "縺ゅ＞�∴縺撰托抵ゑｽｸｹｺｱｲｳｴｵｧｨｩｪ繧譁ｭ怜喧縺代ヱｿｼ繝讖溯ｻ遐皮ｶ樞包搾｡繹ｱ竭竇"
      mojibake_str = Mojibake.generate

      expect(moji.split('').any?{ |t| mojibake_str.include?(t) }).to be_truthy
    end
    
    it '指定した長さの文字列が作成できること'
    it '長さが与えられない時は１３文字になること'
  end
end