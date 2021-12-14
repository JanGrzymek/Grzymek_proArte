<template>
  <v-app>
    <v-app-bar height="100" color="#A71111" absolute>
      <img src="./assets/logo.svg" height="80" />
      <v-spacer></v-spacer>
      <v-btn text class="white--text mr-3" to="/">Home</v-btn>
      <v-btn text class="white--text mr-3" to="/Kontakt">Kontakt</v-btn>
      <!--     <v-select
        color="white"
        :items="types"
        label="Typ"
        style="margin-top: 25px; width: 20px"
      ></v-select>
      <v-select
        color="white"
        :items="years"
        label="Jahr"
        style="margin-top: 25px; width: 20px"
      ></v-select>-->

      <v-app-bar-nav-icon v-if="burgerflag" @click.stop="drawer = !drawer" color="white"></v-app-bar-nav-icon>
    </v-app-bar>
    <v-navigation-drawer v-model="drawer" absolute bottom temporary right>
      <v-list-item>
        <v-list-item-content>
          <v-list-item-title class="text-h6"> Filter </v-list-item-title>
          <v-list-item-subtitle> Nach Bild Suchen </v-list-item-subtitle>
        </v-list-item-content>
      </v-list-item>
      <v-list-item>
        <v-select
          v-if="artist !== 'No Select'"
          label="Typ"
          style="margin-top: 25px; width: 20px"
          disabled
        ></v-select>
        <v-select
          v-else
          v-model="type"
          :items="types"
          label="Typ"
          style="margin-top: 25px; width: 20px"
        ></v-select>
      </v-list-item>
      <v-list-item>
        <v-select v-if="artist !== 'No Select'" label="Jahr" style="margin-top: 25px" disabled></v-select>
        <v-select v-else v-model="year" :items="years" label="Jahr" style="margin-top: 25px"></v-select>
      </v-list-item>
      <v-list-item>
        <v-select
          width="50px"
          v-model="artist"
          :items="artists"
          label="Künstler"
          style="margin-top: 25px"
        ></v-select>
      </v-list-item>
      <v-list-item>
        <v-btn style="width: 230px" @click="filterPaintings(type, year, artist)">Search</v-btn>
      </v-list-item>
      <v-list-item>
        <v-select v-model="user" :items="users" style="margin-top: 25px"></v-select>
      </v-list-item>
      <v-list-item>
        <v-btn style="width: 230px" v-if="user == 'Admin'" to="/insert">Insert New Painting</v-btn>
      </v-list-item>
    </v-navigation-drawer>
    <v-main>
      <router-view
        :home="home"
        :paintings="paintings"
        :user="user"
        @getPaintings="getPaintings"
        style="margin-top: 100px"
      />
    </v-main>
  </v-app>
</template>

<script>
import axios from 'axios';

export default {
  name: 'App',

  data: () => ({
    types: ['-', 'Ölgemälde', 'Aquarelle', 'Druckgrafiken', 'Zeichnungen', 'Sonstiges'],
    years: ['-', 'Vor 1900', '1900 - 1950', 'Nach 1950'],
    users: ['Kunde', 'Admin'],
    paintings: [],
    artists: [],
    drawer: false,
    user: 'Kunde',
    home: true,
    type: '-',
    year: '-',
    artist: 'No Select',
    allPaintings: [],
    yearString: '',
  }),
  computed: {
    burgerflag() {
      return this.$route.name == 'Home' ? true : false;
    },
  },
  methods: {
    async getPaintings() {
      const gemaelde = await axios({
        url: 'http://localhost:3000/gemaelde',
        method: 'GET',
      });
      this.paintings = gemaelde.data;
      this.allPaintings = this.paintings;
    },
    async getArtists() {
      const kuenstler = await axios({
        url: 'http://localhost:3000/kuenstler',
        method: 'GET',
      });
      this.artists = kuenstler.data;
      this.artists = this.artists.map((el) => el.vorname + ' ' + el.nachname);
    },
    filterPaintings(type, year, artist) {
      this.paintings = this.allPaintings;
      switch (type) {
        case 'Aquarelle':
          type = 'Aquarell';
          break;
        case 'Druckgrafiken':
          type = 'Druckgrafik';
          break;
        case 'Zeichnungen':
          type = 'Zeichnung';
      }

      if (artist !== 'No Select') {
        type = '-';
        year = '-';
        this.paintings = this.paintings.filter(
          (el) => artist.includes(el.vorname) || artist.includes(el.nachname),
        );
      } else {
        if (type !== '-' && year !== '-') {
          switch (year) {
            case 'Nach 1950': {
              this.paintings = this.paintings.filter((el) => el.typ == type && el.jahr > 1950);
              break;
            }
            case 'Vor 1900': {
              this.paintings = this.paintings.filter((el) => el.typ == type && el.jahr < 1900);
              break;
            }
            case '1900 - 1950': {
              this.paintings = this.paintings.filter(
                (el) => el.typ == type && el.jahr >= 1900 && el.jahr < 1950,
              );
            }
          }
        }
        if (year == '-') {
          this.paintings = this.paintings.filter((el) => el.typ == type);
        }
        if (type == '-') {
          switch (year) {
            case 'Nach 1950': {
              this.paintings = this.paintings.filter((el) => el.jahr > 1950);
              break;
            }
            case 'Vor 1900': {
              this.paintings = this.paintings.filter((el) => el.jahr < 1900);
              break;
            }
            case '1900 - 1950': {
              this.paintings = this.paintings.filter((el) => el.jahr >= 1900 && el.jahr < 1950);
            }
          }
          console.log(this.paintings);
        }
        if (type == '-' && year == '-') {
          this.paintings = this.allPaintings;
        }
      }
    },
  },
  created() {
    this.getPaintings();
    this.getArtists();
  },
};
</script>
