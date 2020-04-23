<template>
  <div id="app">
    <input type="text" v-model="value" minlength="4" maxlength="4" @keypress.enter="compare">
    <button @click="compare">입력</button>
    <h1>시도: {{ result.length }}</h1>
    <div v-for="(score,index) in result" :key="index">
      <div>{{ score.value }}</div>
      <div>{{ score.score }}</div>
    </div>
  </div>
</template>

<script>

// alert(numbers.length(1))
export default {
  name: 'app',
  data () {
    return {
      baseball: [],
      value: '',
      result: []
    }
  },
  created() {
    this.baseball = this.getBaseBall()
  },
  methods: {
    compare() {
      if(this.value.length!=4) {
        alert("4개의 숫자만 입력하세요")
      }else{
        if (this.result.length === 10) {
          alert("틀렸습니다. 답은" + this.baseball)
          this.restart()
        }
        if (this.value === this.baseball.join('')) {
          alert('홈런')
          this.restart()
        } else {
          var strike = 0
          var ball = 0
          for (var i=0; i<4; i++) {
            if (this.value[i] === this.baseball[i]) {
              strike++
            } else if (this.baseball.includes(this.value[i])) {
              ball++
            }
          }
          this.result.push({
            value: this.value,
            score: `${strike} 스트라이크, ${ball} 볼`
          })
          this.value=''
        }
      }

    },
    restart() {
      this.baseball = this.getBaseBall()
      this.value = ''
      this.result = []
    },
    getBaseBall() {
      var ball = [`1`,`2`,`3`,`4`,`5`,`6`,`7`,`8`,`9`]
      this.shuffle(ball)
      ball.length = 4
      return ball
    },
    shuffle(a) {
      var j, x, i;
      for (i = a.length; i; i -= 1) {
         j = Math.floor(Math.random() * i);
         x = a[i - 1];
         a[i - 1] = a[j];
         a[j] = x;
       }
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
