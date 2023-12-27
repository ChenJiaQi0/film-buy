<template>
  <div>
    <svg-icon icon-class="github" @click="goto" />
  </div>
</template>

<script>
export default {
  name: 'FilmBuyGit',
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
