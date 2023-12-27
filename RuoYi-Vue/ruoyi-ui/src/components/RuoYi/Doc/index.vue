<template>
  <div>
    <svg-icon icon-class="question" @click="goto" />
  </div>
</template>

<script>
export default {
  name: 'FilmBuyDoc',
  data() {
    return {
      url: 'https://github.com/ChenJiaQi0/film-buy'
    }
  },
  methods: {
    goto() {
      window.open(this.url)
    }
  }
}
</script>
