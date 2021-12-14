<template>
  <div>
    <v-container>
      <v-card class="mx-auto my-12" style="width: 500px">
        <v-img height="600" :src="gemaelde.bild"></v-img>

        <v-card-title>{{ gemaelde.titel }} {{ gemaelde.g_id }}</v-card-title>
        <v-simple-table>
          <thead>
            <tr>
              <th>Preis</th>
              <th>Status</th>
              <th>Künstler</th>
              <th>Jahr</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <th>{{ gemaelde.preis }} €</th>
              <th>
                <span v-if="gemaelde.status">Auf Lager</span>
                <span v-else>Verkauft</span>
              </th>
              <th>
                {{ gemaelde.vorname }}
                {{ gemaelde.nachname }}
              </th>
              <th>
                {{ gemaelde.jahr }}
              </th>
            </tr>
          </tbody>
        </v-simple-table>
        <v-card-text>
          Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut
          labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores
          et ea rebum. Stet clita kasd gubergren
        </v-card-text>
        <v-divider class="mx-4"></v-divider>

        <v-card-actions style="height: 60px">
          <v-btn to="/"> Go back </v-btn>
          <v-spacer></v-spacer>
          <span v-if="gemaelde.status">
            <v-btn class="success" @click="patchStatus($event)"><v-icon dark>mdi-cart</v-icon></v-btn>
          </span>
        </v-card-actions>
      </v-card>
    </v-container>
  </div>
</template>

<script>
import axios from 'axios';

export default {
  components: {},
  props: {
    g_id: {
      type: String,
    },
    paintings: {
      type: Array,
      default: () => [],
    },
  },
  computed: {
    gemaelde() {
      return this.paintings.find((el) => el.g_id == this.g_id);
    },
  },
  methods: {
    async patchStatus() {
      try {
        this.gemaelde.status = false;
        await axios({
          method: 'PATCH',
          url: 'http://localhost:3000/gemaelde/' + this.gemaelde.g_id,
          'content-type': 'appplication/json',
          data: { status: this.gemaelde.status },
        });
      } catch (error) {
        console.log(error);
      }
    },
  },
};
</script>
