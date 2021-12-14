<template>
  <div>
    <v-container>
      <v-text-field v-model="addTitel" label="Titel des Bilds"></v-text-field>
      <v-text-field v-model="addJahr" label="Erscheinungsjahr"></v-text-field>
      <v-select
        v-model="addType"
        :items="types"
        label="Typ des Bildes"
      ></v-select>
      <v-text-field v-model="addPreis" label="Preis"></v-text-field>
      <v-text-field v-model="addBild" label="Link zum Bild"></v-text-field>
      <v-select
        v-model="addSigniert"
        :items="bools"
        label="Hat es eine Signatur?"
      ></v-select>
      <v-btn
        @click="
          postPainting(
            addTitel,
            addJahr,
            addType,
            addPreis,
            addBild,
            addSigniert
          )
        "
        class="success"
        >Add</v-btn
      >
    </v-container>
  </div>
</template>

<script>
import axios from "axios";

export default {
  name: "Insert",

  data: () => ({
    types: [
      "Ölgemälde",
      "Aquarelle",
      "Druckgrafiken",
      "Zeichnungen",
      "Sonstiges",
    ],
    bools: ["Ja", "Nein"],
    typeId: null,
    signiertBool: true,
  }),
  props: {},
  computed: {},
  methods: {
    async postPainting(
      addTitel,
      addJahr,
      addType,
      addPreis,
      addBild,
      addSigniert
    ) {
      switch (addType) {
        case "Ölgemälde":
          this.typeId = 1;
          break;
        case "Aquarelle":
          this.typeId = 2;
          break;
        case "Druckgrafiken":
          this.typeId = 3;
          break;
        case "Zeichnungen":
          this.typeId = 4;
          break;
        case "Sonstiges":
          this.typeId = 5;
          break;
      }
      switch (addSigniert) {
        case "Ja":
          this.signiertBool = true;
          break;
        case "Nein":
          this.signiertBool = false;
          break;
      }
      await axios({
        url: "http://localhost:3000/gemaelde",
        method: "POST",
        "content-type": "appplication/json",
        data: {
          titel: addTitel,
          jahr: addJahr,
          preis: addPreis,
          k_id: 9,
          t_id: this.typeId,
          bild: addBild,
          signiert: this.signiertBool,
          status: true,
        },
      });
      this.$router.push({ name: "Home" });
      location.reload();
    },
  },
};
</script>
