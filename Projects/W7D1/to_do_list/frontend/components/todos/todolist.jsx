import React from "react";
import TodoListItem from './todolist_item';
import TodoListForm from './todo_form';

module.exports = (props) => (
  <ul>
    <TodoListItem todos={props.todos}/>
    <TodoListForm receiveTodo={props.receiveTodo} />
  </ul>
);
