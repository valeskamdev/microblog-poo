<?php

use Microblog\Usuario;

require_once "../vendor/autoload.php";

$usuario = new Usuario();
$listaDeUsuario = $usuario->listar();
?>

<div class="row">
	<article class="col-12 bg-white rounded shadow my-1 py-4">
		
		<h2 class="text-center">
		Usuários <span class="badge bg-dark"><?=count($listaDeUsuario)?></span>
		</h2>

		<p class="text-center mt-5">
			<a class="btn btn-primary" href="usuario-insere.php">
			<i class="bi bi-plus-circle"></i>	
			Inserir novo usuário</a>
		</p>
				
		<div class="table-responsive">
		
			<table class="table table-hover">
				<thead class="table-light">
					<tr>
						<th>Nome</th>
						<th>E-mail</th>
						<th>Tipo</th>
						<th class="text-center">Operações</th>
					</tr>
				</thead>

				<tbody>
          <?php foreach ($listaDeUsuario as $dadosUmUsuario) : ?>
					<tr>
						<td><?=$dadosUmUsuario['nome']?></td>
						<td><?=$dadosUmUsuario['email']?></td>
						<td><?=$dadosUmUsuario['tipo']?> </td>
						<td class="text-center">
							<a class="btn btn-warning" 
                href="usuario-atualiza.php?id=<?=$dadosUmUsuario['id']?>">
							<i class="bi bi-pencil"></i> Atualizar
							</a>
						
							<a class="btn btn-danger excluir" 
							href="usuario-exclui.php?id=<?=$dadosUmUsuario['id']?>">
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

