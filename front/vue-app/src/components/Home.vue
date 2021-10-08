<template>  
  <v-container>
    <v-row>
      <template>
        <v-col
        v-for="room in rooms"
        :key="`${room.id}`"
        cols="6"
        md="2"
        >
        <router-link :to="{name:'Room', params:{id:room.id}}">
          <v-sheet height="150"></v-sheet>
        </router-link>
        </v-col>
      </template>
    </v-row>
  </v-container>
</template> 
<script>
  import axios from "axios"
  export default {
    data () {
      return {
        rooms: []
      }
    },
    mounted () {
        axios.get('http://localhost:3000/api/v1/rooms').then((response) => {
          this.rooms = response.data
          }).catch(() => {
            alert("エラー");
          });
      },
  }
</script>