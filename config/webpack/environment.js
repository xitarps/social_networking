const { environment } = require('@rails/webpacker')

//needed to use jquery in comments
const webpack = require('webpack')

environment.plugins.prepend('Provide',
  new webpack.ProvidePlugin({
    $: 'jquery/src/jquery',
    jQuery: 'jquery/src/jquery'
  })
)
//ends here

module.exports = environment
