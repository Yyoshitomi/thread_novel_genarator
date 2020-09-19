import PropTypes from 'prop-types';
import React, { useState } from 'react';
import { Card } from 'react-bootstrap';


const Responce = ({number, name, date, ch_id, honbun}) => {
  

  return (
    <Card>
      <Card.Body>
        <Card.Title>
          {number} 名前：{name} 投稿日：{date} ID:{ch_id}
        </Card.Title>
        <Card.Text>
          {honbun}
        </Card.Text>
      </Card.Body>
    </Card>
  );
};

Responce.propTypes = {
  number: PropTypes.number.isRequired,
  name: PropTypes.string.isRequired,
  date: PropTypes.string.isRequired,
  ch_id: PropTypes.string.isRequired,
  honbun: PropTypes.string.isRequired
};

export default Responce;
