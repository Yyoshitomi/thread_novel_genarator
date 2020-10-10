import PropTypes from 'prop-types';
import React, { useState } from 'react';
import ListGroup from 'react-bootstrap/ListGroup'

const styles = { whiteSpace: 'pre-line' }
const Response = ({ number, name, date, ch_id, honbun}) => {

  return (
    <ListGroup.Item>
      <h5>
        {number} 名前：{name} 投稿日：{date} ID:{ch_id}
      </h5>
      <p style={styles}>
        {honbun}
      </p>
    </ListGroup.Item>
  );
};

Response.propTypes = {
  number: PropTypes.number.isRequired,
  name: PropTypes.string.isRequired,
  date: PropTypes.string,
  ch_id: PropTypes.string.isRequired,
  honbun: PropTypes.string.isRequired
};

Response.defaultProps = {
  date: Date.now().toLocaleString('ja-JP')
}

export default Response;
