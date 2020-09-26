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

    expect(topic.default_name).to eq "名無しさん"
  end

  it "デフォルトネームに「名無しさん」以外の名前で登録できる" do
    topic = Topic.new(default_name: "まさよし")

    expect(topic.default_name).to eq "まさよし"
  end

  # it "日時を入力しなくても有効" do
  #   topic = Topic.new(
  #   title: "スレタイ",
  #   default_name: "名無しさん",
  #   time_display: false,
  #   start_date: nil
  #   )

  #   expect(topic).to be_valid
  # end

  it "日時を入力すると登録できる" do
    topic = Topic.new(
    title: "スレタイ",
    default_name: "名無しさん",
    time_display: true,
    start_date: "2020/09/27"
    )
    topic.save!

    expect(topic.start_date).to eq "2020/09/27"
  end

  it "日時を表示させる場合、start_dateが未入力だとデフォルトで現在時間を登録する" do
    topic = Topic.new(
    time_display: true,
    start_date: nil
    )

    # Time.nowを"2020-09-27 00:18:02"みたいな文字列で表示させる
    expect(topic.start_date).to eq Time.now.strftime("%F %T")
  end

  xit "time_displayがfalseだとstart_dateはnilになる" do
    topic = Topic.new(
    title: "スレタイ",
    default_name: "名無しさん",
    time_display: false,
    start_date: nil
    )

    expect(topic.start_date).to eq nil
  end
end