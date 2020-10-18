import React, { useState, useEffect } from 'react';
import { useFormik } from 'formik';
import Form from 'react-bootstrap/Form'
import FormControl from 'react-bootstrap/FormControl'
import InputGroup from 'react-bootstrap/InputGroup'
import Col from 'react-bootstrap/Col'
import Button from 'react-bootstrap/Button'
import Dropdown from 'react-bootstrap/Dropdown'
import moment from "moment";
import Card from 'react-bootstrap/Card'

import { fetchEntity, postEntity } from "../../../libs/requestManager";

const defaultDate = moment().format("YYYY-MM-DD hh:mm:ss")

const getRandomId = async () =>  await fetchEntity('topics', 'generate_id');
const postValues = async values => await postEntity('posts', values);

const ResForm = ({ threadConfig }) => {
  const [initialValues, setInitialValues] = useState(
      {
        number: '',
        name: threadConfig.defaultName,
        date: defaultDate,
        ch_id: threadConfig.defaultID,
        honbun: '',
        timeDisplay: threadConfig.timeDisplay
      }
    )

  // Post後にデフォルト値を入れ直す。
  // TODO: EffectのイベントフックにPOSTを指定する
  useEffect(() => {
    return async() => setInitialValues({
      name: threadConfig.defaultName,
      date: defaultDate,
      ch_id: await getRandomId(),
      timeDisplay: threadConfig.timeDisplay
    })
  }, [])

  const formik = useFormik({
    initialValues,
    onSubmit: postValues})

    return (
      <Card body>
        <Form onSubmit={formik.handleSubmit}>
          <Form.Row>
            <Form.Group as={Col} md="2">
              <Form.Label>レス番</Form.Label>
              <FormControl
                type="text"
                name="number"
                value={formik.values.number}
                onChange={formik.handleChange}
              />
            </Form.Group>

            <Form.Group as={Col} md="6">
              <Form.Label>名前</Form.Label>
              <FormControl
                type="text"
                name="name"
                value={formik.values.name}
                onChange={formik.handleChange}
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
            {formik.initialValues.timeDisplay && (
              <>
                <Form.Group as={Col} md="4">
                  <Form.Label>投稿日</Form.Label>
                  <FormControl
                    type="text"
                    name="date"
                    value={formik.values.date}
                    onChange={formik.handleChange}
                  />
                </Form.Group>
                <Form.Group as={Col} md="2">
                  <Form.Check
                    className="mt-5"
                    type="checkbox"
                    name="date_mojibake"
                    checked={formik.values.check}
                    // onPress={() => setFieldValue('check', !values.check)}
                    label="文字化け"
                  />
                </Form.Group>
              </>)}

            <Form.Group as={Col} md="4">
              <Form.Label>ID</Form.Label>
              <FormControl
                type="text"
                name="ch_id"
                value={formik.values.ch_id}
                onChange={formik.handleChange}
              />
            </Form.Group>
            <Form.Group as={Col} md="2">
              <Form.Check
                className="mt-5"
                type="checkbox"
                name="chId_mojibake"
                checked={formik.values.check}
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
                value={formik.values.honbun}
                onChange={formik.handleChange}
                rows="3"
                placeholder="本文を入力してください"
              />
            </Form.Group>
          </Form.Row>

          <Button className="float-right" type="submit">投稿する</Button>
        </Form>
      </Card>
  );
};

export default ResForm;