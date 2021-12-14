<template>
  <v-container class="d-flex flex-wrap justify-space-around mx-12">
    <span class="text-center" v-if="!paintings.length"
      >Ups! Das Bild nach dem du suchst ist leider nicht vorhanden!</span
    >
    <div v-for="p of paintings" :key="p.gid">
      <v-card class="mx-auto my-12" min-width="500" max-width="500">
        <v-img height="500" :src="p.bild"></v-img>

        <v-card-title
          class="d-inline-block text-truncate"
          style="max-width: 350px"
        >
          {{ p.titel }}
        </v-card-title>
        <v-card-text>
          <div>
            Typ: {{ p.typ }} <br />
            <span>Künstler: {{ p.vorname }} {{ p.nachname }}<br /></span>
            Jahr: {{ p.jahr }} <br />
            <span v-if="p.signiert == true"> Signiert<br /> </span>
            <span v-else> Nicht Signiert<br /></span>
            <span v-if="p.status">Auf Lager</span>
            <span v-else>Verkauft</span><br />
            <span v-if="p.signiert"
              ><b>Preis: {{ p.preis }} €</b></span
            >
            <br />
          </div>
        </v-card-text>
        <v-divider></v-divider>
        <v-card-actions>
          <v-btn class="success" :to="`/detail/${p.g_id}`"
            ><v-icon dark>mdi-cart</v-icon></v-btn
          >
          <v-spacer></v-spacer>
          <v-btn
            class="error"
            @click="deletePainting(p.g_id)"
            v-if="user == 'Admin'"
            >Delete</v-btn
          >
        </v-card-actions>
      </v-card>
    </div>
  </v-container>
</template>

<script>
import axios from "axios";

export default {
  name: "Home",

  components: {},
  props: {
    paintings: {
      type: Array,
      default: () => [],
    },
    artists: {
      type: Array,
      default: () => [],
    },
    user: {
      type: String,
    },
  },
  methods: {
    async deletePainting(id) {
      await axios({
        url: "http://localhost:3000/gemaelde/" + id,
        method: "DELETE",
      });
      this.$emit("getPaintings");
    },
  },
};
</script>
