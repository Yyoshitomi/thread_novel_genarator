import React from 'react';
import Response from './Response';
import ListGroup from 'react-bootstrap/ListGroup'
import Card from 'react-bootstrap/Card'

const Thread = ({responses}) => {

  const res = responses.map(({number, name, date, ch_id, honbun}, index) => {

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
        <h2>寺生まれのTさん</h2>
      </Card>
      <ListGroup variant="flush">
        {res}
      </ListGroup>
    </>
  );
};


export default Thread;