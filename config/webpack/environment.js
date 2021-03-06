const { environment } = require('@rails/webpacker')

const webpack = require('webpack');
// Preventing Babel from transpiling NodeModules packages
environment.loaders.delete('nodeModules');
// Bootstrap 4 has a dependency over jQuery & Popper.js:
environment.plugins.prepend('Provide',
  new webpack.ProvidePlugin({
    $: 'jquery',
    jQuery: 'jquery',
    Popper: ['popper.js', 'default']
  })
);
// found on tutorial, aiming to give some more possibilities with modals
// environment.plugins.prepend('Provide',
//   new webpack.ProvidePlugin({
//     $: 'jquery/src/jquery',
//     jQuery: 'jquery/src/jquery'
//   })
// )
module.exports = environment
