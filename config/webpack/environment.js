const { environment } = require('@rails/webpacker')
const webpack = require('webpack')
const erb =  require('./loaders/erb')

environment.loaders.prepend('erb', erb)
environment.plugins.prepend(
  'Provide',
  new webpack.ProvidePlugin({
    $: 'jquery',
    jQuery: 'jquery',
    jquery: 'jquery',
    Popper: ['popper.js', 'default'], // for Bootstrap 4
  })
)

module.exports = environment
