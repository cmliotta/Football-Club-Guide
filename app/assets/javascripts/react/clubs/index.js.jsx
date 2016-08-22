debugger
var HelloWorld = React.createClass({
  render: function() {
    return (
      <div className='HelloWorld'>
        Hello, world!
      </div>
    );
  }
});

var ready = function () {
  React.renderComponent(
    <HelloWorld />,
  );
};

$(document).ready(ready);