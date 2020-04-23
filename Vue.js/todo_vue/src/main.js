import Vue from 'vue'
import App from './App.vue'
import VueFireStore from 'vue-firestore'
import firebase from 'firebase'
import 'firebase/firestore'

var firebaseConfig = {
  apiKey: "AIzaSyCr1jM-IDcAtxXmHU-PcyITcpHXxz92XdU",
  authDomain: "vuejs-72ced.firebaseapp.com",
  databaseURL: "https://vuejs-72ced.firebaseio.com",
  projectId: "vuejs-72ced",
  storageBucket: "vuejs-72ced.appspot.com",
  messagingSenderId: "386551388711",
  appId: "1:386551388711:web:5d1298074a4fa692af8c02",
  measurementId: "G-WNE4W1LS3Y"
};
// Initialize Firebase
firebase.initializeApp(firebaseConfig);
firebase.analytics();

Vue.prototype.firestore = firebase.firestore()
Vue.use(VueFireStore)

new Vue({
  el: '#app',
  render: h => h(App)
})
