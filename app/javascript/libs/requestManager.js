import axios from 'axios';
import ReactOnRails from 'react-on-rails';

const API_ENTRY_URL = process.env.APP_ENTRY_URL || '/api';

const targetUrl = path => `${API_ENTRY_URL}/${path}`;

export async function fetchEntity(path, param, options = {}) {
  try {
    const url = param ? targetUrl(`${path}/${param}`) : targetUrl(path)
    const response = await axios({
      method: 'GET',
      url,
      responseType: 'JSON',
      headers: ReactOnRails.authenticityHeaders(),
      ...options
    });

    return response.data;
  } catch (error) {
    if (error.response) {
      console.warn('error!', error.response.status, error.data);
    } else {
      console.warn('error', error);
    }
    throw error;
  }
}