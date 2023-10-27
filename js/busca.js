const formBusca = document.querySelector("#form-busca");
const campoBusca = document.querySelector("#campo-busca");
const divResultados = document.querySelector("#resultados");

// escondendo a div antes da digitação no campo
divResultados.classList.add("visually-hidden");

// monitorando evento de digitação no campo
campoBusca.addEventListener("input",  async function () {
  if (campoBusca.value !== "") {
    const response = await fetch("resultados.php", {
      method: "POST",
      body: new FormData(formBusca)
    });

    const dados = await response.text();
    divResultados.classList.remove("visually-hidden");
    divResultados.innerHTML = dados;
  } else {
    divResultados.classList.add("visually-hidden")
    divResultados.innerHTML = "";

  }
})