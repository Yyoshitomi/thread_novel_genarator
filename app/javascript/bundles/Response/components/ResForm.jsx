import React, { useState } from 'react';
import { Formik } from "formik";
import Form from 'react-bootstrap/Form'
import FormControl from 'react-bootstrap/FormControl'
import InputGroup from 'react-bootstrap/InputGroup'
import Col from 'react-bootstrap/Col'
import Button from 'react-bootstrap/Button'
import Dropdown from 'react-bootstrap/Dropdown'
import moment from "moment";

const defaultDate = moment().format("YYYY-MM-DD hh:mm:ss")

const ResForm = ({ threadConfig }) => {

  console.log(threadConfig)

  return (
    
    <Formik
      initialValues={{
        number: threadConfig.defaultId,
        name: threadConfig.defaultName,
        date: defaultDate,
        id : ''
      }}
      onSubmit={async values => {alert(JSON.stringify(values, null, 2));}}
      render={(props) => (
        <Form onSubmit={props.handleSubmit}>
          <Form.Row>
            <Form.Group as={Col} md="2">
              <Form.Label>レス番</Form.Label>
              <FormControl
                type="text"
                name="number"
                value={props.values.number}
                onChange={props.handleChange}
              />
            </Form.Group>

            <Form.Group as={Col} md="6">
              <Form.Label>名前</Form.Label>
              <FormControl
                type="text"
                name="name"
                value={props.values.name}
                onChange={props.handleChange}
              />
            </Form.Group>
            <Form.Group as={Col} md="4">
              <Dropdown>
                <Dropdown.Toggle className="mt-4" variant="success" id="dropdown-basic">
                  固定ハンドルネーム
                </Dropdown.Toggle>
                <Dropdown.Menu>
                  <Dropdown.Item href="#">既存のコテハン</Dropdown.Item>
                </Dropdown.Menu>
              </Dropdown>
            </Form.Group>
          </Form.Row>
          <Form.Row>
          { threadConfig.timeDisplay && (
            <>
              <Form.Group as={Col} md="4">
                <Form.Label>投稿日</Form.Label>
                <FormControl
                  type="text"
                  name="date"
                  value={props.values.date}
                  onChange={props.handleChange}
                />
              </Form.Group>
              <Form.Group as={Col} md="2">
                <Form.Check
                  className="mt-5"
                  type="checkbox"
                  name="date_mojibake"
                  checked={props.values.check}
                  // onPress={() => setFieldValue('check', !values.check)}
                  label="文字化け"
                />
              </Form.Group>
            </>) }

            <Form.Group as={Col} md="4">
              <Form.Label>ID</Form.Label>
              <FormControl
                type="text"
                name="ch_id"
                value={props.values.ch_id}
                onChange={props.handleChange}
              />
            </Form.Group>
            <Form.Group as={Col} md="2">
              <Form.Check
                className="mt-5"
                type="checkbox"
                name="chId_mojibake"
                checked={props.values.check}
                // onPress={() => setFieldValue('check', !values.check)}
                label="文字化け"
              />
            </Form.Group>
          </Form.Row>

          <Form.Row>
            <Form.Group as={Col}>
              <Form.Control
                as="textarea"
                name="honbun"
                value={props.values.honbun}
                onChange={props.handleChange}
                rows="3"
                placeholder="本文を入力してください"
              />
            </Form.Group>
          </Form.Row>

          <Button className="float-right" type="submit">投稿する</Button>
        </Form>
      )}
    />
  );
};

export default ResForm;