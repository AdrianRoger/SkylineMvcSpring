window.display = ScrollReveal({reset:true});

ScrollReveal({ distance: '20px' });
display.reveal('.revelar', { origin: 'top' });
// display.reveal('.revelar',{duration:1000});
display.reveal('.gp-revelar', {interval:100});
// fim revelar function
//até aqui o script ScrollReveal e usado
//-----------------------------------------------
document.addEventListener('DOMContentLoaded', function () {
    const formulario = document.getElementById('id_form');
    
    formulario.addEventListener('submit', function (event) {
        if (formulario.checkValidity()) {
            alert('Mensagem Enviada com sucesso!');
        } else {
            // Evitar o envio do formulário se a validação falhar
            event.preventDefault();
        }
    });
});

// Início do evento .toinvisivel
const btngotop = document.querySelector('.gotop');
function handleScroll(){
  const referencia = 500;
  if(window.scrollY > referencia){
    btngotop.classList.remove('toinvisivel');
  }else{
    btngotop.classList.add('toinvisivel');
  }
}
//fim do evento .toinvisivel


//Evento de rolagem ao topo
window.addEventListener('scroll', handleScroll);
function scrollToTop() {
  window.scrollTo({top: 0,behavior: 'smooth'});
}//Evento de rolagem ao topo da página


// Função para definir a mesma altura para os containers .team-desc
function definirMesmaAltura() {
  const membrosDaEquipe = document.querySelectorAll('#team-members .col');
  // console.log('membrosDaEquipe', membrosDaEquipe);
  let alturaMaxima = 0;

  // Resetar altura para evitar problemas de layout responsivo
  membrosDaEquipe.forEach((membro) => {
    const descricaoDaEquipe = membro.querySelector('.team-desc');
    // console.log(descricaoDaEquipe);
    descricaoDaEquipe.style.height = 'auto';
  });

  // Percorra todos os membros da equipe para encontrar a altura máxima
  membrosDaEquipe.forEach((membro) => {
    const descricaoDaEquipe = membro.querySelector('.team-desc');
    const altura = descricaoDaEquipe.offsetHeight;
    alturaMaxima = Math.max(alturaMaxima, altura);
    // console.log(alturaMaxima);
  });

  // Aplique a altura máxima a todos os containers .team-desc
  membrosDaEquipe.forEach((membro) => {
    const descricaoDaEquipe = membro.querySelector('.team-desc');
    descricaoDaEquipe.style.height = `${alturaMaxima}px`;
  });
}

// Chame a função quando a página carregar e também se a janela for redimensionada
window.addEventListener('load', definirMesmaAltura);
window.addEventListener('resize', definirMesmaAltura);
