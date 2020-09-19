import React from 'react';
import Response from './Response';


const Thread = ({responses}) => {

  console.log(responses)

  const res = responses.map(({number, name, date, ch_id, honbun}) => {

    return (
      <ul>
        <Response
          name={name}
          number={number}
          date={date}
          ch_id={ch_id}
          honbun={honbun}
        />
      </ul>
    );
  });

  return (
    <>
      <h1>寺生まれのTさん</h1>
      <ul>
        {res}
      </ul>
    </>
  );
};


export default Thread;