import ReactOnRails from 'react-on-rails';

import Thread from '../bundles/Response/components/Thread';
import ResForm from '../bundles/Response/components/ResForm';

// This is how react_on_rails can see the HelloWorld in the browser.
ReactOnRails.register({
  Thread,
  ResForm
});
