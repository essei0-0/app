<template>
  <v-container>
    <v-row class="text-center">
      <v-col cols="12">
        <v-card
          class="mx-auto my-12"
          elevation="2"
          
          color="grey lighten-5"
        >
          <v-card-title>{{room.name}}</v-card-title>
          <v-divider></v-divider>
          <v-card-text
            ><v-row>
              <v-col cols="12">
                <v-container
                  ref="scrollTarget"
                  style="height: 450px"
                  class="overflow-y-auto"
                >
                  <v-row v-for="(comment, i) in comments" :key="i" dense>
                    <v-col v-if="comment.ws_key != ws_key">
                      <div class="balloon_l">
                        <div class="face_icon">
                          <v-avatar :color="comment.avatar_color">
                            <span class="white--text">
                              {{ comment.name }}
                            </span>
                          </v-avatar>
                        </div>
                        <p class="says">
                          {{ comment.content }}
                        </p>
                      </div>
                    </v-col>
                    <v-col v-else>
                      <div class="balloon_r">
                        <div class="face_icon">
                          <v-avatar :color="comment.avatar_color">
                            <span class="white--text">
                              {{ comment.name }}
                            </span>
                          </v-avatar>
                        </div>
                        <p class="says">
                          {{ comment.content }}
                        </p>
                      </div>
                    </v-col>
                  </v-row>
                </v-container>
              </v-col>
            </v-row>
          </v-card-text>
          <v-divider></v-divider>
          <v-card-text>
            <v-row>
              <v-col cols="3">
                <v-text-field
                  label="名前"
                  v-model="name"
                  clearable
                ></v-text-field>
              </v-col>
              <v-col>
                <v-text-field
                  autofocus
                  label="メッセージ ※Enterでも送信できるよ"
                  v-model="comment"
                  clearable
                  @keyup.enter="speak"
                ></v-text-field>
              </v-col>
            </v-row>
            <v-btn class="info" small @click="speak">
              <v-icon>mdi-play</v-icon>送信
            </v-btn>
          </v-card-text>
        </v-card>
      </v-col>
    </v-row>
  </v-container>
</template>

<script>
import axios from "axios"
export default {
  name: 'Room',
  props: {
    id: String
  },
  data () {
    return {
      name: "名無し",
      comment: "おはようございます。",
      room: [],
      // Vars
      connection: null,
      comments: [],
      ws_key: null,
      avatar_color: "",
      commentChannel: null,
    }
  },
  methods: {
    speak: function(){
      axios.post("http://localhost:3000/api/v1/comments", {comment:{content: this.comment, room_id: this.$route.params.id}}).then((response) => {
        }).catch(() => {
          alert("roomエラー");
        });
    },
  },

  mounted () {
      axios.get(`http://localhost:3000/api/v1/rooms/${this.$route.params.id}`).then((response) => {
        this.room = response.data
        }).catch(() => {
          alert("roomエラー");
        });
      axios.get(`http://localhost:3000/api/v1/rooms/${this.$route.params.id}/comments`).then((response) => {
        this.comments = response.data
        }).catch(() => {
          alert("commentsエラー");
        });
  },

  created () {
      this.commentChannel = this.$cable.subscriptions.create("CommentChannel",{
        received: (data) => {
          console.log(data)
          this.comments.push(data)
        },
      });
  },
}

</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
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
