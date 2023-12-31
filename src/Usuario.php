<?php

namespace Microblog;

use Exception;
use PDO;

final class Usuario
{
    private int $id;
    private string $nome;
    private string $email;
    private string $senha;
    private string $tipo;
    private PDO $conexao;

    public function __construct()
    {
        $this->conexao = Banco::conecta();
    }

    public function inserir() : void
    {
        $sql = "INSERT INTO usuarios(nome, email, senha, tipo) VALUES (:nome, :email, :senha, :tipo)";

        try {
            $stmt = $this->conexao->prepare($sql);
            $stmt->bindValue(":nome", $this->nome, PDO::PARAM_STR);
            $stmt->bindValue(":email", $this->email, PDO::PARAM_STR);
            $stmt->bindValue(":senha", $this->senha, PDO::PARAM_STR);
            $stmt->bindValue(":tipo", $this->tipo, PDO::PARAM_STR);
            $stmt->execute();
        } catch (Exception $e) {
            die("Erro ao inserir usuário: " . $e->getMessage());
        }
    }

    public function listar() : array
    {
        $sql = "SELECT * FROM usuarios ORDER BY nome";

        try {
            $stmt = $this->conexao->prepare($sql);
            $stmt->execute();

            $resultado = $stmt->fetchAll(PDO::FETCH_ASSOC);
        } catch (Exception $e) {
            die("Erro ao inserir usuário: " . $e->getMessage());
        }
        return $resultado;
    }

    public function listarUm() : array
    {
        $sql = "SELECT * FROM usuarios WHERE id = :id";

        try {
            $stmt = $this->conexao->prepare($sql);
            $stmt->bindValue(":id", $this->id, PDO::PARAM_INT);
            $stmt->execute();
            $result = $stmt->fetch(PDO::FETCH_ASSOC);
        } catch (Exception $e) {
            die("Erro ao carregar dados: " . $e->getMessage());
        }
        return $result;
    }

    public function  atualizar() : void
    {
        $sql = "UPDATE usuarios 
                SET nome = :nome, email = :email, senha = :senha, tipo = :tipo 
                WHERE id = :id";

        try {
            $stmt = $this->conexao->prepare($sql);
            $stmt->bindValue(":id", $this->id, PDO::PARAM_INT);
            $stmt->bindValue(":nome", $this->nome, PDO::PARAM_STR);
            $stmt->bindValue(":email", $this->email, PDO::PARAM_STR);
            $stmt->bindValue(":senha", $this->senha, PDO::PARAM_STR);
            $stmt->bindValue(":tipo", $this->tipo, PDO::PARAM_STR);
            $stmt->execute();
        } catch (Exception $e) {
            die("Erro ao atualizar usuário: " . $e->getMessage());
        }
    }

    public function excluir() : void
    {
        $sql = "DELETE FROM usuarios WHERE id = :id";

        try {
            $stmt = $this->conexao->prepare($sql);
            $stmt->bindValue(":id", $this->id, PDO::PARAM_INT);
            $stmt->execute();
        } catch (Exception $e) {
            die("Erro ao excluir usuário: " . $e->getMessage());
        }
    }

    // método para buscar usuario no banco atráves do email
    public function buscar() : array|bool //tipos de saídas PHP +7.4
    {
        $sql = "SELECT * FROM usuarios WHERE email = :email";

        try {
            $stmt = $this->conexao->prepare($sql);
            $stmt->bindValue(":email", $this->email, PDO::PARAM_STR);
            $stmt->execute();
            $result = $stmt->fetch(PDO::FETCH_ASSOC);
        } catch (Exception $e) {
            die("Erro ao buscar usuário: " . $e->getMessage());
        }
        return $result;
    }

    public function codificaSenha(string $senha) : string
    {
        return password_hash($senha, PASSWORD_DEFAULT);
    }

    public function vefificaSenha(string $senhaFormulario, string $senhaBanco) : string
    {
        if (password_verify($senhaFormulario, $senhaBanco)) {
            return $senhaBanco;
        } else {
            return $this->codificaSenha($senhaFormulario);
        }
    }

    public function getId(): int
    {
        return $this->id;
    }

    public function setId(int $id): void
    {
        $this->id = filter_var($id, FILTER_SANITIZE_NUMBER_INT);
    }

    public function getNome(): string
    {
        return $this->nome;
    }

    public function setNome(string $nome): void
    {
        $this->nome = filter_var($nome, FILTER_SANITIZE_SPECIAL_CHARS);
    }

    public function getEmail(): string
    {
        return $this->email;
    }

    public function setEmail(string $email): void
    {
        $this->email = filter_var($email, FILTER_SANITIZE_EMAIL);
    }

    public function getSenha(): string
    {
        return $this->senha;
    }

    public function setSenha(string $senha): void
    {
        $this->senha = filter_var($senha, FILTER_SANITIZE_SPECIAL_CHARS);;
    }

    public function getTipo(): string
    {
        return $this->tipo;
    }

    public function setTipo(string $tipo): void
    {
        $this->tipo = filter_var($tipo, FILTER_SANITIZE_SPECIAL_CHARS);;
    }

    public function getConexao(): PDO
    {
        return $this->conexao;
    }

    public function setConexao(PDO $conexao): void
    {
        $this->conexao = $conexao;
    }
}