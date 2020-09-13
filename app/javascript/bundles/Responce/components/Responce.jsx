import PropTypes from 'prop-types';
import React, { useState } from 'react';

const Responce = (props) => {
  const [name, setName] = useState(props.name);

  return (
    <ul class="list-group">
      <li class="list-group-item">
        <b>
          9 名前：本当にあった怖い名無し 投稿日：2008/05/19(月) 15:49:43 ID:NANtEKit0
        </b>
        <p>
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
        </p>
      </ li >
      <li class="list-group-item">
        <b>
          9 名前：本当にあった怖い名無し 投稿日：2008/05/19(月) 15:49:43 ID:NANtEKit0
        </b>
        <p>
          春休みに入ったばかりのこと、いい天気に誘われてじいちゃんの家にバイクで行った。
          まだ寒かったけど、広縁はぽかぽかと気持ちよく、そこでしばらく寛いでいた。そうしたら、
          「ぽぽ、ぽぽっぽ、「破ぁーーーーーー！！」
          掛け声と共にＴさんの両手から青白い閃光が飛び出し、何かを粉々に打ち砕きました。
          寺生まれってスゴイ、改めてそう思いました。
        </p>
      </ li >
    </ul >
  );
};

Responce.propTypes = {
  name: PropTypes.string.isRequired, // this is passed from the Rails view
};

export default Responce;
