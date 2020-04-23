<template>
    <div>
        {{ message }}
    </div>
</template>

<script>
export default {
    data() {
        return {
            message: 'Hello World'
        }
    },

    beforeCreate: function() {
                console.log("boforeCreate")
    },
    created: function() {
        console.log("create")
    },
    mounted: function() {
        console.log("mounted")
        this.message = "Vue.js"
    },
    updated: function() {
        console.log("updated")
    }
}
</script>