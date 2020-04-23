<template>
    <section>
        <transition-group name="list" tag="ul">
            <li v-for="(todo, index) in propsItems" :key="index" class="shadow">
            <i class="checkBtn fa fa-check" aria-hidden="true"></i>
            {{ todo.todo }}
            <span class="removeBtn" @click="remove(todo)">
                <i class="fa fa-trash-alt" aria-hidden="true"></i>
            </span>
            </li>
        </transition-group>
    </section>
</template>

<script>
export default {
    props: ['propsItems'],

    methods: {
        remove(todo) {
            this.$http.delete('http://localhost:8000/api/todos/' + todo.id + '/').then((res) => {
                this.$emit('remove')
            })
        }
    }   
}
</script>

<style>
    ul {
        list-style-type: none;
        padding-left: 0px;
        margin-top: 0;
        text-align: left;
    }

    li {
        display: flex;
        min-height: 50px;
        height: 50px;
        line-height: 50px;
        margin: 0.5rem 0;
        padding: 0 0.9rem;
        background: white;
        border-radius: 5px;
    }

    .checkBtn {
        line-height: 45px;
        color: #62acde;
        margin-right: 5px;
    }

    .removeBtn {
        margin-left: auto;
        color: #de4343;
    }

    .list-item {
        display: inline-block;
        margin-right: 10px;
    }

    .list-move {
        transition: transform 1s;
    }

    .list-enter-active, .list-leave-active {
        transition: all 1s;
    }

    .list-enter {
        opacity: 0;
        transform: translateY(30px);
    }

    .list-leave-to {
        opacity: 0;
        transform: translateX(30px);
    }
</style>