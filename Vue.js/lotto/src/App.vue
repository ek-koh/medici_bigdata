<template>
  <div id="app">
    <div class="lotto">
      <div v-for="(n,index) in nums" :key="index" class="ballStyle" :style="getBallColor(n)">
        <div class="textStyle">{{ n }}</div>
      </div>
    </div>
    <button @click="restart">다시뽑기</button>
  </div>
</template>

<script>
import { _ } from 'vue-underscore'

export default {
  name: 'app',
  data () {
    return {
      nums: []
    }
  },
  created() {
    this.nums = this.getNums()
  },
  methods: {
    getBallColor(n) {
      if (n <= 10) {
        return 'background-color: #fbc400'
      } else if (n <= 20) {
        return 'background-color: #69c8f2' 
      } else if (n <= 30) {
        return 'background-color: #ff7272'
      } else if (n <= 40) {
        return 'background-color: #aaa'
      } else {
        return 'background-color: #b0d840'
      }
    },
    restart() {
      this.getNums()
    },
    getNums() {
      for(var i=0; i<45; i++) {
        this.nums.push(i+1)
      }
      this.shuffle(this.nums)
      this.nums.length = 6
      this.nums = this.nums.sort(function(a, b) { 
        // 오름차순
        return a - b;
})
      return this.nums

      // _.times(45, (x) => {this.nums.push(x+1)}) 
      // // "TypeError: Cannot read property 'push' of undefined"????
      // this.nums = _.shuffle(this.nums)

      // this.nums.length = 6
      // this.nums = _.sortBy(this.nums)
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
.lotto {
  display: flex;
}

.ballStyle {
  display: flex;
  width: 50px;
  height: 50px;
  border-radius: 25px;
  align-items: center;
  justify-content: center;
  margin: 5px;
}

.textStyle {
  vertical-align: middle;
  font-size: 18px;
  color: blue;
  font-weight: bold;
  text-align: center;
}
</style>
