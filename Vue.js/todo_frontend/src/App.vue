<template>
  <div id="app">
    <TodoHeader></TodoHeader>
    <TodoInput @add-todo="addTodo"></TodoInput>
    <TodoList @remove="remove" :propsItems="todoItems"></TodoList>
    <TodoFooter @remove-all="removeAll"></TodoFooter>
    
  </div>
</template>

<script>
import TodoHeader from './component/TodoHeader.vue'
import TodoInput from './component/TodoInput.vue'
import TodoList from './component/TodoList.vue'
import TodoFooter from './component/TodoFooter.vue'

export default {
  name: 'app',
  data () {
    return {
      todoItems: []
    }
  },
  created() {
    this.$http.get('http://localhost:8000/api/todos/').then((res) => {
      this.getTodoList()
    })
  },
  methods: {
    getTodoList() {
      this.$http.get('http://localhost:8000/api/todos/').then((res) => {
        if (res.data !== null && res.data.length !==0) {
          this.todoItems = res.data
        } else {
          this.todoItems = []
        }
      })
    },
    addTodo() {
      this.getTodoList()
    },
    remove(todo) {
      this.getTodoList()
    },
    removeAll() {
      this.getTodoList()
    }
  },
  components: {
    "TodoHeader": TodoHeader,
    "TodoInput": TodoInput,
    "TodoList": TodoList,
    "TodoFooter": TodoFooter
  }
}
</script>

<style>
  body {
    text-align: center;
    background: #f6f6f8;
  }

  input {
    border-style: groove;
    width: 200px;
  }

  button {
    border-style: groove;
  }

  .shadow {
    box-shadow: 5px 10px 10px rgba(0,0,0,0.03)
  }
</style>