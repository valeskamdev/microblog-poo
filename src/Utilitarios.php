<?php

namespace Microblog;

abstract class Utilitarios
{
    /**
     * sobre o parâmetro $dados com o tipo array | bool
     * quando um parâmetro pode receber tipos de dados diferentes de acordo
     * com a chmada do método, usamos o pipe (|) para separar os tipos
     */
    public static function dump(array | bool | object $dados) : void
    {
        echo "<pre>";
        var_dump($dados);
        echo "</pre>";
    }
}