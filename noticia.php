<?php

use Microblog\Utilitarios;

require_once "inc/cabecalho.php";

$noticia->setId($_GET['id']);
$dadosNoticia = $noticia->listarDetalhes();
?>


<div class="row my-1 mx-md-n1">

    <article class="col-12">
        <h2><?=$dadosNoticia['titulo']?></h2>
        <p class="font-weight-light">
            <time><?=Utilitarios::formatarDataHora($dadosNoticia['data'])?></time> - <span><?=$dadosNoticia['autor']?></span>
        </p>
        <img src="imagens/<?=$dadosNoticia['imagem']?>" alt="" class="float-start pe-2 img-fluid">
        <p class="ajusta-texto"><?=$dadosNoticia['texto']?></p>
    </article>
    

</div>        
                  

<?php
require_once "inc/todas.php";
require_once "inc/rodape.php";
?>

