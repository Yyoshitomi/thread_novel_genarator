import React from 'react';
import Response from './Response';
import ListGroup from 'react-bootstrap/ListGroup'
import Card from 'react-bootstrap/Card'

const Thread = ({ topic: { title, posts} }) => {
  // console.log(title)
  // console.log(posts)

  const res = posts.map(({ number, name, date, ch_id, honbun}, index) => {

    return (
      <Response key={index}
        name={name}
        number={number}
        date={date}
        ch_id={ch_id}
        honbun={honbun}
      />
    );
  });

  return (
    <>
      <Card body>
      <h2>{title}</h2>
      </Card>
      <ListGroup variant="flush">
        {res}
      </ListGroup>
    </>
  );
};


export default Thread;