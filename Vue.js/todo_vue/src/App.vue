<template>
  <div id="app">
   <TodoHeader></TodoHeader> 
   <TodoInput @add-todo="addTodo"></TodoInput>
   <TodoList @remove-todo="removeTodo" :propsItems="todoItems"></TodoList>
   <TodoFooter @clear-todo="clearTodo"></TodoFooter>
  </div>
</template>

<script>
import TodoHeader from "./components/TodoHeader.vue"
import TodoInput from "./components/TodoInput.vue"
import TodoList from "./components/TodoList.vue"
import TodoFooter from "./components/TodoFooter.vue"

export default {
  data() {
        return {
            todoItems: []
        }
    },
    firestore() {
      return {
        todoItems: this.firestore.collection('todos').orderBy('createAt')
      }
    },
  // created() {
  //     if (localStorage.length > 0) {
  //         for (var i=0; i<localStorage.length; i++) {
  //             var key = localStorage.key(i)
  //             if (key !=='loglevel:webpack-dev-server') {
  //                 this.todoItems.push(key)
  //             }
  //         }
  //     }
  // },
  methods: {
      // addTodo(value) {
      //   this.firestore.collection('todos').add({
      //     todo: value,
      //     createAt: new Date()
      //   })

      // 중복값 방지
        addTodo(value) {
          this.firestore.collection('todos').where('todo', '==', value).get().then(
            (snapshot) => {
              if (snapshot.empty) {
                this.firestore.collection('todos').add({
                  todo: value,
                  createAt: new Date()
                })
              }
            }
          )
          
          // .add({
          //   todo: value,
          //   createAt: new Date()
          // })

        // // 중복값이 입력되는 것을 방지
        // if (!this.todoItems.includes(value)) {
        //   localStorage.setItem(value,value)
        //   // key-value 형식이므로 하나는 key, 하나는 value
        //   // Local Storage는 크롬개발자도구의 Application에서 확인할 수 있음
        //   this.todoItems.push(value) 
        //   }
      },
      
      removeTodo(key, index) {
        this.firestore.collection('todos').doc(key['.key']).delete()
        // localStorage.removeItem(key)
        // this.todoItems.splice(index,1)
        // 한 개 지울 것
        },
      clearTodo() {
          this.firestore.collection('todos').get().then((todos) => {
            todos.forEach((todo) => {
              todo.ref.delete()
            })
          })
          // localStorage.clear()
          // this.todoItems = []
      }
   },
  components: {
    "TodoHeader": TodoHeader,
    // 왼쪽 이름이 template 부분과 매치되어야 함
    "TodoInput": TodoInput,
    "TodoList": TodoList,
    "TodoFooter": TodoFooter
  },
  

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
