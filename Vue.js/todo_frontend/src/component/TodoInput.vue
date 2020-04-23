<template>
    <div class="inputBox Shadow">
        <input v-model = "todoItem" @keypress.enter="addTodo" placeholder="할 일을 입력하세요.">
            <span class="addContainer" v-on:click="addTodo">
                <i class="addBtn fa fa-plus" aria-hidden="true"></i>
            </span>
    </div>
</template>

<script>
export default {
    data() {
        return {
            todoItem: ''
        }
    },
    methods: {
        addTodo() {
            this.$http.post('http://localhost:8000/api/todos/', {'todo': this.todoItem}).then((res) => {
                this.$emit('add-todo')
                this.clearInput()
            })
        },
        clearInput() {
            this.todoItem = ''
        },
    }
}
</script>

<style>
    input:focus {
        outline: none;
    }

    .inputBox {
        background: white;
        height: 50px;
        line-height: 50px;
        border-radius: 5px;
    }

    .inputBox input {
        border-style: none;
        font-size: 0.9em;
        text-align: center;
    }

    .addContainer {
        float: right;
        background: linear-gradient(to right, #6478fb, #8763fb);
        display: inline-block;
        width: 3rem;
        border-radius: 0 5px 5px 0;
    }

    .addBtn {
        color: white;
        vertical-align: middle;
    }
</style>