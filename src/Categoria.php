<?php

namespace Microblog;

use Exception;
use PDO;

final class Categoria
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

    public function listar() : array
    {
        $sql = "SELECT * FROM categorias ORDER BY nome";

        try {
            $stmt = $this->conexao->prepare($sql);
            $stmt->execute();
            $result = $stmt->fetchAll(PDO::FETCH_ASSOC);
        } catch (Exception $e) {
            die("Erro ao listar categorias: " . $e->getMessage());
        }
        return $result;
    }

    public function listarUm() : array
    {
        $sql = "SELECT * FROM categorias WHERE id = :id";

        try {
            $stmt = $this->conexao->prepare($sql);
            $stmt->bindValue(":id", $this->id, PDO::PARAM_INT);
            $stmt->execute();
            $result = $stmt->fetch(PDO::FETCH_ASSOC);
        } catch (Exception $e) {
            die("Erro ao listar uma categoria: " . $e->getMessage());
        }
        return $result;
    }

    public function atualizar() : void
    {
        $sql = "UPDATE categorias 
                SET nome = :nome
                WHERE id = :id";

        try {
            $stmt = $this->conexao->prepare($sql);
            $stmt->bindValue(":nome", $this->nome, PDO::PARAM_STR);
            $stmt->bindValue(":id", $this->id, PDO::PARAM_INT);
            $stmt->execute();
        } catch (Exception $e) {
            die("Erro ao atualizar categoria: " . $e->getMessage());
        }
    }

    public function excluir() : void
    {
        $sql = "DELETE FROM categorias
                WHERE id = :id";

        try {
            $stmt = $this->conexao->prepare($sql);
            $stmt->bindValue(":id", $this->id, PDO::PARAM_INT);
            $stmt->execute();
        } catch (Exception $e) {
            die("Erro ao excluir categoria: " . $e->getMessage());
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