<template>
  <div id="app">
    <h1>
      {{ random1 }} X {{ random2 }} = ?
    </h1>
    <input type="text" v-model="input" v-on:keypress.enter="tf"
        placeholder="정답을 입력하세요">
        <button v-on:click="tf">입력</button>
    <h1>
      {{ msg }}
    </h1>
  </div>
</template>

<script>
export default {
  name: 'app',
  data () {
    return {
      random1 : Math.floor(Math.random()*9) + 1,
      random2 : Math.floor(Math.random()*9) + 1,
      input: '',
      msg: ''
    }
  },
  methods: {
    tf() {
      if(parseInt(this.input)==this.random1*this.random2) {
        this.msg="정답"
        this.reset()
      }else{
        this.msg="땡"
      }
    },
    reset() {
      this.input = ''
      this.random1 = Math.floor(Math.random()*9) + 1
      this.random2 = Math.floor(Math.random()*9) + 1
    }
  }
}
</script>

<style>
#app {
  font-family: 'Avenir', Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin-top: 60px;
}

h1, h2 {
  font-weight: normal;
}

ul {
  list-style-type: none;
  padding: 0;
}

li {
  display: inline-block;
  margin: 0 10px;
}

a {
  color: #42b983;
}
</style>
