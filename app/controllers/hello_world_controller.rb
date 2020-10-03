# frozen_string_literal: true

class HelloWorldController < ApplicationController

  def index
#     honbun =<<-EOS
#           だが次の瞬間、お守りが眩い光に包まれ、どこからとも無くTさんの声が

#           「破ぁ！！」

#           お守りは光と共に飛び散り、男の半身を吹き飛ばした。
#           「あああああああああ」
#           半身でのたうつ男を尻目に俺は夢から目覚めた
#           枕元にあったはずのお守りはどこをどんなに探しても見つからなかった・・・
          
#           その話をTさんに話すと
#           「半身を吹き飛ばした？
#           やれやれ、威力は親父の作った奴の半分か・・・」と呟くTさん
#           寺生まれはスゴイ、俺は感動を覚えずにはいられなかった。
# EOS

    @hello_world_props = {
      responses: [{ 
          name: "本当にあった怖い名無し",
          number: 108,
          date: "2008/05/19(月) 15:49:43",
          ch_id: "NANtEKit0",
          honbun: honbun
        },
        { 
          name: "本当にあった怖い名無し",
          number: 108,
          date: "2008/05/19(月) 15:49:43",
          ch_id: "NANtEKit0",
          honbun: honbun
        }]
      }
  end

  def test
  end
end
