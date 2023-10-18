<?php

namespace Microblog;

use Exception;
use PDO;

class Categoria
{
    private int $id;
    private string $nome;
    private PDO $conexao;

    public function __construct() {
        $this->conexao = Banco::conecta();
    }

    public function inserir() : void
    {
        $sql = "INSERT INTO categorias(nome) VALUES (:nome)";

        try {
            $stmt = $this->conexao->prepare($sql);
            $stmt->bindValue(":nome", $this->nome, PDO::PARAM_STR);
            $stmt->execute();
        } catch (Exception $e) {
            die("Erro ao inserir categoria: " . $e->getMessage());
        }
    }

    public function getId(): int
    {
        return $this->id;
    }

    public function setId(int $id): void
    {
        $this->id = filter_var($id, FILTER_SANITIZE_SPECIAL_CHARS);
    }

    public function getNome(): string
    {
        return $this->nome;
    }

    public function setNome(string $nome): void
    {
        $this->nome =filter_var($nome, FILTER_SANITIZE_SPECIAL_CHARS);
    }
}