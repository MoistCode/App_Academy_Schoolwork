import { allTodos } from "../../reducers/selectors";
import { receiveTodo } from "../../actions/todo_actions";
import todoList from "./todolist";
import { connect } from "react-redux";

const mapStateToProps = (state) => ({
  todos: allTodos(state)
});

const mapDispatchToProps = (dispatch) => ({
  receiveTodo: (todo) => dispatch(receiveTodo(todo))
});

export default connect(
  mapStateToProps,
  mapDispatchToProps)(todoList);
