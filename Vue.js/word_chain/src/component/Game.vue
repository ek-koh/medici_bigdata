<template>
  <div>
    <h1>{{ msg }}</h1>
    <input type="text" v-model="word" v-on:keypress.enter="tf">
    <button v-on:click="tf">입력</button>
    <h1>{{ result }}</h1>
  </div>

</template>

<script>

// const messages1 = ['기차', '공부', '사과']
// const messages2 = ['철도', '학원', '사람']
// const messages3 = ['진실', '도화지', '대한민국']
export default {
  props: ['initWord'],

  data () {
    return {
      msg: this.initWord,
      word: '',
      result: ''
    }
  },
  
  methods: {
    tf() {
        if(this.msg[this.msg.length-1]===this.word[0]) {
          this.result='정답',
          this.reset()
        }else{
          this.result='땡'
        }
    },
    reset() {
      this.msg = this.word,
      this.word = ''
    }
  }
}
</script>