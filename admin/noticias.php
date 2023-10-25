<?php

use Microblog\Noticia;

require_once "../inc/cabecalho-admin.php";

$noticia = new Noticia();

// Capturando o ID da notícia que será atualizada
/**
 * Capturando o id do tipo do usuário logado
 * e associando estes valores ás propriedades do objeto
 */
$noticia->usuario->setId($_SESSION['id']);
$noticia->usuario->setTipo($_SESSION['tipo']);

$listaDeNoticias = $noticia->listar();
?>


<div class="row">
	<article class="col-12 bg-white rounded shadow my-1 py-4">
		
		<h2 class="text-center">
		Notícias <span class="badge bg-dark"><?=count($listaDeNoticias)?></span>
		</h2>

		<p class="text-center mt-5">
			<a class="btn btn-primary" href="noticia-insere.php">
			<i class="bi bi-plus-circle"></i>	
			Inserir nova notícia</a>
		</p>
				
		<div class="table-responsive">
		
			<table class="table table-hover">
				<thead class="table-light">
					<tr>
                        <th>Título</th>
                        <th>Data</th>
            <?php if ($_SESSION['tipo'] === 'admin') { ?>
                        <th>Autor</th>
              <?php } ?>
            <th class="text-center">Destaque</th>
						<th class="text-center" colspan="2">Operações</th>
					</tr>
				</thead>

				<tbody>
        <?php foreach ($listaDeNoticias as $noticia) : ?>

          <tr>
            <td><?=$noticia['titulo']?></td>
            <td><?=$noticia['data']?></td>
              <?php
              if ($_SESSION['tipo'] === 'admin') { ?>
                <td><?=$noticia['autor']?></td>
              <?php
              } ?>

                <td><?=$noticia['destaque']?></td>
            <td class="text-center">
              <a class="btn btn-warning"
                 href="noticia-atualiza.php?id=<?=$noticia['id']?>">
                <i class="bi bi-pencil"></i> Atualizar
              </a>

              <a class="btn btn-danger excluir"
                 href="noticia-exclui.php?id=<?=$noticia['id']?>">
                <i class="bi bi-trash"></i> Excluir
              </a>
            </td>
          </tr>
        <?php endforeach; ?>

				</tbody>                
			</table>
	</div>
		
	</article>
</div>


<?php 
require_once "../inc/rodape-admin.php";
?>

