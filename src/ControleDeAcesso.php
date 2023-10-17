<?php

namespace Microblog;

final class ControleDeAcesso
{
    public function __construct() {
        // se nao existir uma sessao "em andamento"
        if (!isset($_SESSION)) {
            // entao inicialize uma sessão
            session_start();
        }
    }

    public function verificaAcesso() : void
    {
        /**
         * se não existir uma variável chamada "id"
         * (ou seja, ainda não houve um login por parte do usuário)
         */
        if (!isset($_SESSION['id'])) {
            /**
             * ..então destrua qualquer resquício de sessão, redirecione para
             * o formulário de login e pare completamente o script
             */
            session_destroy();
            header("location:../login.php");
            die();
        }
    }

    public function login(int $id, string $nome, string $tipo) : void
    {
        $_SESSION["id"] = $id;
        $_SESSION["nome"] = $nome;
        $_SESSION["tipo"] = $tipo;
    }
}