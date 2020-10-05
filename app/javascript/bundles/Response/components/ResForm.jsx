import React from 'react';
import Form from 'react-bootstrap/Form'
import InputGroup from 'react-bootstrap/InputGroup'

const ResForm = ({ }) => {

  return (
    <Form>
      <Row className="mb-3">
        <Col sm="4">
          <InputGroup>
            <InputGroup.Prepend>
              <InputGroup.Text id="basic-addon1">レス番</InputGroup.Text>
            </InputGroup.Prepend>
            <FormControl
              placeholder="デフォルト値"
              aria-label="Username"
              aria-describedby="basic-addon1"
            />
          </InputGroup>
        </Col>

        <Col sm="8">
          <InputGroup>
            <DropdownButton
              as={InputGroup.Prepend}
              variant="outline-secondary"
              title="名前"
              id="input-group-dropdown-name"
            >
              <Dropdown.Item href="#">デフォルトネーム</Dropdown.Item>
              <Dropdown.Item href="#">自由入力</Dropdown.Item>
              <Dropdown.Item href="#">ハンドルネーム</Dropdown.Item>
            </DropdownButton>
            <Form.Control
              type="password"
              placeholder="デフォルト値。ハンドルネームを洗濯するとドロップボタン化"
            />
          </InputGroup>
        </Col>
      </Row>

      <Row className="mb-3">
        <Col sm="5">
          <InputGroup>
            <Form.Control type="id" placeholder="投稿日: デフォルト値" />
            <InputGroup.Append>
              <InputGroup.Text id="generate_id">文字化け</InputGroup.Text>
              <InputGroup.Checkbox />
            </InputGroup.Append>
          </InputGroup>
        </Col>

        <Col sm="7">
          <InputGroup>
            <InputGroup.Prepend>
              <InputGroup.Text id="on_id">id表示</InputGroup.Text>
              <InputGroup.Checkbox />
            </InputGroup.Prepend>
            <Form.Control type="id" placeholder="ID: デフォルト値" />
            <InputGroup.Append>
              <InputGroup.Text id="generate_id">文字化け</InputGroup.Text>
              <InputGroup.Checkbox />
            </InputGroup.Append>
          </InputGroup>
        </Col>
      </Row>

      <Form.Group controlId="honbun">
        <Form.Control as="textarea" rows="3" placeholder="本文を入力してください" />
      </Form.Group>
    </Form>
  );
};

export default ResForm;