import React from 'react';

module.exports = (todos) => {
  return todos.todos.map((item) => <li key={item.id}>{item.title}</li>);
};
