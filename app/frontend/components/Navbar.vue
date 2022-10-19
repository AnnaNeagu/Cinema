<template>
  <nav class="navbar navbar-expand-lg bg-secondary fixed-top" id="mainNav">
    <div class="container">
      <a class="navbar-brand js-scroll-trigger" href="#page-top"
        >CINEMA START
      </a>
      <button
        class="navbar-toggler navbar-toggler-right font-weight-bold bg-primary text-white rounded"
        type="button"
        data-toggle="collapse"
        data-target="#navbarResponsive"
        aria-controls="navbarResponsive"
        aria-expanded="false"
        aria-label="Toggle navigation"
      >
        Menu <i class="fas fa-bars"></i>
      </button>
      <div class="collapse navbar-collapse" id="navbarResponsive">
        <ul class="navbar-nav ml-auto">
          <li class="nav-item mx-0 mx-lg-1">
            <a
              class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger"
              href="/welcome/index"
              >HOME</a
            >
          </li>
          <li class="nav-item mx-0 mx-lg-1">
            <a
              class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger"
              href="/movies/new"
              >NEW</a
            >
          </li>
          <!-- <li class="nav-item mx-0 mx-lg-1">
              <a
                class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger"
                href="#contact"
                >CONTACT</a
              >
            </li> -->
        </ul>
      </div>
    </div>
  </nav>

  <!-- <nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container-fluid">
      <a class="navbar-brand" href="/movies">Logo</a>
      <button
        class="navbar-toggler"
        type="button"
        data-bs-toggle="collapse"
        data-bs-target="#navbarSupportedContent"
        aria-controls="navbarSupportedContent"
        aria-expanded="false"
        aria-label="Toggle navigation"
      >
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav me-auto mb-2 mb-lg-0">
          <li class="nav-item">
            <a class="nav-link active" aria-current="page" href="/welcome/index"
              >Home</a
            >
          </li>
          <li class="nav-item">
            <a class="nav-link" href="/movies/new">New movie</a>
          </li>
        </ul>
        <form class="d-flex">
          <input
            class="form-control me-2"
            type="search"
            placeholder="Search"
            aria-label="Search"
          />
          <button class="button" type="submit">Search</button>
        </form>
      </div>
    </div>
  </nav> -->
</template>

<style scoped>
@import "../css/styles.css";
@import "../css/body.css";
@import "../css/heading.css";
</style>
