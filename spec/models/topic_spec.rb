require 'rails_helper'

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
    topic.valid?
    expect(topic.default_name).to eq "名無しさん"
  end

  it "デフォルトネームに「名無しさん」以外の名前で登録できる" do
    topic = Topic.new(default_name: "まさよし")
    expect(topic.default_name).to eq "まさよし"
  end

  it "日時を表示させなくても有効" do
    topic = Topic.new(
    title: "スレタイ",
    default_name: "名無しさん",
    time_display: false
    )

    expect(topic).to be_valid
  end

  # it "日時を表示させる場合、start_dateがなければ不正" do
  #   topic = Topic.new(
  #   title: "スレタイ",
  #   default_name: "名無しさん",
  #   time_display: true,
  #   start_date: nil
  #   )

  #   expect(topic).not_to be_valid
  # end
end