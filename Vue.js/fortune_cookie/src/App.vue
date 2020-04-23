<template>
  <div id="app">
    <img src="https://user-images.githubusercontent.com/58713684/74627786-3b002c00-5197-11ea-9068-c591ffb49491.png">
    <h1>
      {{ msg }}
    </h1>
  </div>
</template>

<script>

const messages = ['돈은 들어오나 반흉반길입니다.', '정의롭지 못하면서 어찌 남을 선도하랴.', '대지에 비가 내리고 바람이 고르게 부니 만물이 번창할것입니다.', '길을 나섰지만 길가엔 위험만이 도사리고 있으니 집에 있음이 좋을 것입니다.', '불분명한 행동은 주위로부터 신용을 잃게 됩니다.', '많은 이득을 바라려 하니, 부정한 방법이라 양심에 가책을 느끼게 됩니다.', '시작부터 모든 것이 잘 되지 않습니다.', '일손을 놓고 쉬고 있을 때가 아닙니다.', '살아갈 날이 적막한 터널과 다를게 없습니다.', '어두운 듯 하지만 전혀 걱정할 것은 없습니다.', '눈에 띄는 행동은 자제하십시요.', '매우 결과적으로 기분 좋은 하루가 될 것 같습니다.']

export default {
  name: 'app',
  data () {
    return {
      msg : messages[Math.floor(Math.random()*messages.length)]
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
