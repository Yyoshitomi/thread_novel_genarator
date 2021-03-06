topic = Topic.first

  post1 = topic.posts.create do |post|
    post.name = nil
    post.honbun = "今日も空が青い。"
    post.number = nil
    post.date = nil
    post.on_id = true
    post.ch_id = nil
    post.generate_id = true
  end

  post2 = topic.posts.create do |post|
    post.name = "パンナコッタ"
    post.honbun = <<-EOS
                  だが次の瞬間、お守りが眩い光に包まれ、どこからとも無くTさんの声が

                  「破ぁ！！」

                  お守りは光と共に飛び散り、男の半身を吹き飛ばした。
                  「あああああああああ」
                  半身でのたうつ男を尻目に俺は夢から目覚めた
                  枕元にあったはずのお守りはどこをどんなに探しても見つからなかった・・・
                  
                  その話をTさんに話すと
                  「半身を吹き飛ばした？
                  やれやれ、威力は親父の作った奴の半分か・・・」と呟くTさん
                  寺生まれはスゴイ、俺は感動を覚えずにはいられなかった。
  EOS
    post.number = nil
    post.date = nil
    post.on_id = true
    post.ch_id = nil
    post.generate_id = false
  end

  post3 = topic.posts.create do |post|
    post.name = "ナンテコッタ"
    post.honbun = "とっぱらりんのぷぅ"
    post.number = 345
    post.date = nil
    post.generate_date = false
    post.on_id = true
    post.ch_id = nil
    post.generate_id = true
  end

  post4 = topic.posts.create do |post|
    post.name = "項羽"
    post.honbun = "まぢ四面楚歌"
    post.number = nil
    post.date = "2020年10月4日"
    post.on_id = true
    post.ch_id = nil
    post.generate_id = true
  end

topic2 = Topic.second

  post1 = topic2.posts.create do |post|
    post.name = "ツチノコハンターの息子"
    post.honbun = <<-EOS
                  昨日の夜血塗れで帰ってきた親父を問い詰めたら「実は…」とか言って打ち明けられた。
                  なにか質問ある？
  EOS
    post.number = nil
    post.date = nil
    post.on_id = true
    post.ch_id = nil
    post.generate_id = true
  end

  post2 = topic2.posts.create do |post|
    post.name = nil
    post.honbun = "それでお前のカーチャンはあの時助けてもらったチュパカブラってオチ？"
    post.number = nil
    post.date = nil
    post.on_id = true
    post.ch_id = nil
    post.generate_id = true
  end

  post3 = topic2.posts.create do |post|
    post.name = nil
    post.honbun = "楽しそうな家だな。"
    post.number = nil
    post.date = nil
    post.on_id = true
    post.ch_id = nil
    post.generate_id = true
  end