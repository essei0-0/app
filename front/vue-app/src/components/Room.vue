<template>
  <v-container>
    <v-row class="text-center">
      <v-col cols="12">
        <v-card
          class="mx-auto my-12"
          elevation="2"
          
          color="grey lighten-5"
        >
          <v-card-title>Chat Sample</v-card-title>
          <v-divider></v-divider>
          <v-card-text
            ><v-row>
              <v-col cols="12">
                <v-container
                  ref="scrollTarget"
                  style="height: 450px"
                  class="overflow-y-auto"
                >
                  <v-row v-for="(msg, i) in messages" :key="i" dense>
                    <v-col v-if="msg.ws_key != ws_key">
                      <div class="balloon_l">
                        <div class="face_icon">
                          <v-avatar :color="msg.avatar_color">
                            <span class="white--text">
                              {{ msg.name }}
                            </span>
                          </v-avatar>
                        </div>
                        <p class="says">
                          {{ msg.message }}
                        </p>
                      </div>
                    </v-col>
                    <v-col v-else>
                      <div class="balloon_r">
                        <div class="face_icon">
                          <v-avatar :color="msg.avatar_color">
                            <span class="white--text">
                              {{ msg.name }}
                            </span>
                          </v-avatar>
                        </div>
                        <p class="says">
                          {{ msg.message }}
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
                  v-model="message"
                  clearable
                  @keyup.enter="send_onClick"
                ></v-text-field>
              </v-col>
            </v-row>
            <v-btn class="info" small @click="send_onClick">
              <v-icon>mdi-play</v-icon>送信
            </v-btn>
          </v-card-text>
        </v-card>
      </v-col>
    </v-row>
  </v-container>
</template>

<script>
export default {
  name: 'Room',
  props: {
    id: String
  },
  data () {
    return {
      name: "名無し",
      message: "おはようございます。",

      // Vars
      connection: null,
      messages: [],
      ws_key: null,
      avatar_color: "",
    }
  }
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
