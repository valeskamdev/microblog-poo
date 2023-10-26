<?php
use Microblog\Utilitarios;

$todasAsNoticias = $noticia->listarTodas();
?>

<hr class="my-5 w-50 mx-auto">

<div class="row my-1">
    <div class="col-12 px-md-1">
        <div class="list-group">
            <h2 class="fs-6 text-center text-muted">Todas as notícias</h2>
          <?php foreach ($todasAsNoticias as $umaNoticia) : ?>
            <a href="noticia.php?id=<?=$umaNoticia['id']?>" class="list-group-item list-group-item-action">
                <h3 class="fs-6"><time><?=$umaNoticia['data']?></time> | <?=$umaNoticia['titulo']?></h3>
                <p><?=$umaNoticia['resumo']?></p>
            </a>
          <?php endforeach; ?>
        </div>
    </div>
</div>
