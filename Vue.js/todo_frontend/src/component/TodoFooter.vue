<template>
    <div class="clearAllContainer">
        <span class="clearAllBtn" @click="removeAll">전체 삭제</span>
    </div>
</template>

<script>
export default {
    methods: {
        removeAll() {
            this.$http.delete('http://localhost:8000/api/todos/removeAll'+'/').then((res) => {
                this.$emit('remove-all')
            })
        }
    }
}
</script>

<style>
.clearAllContainer {
    width: 8.5rem;
    height: 50px;
    line-height: 50px;
    background-color: white;
    border-radius: 5px;
    margin: 0 auto;
}

.clearAllBtn {
    color: #e20303;
    display: block;
}
</style>
