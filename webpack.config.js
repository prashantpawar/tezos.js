const UglifyJSPlugin = require('uglifyjs-webpack-plugin');

module.exports = {
  entry: './lib/js/src/main_entry.js',
  output: {
    path: __dirname +'/public',
    filename: 'bundle.js',
  },
  plugins: [
    new UglifyJSPlugin()
  ]
};
