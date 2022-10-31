<template>
  <div v-if="modalShow">
    <transition name="modal">
      <div class="modal-mask">
        <div class="modal-wrapper">
          <div class="modal-dialog" role="document">
            <div class="modal-content">
              <div class="modal-header">
                <button
                  type="button"
                  class="close"
                  data-dismiss="modal"
                  aria-label="Close"
                >
                  <span aria-hidden="true" @click="modalShow = false"
                    >&times;</span
                  >
                </button>
                <h5 class="modal-title"></h5>
              </div>
              <div class="modal-body">
                {{ movie.title }}
              </div>
            </div>
          </div>
        </div>
      </div>
    </transition>
  </div>
</template>
<script>
export default {
  props: {
    showModal: Boolean,
    movie: Object,
  },
  data() {
    return {
      modalShow: false,
    };
  },
  watch: {
    showModal() {
      this.modalShow = this.showModal;
    },

    modalShow() {
      this.$emit("showM", this.modalShow);
    },
  },
};
</script>

<style scoped>
.modal-mask {
  position: fixed;
  z-index: 9998;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background-color: rgba(0, 0, 0, 0.5);
  display: table;
  transition: opacity 0.3s ease;
}

.modal-wrapper {
  display: table-cell;
  vertical-align: middle;
}
</style>
