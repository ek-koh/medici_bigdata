<template>
    <div class="inputBox shadow">
        <input type="text" v-model="newTodoItem" v-on:keypress.enter="addTodo"
        placeholder="할 일을 입력하세요">
        <span class="addContainer" v-on:click="addTodo">
            <i class="addBtn fa fa-plus" aria-hidden="true"></i>
        </span>

        <modal v-if="showModal" @close="showModal = false">
            <h3 slot="header">경고</h3>
            <span slot="footer" @click="showModal = false">
                할 일을 입력하세요.
                <i class="closeModalBtn fa fa-times" aria-hidden="true"></i>
            </span>
        </modal>
    </div>
</template>

<script>
import Modal from './common/Modal.vue'

export default {
    data() {
        return {
            newTodoItem: '',
            showModal: false
        }
    },
    methods: {
        addTodo() {
            var value = this.newTodoItem && this.newTodoItem.trim()
            if (this.newTodoItem !== '') {
            this.$emit('add-todo', value)
            this.clearInput()  
            } else {
                this.showModal = true
            }
      },
        clearInput() {
                this.newTodoItem = ''
            },
        },
    
        components: {
            modal: Modal
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

