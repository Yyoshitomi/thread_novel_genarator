require 'rails_helper'

RSpec.describe Post, type: :model do

  describe 'レスは必ずスレッドに所属する' do
    # そもそもスレッドがないとレスをnewするのもエラーになるので不要
    # it 'スレッドがないとレスは無効' do
    #   post = Post.new(
    #     name: "名無しさん",
    #     honbun: "今日も空が青い。"
    #   )

    #   post.valid?
    #   expect(post).not_to be_valid
    # end

    it 'スレッドがあるとレスは有効' do
      topic = Topic.create(
        title: "スレタイ",
        default_name: "名無しさん",
        time_display: false,
        start_date: nil
      )

      post = topic.posts.new(
        name: "名無しさん",
        honbun: "今日も空が青い。",
        number: 1
      )

      expect(post).to be_valid
    end
  end

  describe 'name' do
    it "nameを設定しない場合は、topicのデフォルトネームが設定される" do
      topic = Topic.create(
        title: "スレタイ",
        default_name: nil,
        time_display: false
      )

      post = topic.posts.build(
        name: nil
      )

      expect(post.name).to eq "名無しさん"
    end

    it "名前を入力した場合は、デフォルト値ではなく入力した名前が優先される" do
      topic = Topic.create(
        title: "スレタイ",
        default_name: nil,
        time_display: false
      )

      post = topic.posts.build(
        name: "ペレ"
      )

      expect(post.name).to eq "ペレ"
    end
  end

  describe 'honbun' do
    it "本文は未入力の場合無効" do
      topic = Topic.create(
        title: "スレタイ",
        default_name: nil,
        time_display: false
      )

      post = topic.posts.build(
        name: nil,
        honbun: nil
      )

      post.valid?
      expect(post.errors[:honbun]).to include("can't be blank")
    end
  end

  describe 'レス番' do
    context "レス番は未入力の場合、前のレス番に+1される" do
      it "前のレスがない(=1レス目)場合" do
        topic = Topic.create(
          title: "スレタイ",
          default_name: nil,
          time_display: false
        )

        post = topic.posts.create(
          name: nil,
          honbun: "今日も空が青い。",
          number: nil
        )

        expect(post.number).to eq 1
      end

      it "前のレスがある(=2レス目以降)場合" do
        topic = Topic.create(
          title: "スレタイ",
          default_name: nil,
          time_display: false
        )

        post = topic.posts.create(
          name: nil,
          honbun: "1番目のレスです。",
          number: nil
        )

        other_post = topic.posts.build(
          name: nil,
          honbun: "2番目のレスです。",
          number: nil
        )

        expect(other_post.number).to eq 2
      end
    end

    it "レス番は好きな数字を入力できる" do
      topic = Topic.create(
        title: "スレタイ",
        default_name: nil,
        time_display: false
      )

      post = topic.posts.create(
        name: nil,
        honbun: "今日も空が青い。",
        number: 534
      )

      expect(post.number).to eq 534
    end

    it "レス番に好きな数字を入力したあとの次のレスでレス版を未入力にした場合、前のレス番に+1される" do
      topic = Topic.create(
        title: "スレタイ",
        default_name: nil,
        time_display: false
      )

      post = topic.posts.create(
        name: nil,
        honbun: "今日も空が青い。",
        number: 534
      )

      other_post = topic.posts.build(
        name: nil,
        honbun: "2番目のレスです。",
        number: nil
      )

      expect(other_post.number).to eq 535
    end
    
    context "レス番は1-1100まで好きな数字を入力できる" do
      it "レス番に1100まで好きな数字を入力できる" do
        topic = Topic.create(
          title: "スレタイ",
          default_name: nil,
          time_display: false
        )

        post = topic.posts.create(
          name: nil,
          honbun: "今日も空が青い。",
          number: 1100
        )

        expect(post.number).to eq 1100
      end

      it "レス番に1101以上は入力できない" do
        topic = Topic.create(
          title: "スレタイ",
          default_name: nil,
          time_display: false
        )

        post = topic.posts.create(
          name: nil,
          honbun: "今日も空が青い。",
          number: 1101
        )

        expect(post).not_to be_valid
      end
    end

    it  "レス番は数字以外を入力すると無効" do
      topic = Topic.create(
          title: "スレタイ",
          default_name: nil,
          time_display: false
        )

      post = topic.posts.create(
        name: nil,
        honbun: "今日も空が青い。",
        number: "ももんが"
      )

      expect(post).not_to be_valid
    end
  end

  describe '日付' do
    # time_displayがfalseの場合、日付はfalseになる
    # 日付は未入力の場合にデフォルトのTime.nowが登録される
    # 日付はnewした時点ではTime.nowで登録されているが、好きな文字列に書き換えることもできる
  end

  describe 'ID' do
    # ch_idは未入力でも有効
    # ch_idは英数混合の文字列を生成して入力できる
    # ch_idは好きな文字列を入力できる
  end
end
