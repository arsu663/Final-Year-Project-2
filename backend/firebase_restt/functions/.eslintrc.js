module.exports = {
  env: {
    es6: true,
    node: true,
  },
  extends: [
    'eslint:recommended',
    'google',
  ],
  rules: {
    'new-cap': 0,
    'linebreak-style': ['error', 'windows'],
    'quotes': [2, 'single'],
    'require-jsdoc': 0,
    'max-len': ['error', {'code': 220}],
    'no-unused-vars': 'off',
  },
  parserOptions: {
    'parser': 'babel-eslint',
    'ecmaVersion': 2018,
    'sourceType': 'module',
  },

};
