<template>
  <div id="app">
    <h1>{{ computer }}</h1>
    <button v-on:click="compare(RSP.scissors)">가위</button>
    <button v-on:click="compare(RSP.rock)">바위</button>
    <button v-on:click="compare(RSP.paper)">보</button>

    <button @click="restart">다시 시작</button>
  </div>
</template>

<script>
let interval = null
export default {
  name: 'app',
  data () {
    return {
      RSP: {
        rock: '바위',
        paper: '보',
        scissors: '가위'
      },
      computer: ''
    }
  },
  created() {
   this.restart()
  },
  methods: {
    compare(value){
      clearInterval(interval)
     // 입력 순간 멈추게 함
      if(this.computer === value) {
        alert('비겼습니다')
      }else if((this.computer === this.RSP.scissors) && value === this.RSP.rock || (this.computer === this.RSP.rock) && value === RSP.paper || (this.computer === this.RSP.paper) && value === this.RSP.scissors){
        alert('이겼습니다')
      }else{
        alert('졌습니다')
      }
    },
    restart() {
      interval = setInterval(() => {
        this.computer = this.rsp()
      }, 100)
      // 0.1초
    },
    rsp() {
      var com = ['가위', '바위', '보']
      return com[Math.floor(Math.random()*3)]
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
