require 'rails_helper'

MOJI =  "縺ゅ＞�∴縺撰托抵ゑｽｸｹｺｱｲｳｴｵｧｨｩｪ繧譁ｭ怜喧縺代ヱｿｼ繝讖溯ｻ遐皮ｶ樞包搾｡繹ｱ竭竇"

RSpec.describe Topic, type: :model do
  it "スレタイ(title)、名無し(default_name)があれば有効" do
    topic = Topic.new(
      title: "スレタイ",
      default_name: "名無しさん"
    )

    expect(topic).to be_valid
  end

  it "スレタイがなければ不正" do
    topic = Topic.new(title: nil)
    topic.valid?

    expect(topic.errors[:title]).to include("can't be blank")
  end

  it "デフォルトネームが未入力の場合、名前が「名無しさん」で登録される" do
    topic = Topic.new(default_name: nil)

    expect(topic.default_name).to eq "名無しさん"
  end

  it "デフォルトネームに「名無しさん」以外の名前で登録できる" do
    topic = Topic.new(default_name: "まさよし")

    expect(topic.default_name).to eq "まさよし"
  end

end