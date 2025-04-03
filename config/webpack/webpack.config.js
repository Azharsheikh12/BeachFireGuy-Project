// webpack.config.js

const path = require('path');
const MiniCssExtractPlugin = require('mini-css-extract-plugin');
const mode = process.env.NODE_ENV === 'development' ? 'development' : 'production';

module.exports = {
  mode,
  optimization: {
    moduleIds: 'deterministic',
  },
  entry: {
    application: [
      './app/assets/javascripts/application.js',
      './app/assets/stylesheets/application.scss',
    ],
  },
  module: {
    rules: [
      {
        test: /\.js$/,
        exclude: /node_modules/,
        use: {
          loader: 'babel-loader',
        },
      },
      {
        test: /\.scss$/,
        use: [
          MiniCssExtractPlugin.loader, // Extract CSS into separate files
          'css-loader', // interprets @import and url() like import/require() and resolves them
          'sass-loader', // Compiles Sass to CSS
        ],
      },
    ],
  },
  resolve: {
    extensions: ['.js', '.jsx', '.scss', '.css'],
  },
  plugins: [
    new MiniCssExtractPlugin({
      filename: '[name].css',
    }),
  ],
};


// const path    = require("path")
// const webpack = require("webpack")
// const MiniCssExtractPlugin = require('mini-css-extract-plugin');
// // in this example, entry.custom will create a corresponding empty custom.js file
// const RemoveEmptyScriptsPlugin = require('webpack-remove-empty-scripts')

// module.exports = {
//   mode: "production",
//   devtool: "source-map",
//   entry: {
//     application: ['./app/assets/javascripts/application.js',
//       './app/assets/stylesheets/application.scss',],
//     custom: './app/assets/stylesheets/custom.scss',
//   },
//   output: {
//     filename: "[name].js",
//     sourceMapFilename: "[file].map",
//     path: path.resolve(__dirname, '..', '..', 'app/assets/builds'),
//   },
//   plugins: [
//     new webpack.optimize.LimitChunkCountPlugin({
//       maxChunks: 1
//     })
//   ],
//   module: {
//     rules: [
//        {
//          test: /\.(js|jsx|ts|tsx|)$/,
//          exclude: /node_modules/,
//          use: ['babel-loader'],
//        },
//     ],
//   },
// }


