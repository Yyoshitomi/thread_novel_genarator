import React from 'react'

import ListGroup from 'react-bootstrap/ListGroup'
import Card from 'react-bootstrap/Card'
import Button from 'react-bootstrap/Button'

// import ResForm from './ResForm'
import Response from './Response'


const Thread = ({ topic: { title, posts } }) => {
  // console.log(title)
  // console.log(posts)

  const res = posts.map(({ number, name, date, ch_id, honbun }, index) => {

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
      <Button href="/topics" variant="outline-secondary" className="float-right">戻る</Button>
      </Card>
      <ListGroup variant="flush">{res}</ListGroup>
      <br />
    </>
  );
};


export default Thread;