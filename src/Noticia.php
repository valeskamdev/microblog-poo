<?php

namespace Microblog;

use Exception;
use PDO;

class Noticia
{
    private int $id;
    private string $data;
    private string $titulo;
    private string $texto;
    private string $resumo;
    private string $imagem;
    private string $destaque;
    private string $termo;
    private PDO $conexao;

    /**
     * Propriedades cujo o tipo são ASSOSCIADOS
     * á classes já existentes. Isso permitirá usar
     * recursos destas classes á partir de Noticia
     */
    public Categoria $categoria;
    public Usuario $usuario;

    public function __construct()
    {
        /**
         * Ao criar um objeto Noticia, aproveitamos para
         * instanciar objetos de Usuario e Categoria
         */
        $this->usuario = new Usuario();
        $this->categoria = new Categoria();
        $this->conexao = Banco::conecta();
    }

    public function inserir() : void
    {
        $sql = "INSERT INTO noticias(titulo, texto, resumo, imagem, destaque, usuario_id, categoria_id)
                VALUES (:titulo, :texto, :resumo, :imagem, :destaque, :usuario_id, :categoria_id)";

        try {
            $stmt = $this->conexao->prepare($sql);
            $stmt->bindValue(":titulo", $this->titulo, PDO::PARAM_STR);
            $stmt->bindValue(":texto", $this->texto, PDO::PARAM_STR);
            $stmt->bindValue(":resumo", $this->resumo, PDO::PARAM_STR);
            $stmt->bindValue(":imagem", $this->imagem, PDO::PARAM_STR);
            $stmt->bindValue(":destaque", $this->destaque, PDO::PARAM_STR);
            /**
             * Chamamos os getters de ID do Usuario e de Categoria, para só depois associar os
             * valores aos pârametros da consulta SQL. Isso é possível devido á associação entre as Classes
             */
            $stmt->bindValue(":usuario_id", $this->usuario->getId(), PDO::PARAM_INT);
            $stmt->bindValue(":categoria_id", $this->categoria->getId(), PDO::PARAM_INT);
            $stmt->execute();
        } catch (Exception $e) {
            die("Erro ao inserir notícia: " . $e->getMessage());
        }
    }

    public function listar() : array
    {
        // Se o tipo do usuário for admin
        if ($this->usuario->getTipo() === 'admin') {
            // Considere o sql abaixo

            /**
             * SQL para usuário ADMIN (visualizar todas noticias)
             * - titulo, data, autor/nome, destaque, id da noticia
             */
            $sql = "SELECT noticias.id, noticias.titulo, noticias.data, usuarios.nome AS autor, noticias.destaque
                FROM noticias INNER JOIN usuarios ON noticias.usuario_id = usuarios.id ORDER BY data DESC";
        } else {
            // Senão, considere o sql abaixo

            /**
             * SQL para usuário EDITOR (visualizar apenas suas noticias)
             * - titulo, data, destaque, id da noticia
             */
            $sql = "SELECT id, titulo, data, destaque
                FROM noticias WHERE usuario_id = :usuario_id
                ORDER BY data DESC";
        }

        try {
            $stmt = $this->conexao->prepare($sql);
            if ($this->usuario->getTipo() !== 'admin') {
                $stmt->bindValue(":usuario_id", $this->usuario->getId(), PDO::PARAM_INT);
            }
            $stmt->execute();
            $result = $stmt->fetchAll(PDO::FETCH_ASSOC);

        } catch (Exception $e) {
            die("Erro ao listar notícias: " . $e->getMessage());
        }
        return $result;

    }

    public function listarUm() : array
    {
        if ($this->usuario->getTipo() === 'admin') {
            $sql = "SELECT * FROM noticias WHERE id = :id";
        } else {
            $sql = "SELECT * FROM noticias WHERE id = :id AND usuario_id = :usuario_id";
        }

        try {
            $stmt = $this->conexao->prepare($sql);
            $stmt->bindValue(":id", $this->id, PDO::PARAM_INT);

            if ($this->usuario->getTipo() !== 'admin') {
                $stmt->bindValue(":usuario_id", $this->usuario->getId(), PDO::PARAM_INT);
            }
            $stmt->execute();
            $result = $stmt->fetch(PDO::FETCH_ASSOC);
        } catch (Exception $e) {
            die("Erro ao listar uma notícia: " . $e->getMessage());
        }
        return $result;
    }

    public function atualizar() : void
    {
        if ($this->usuario->getTipo() === 'admin') {
            $sql = "UPDATE noticias
                    SET titulo = :titulo, texto = :texto, resumo = :resumo, imagem = :imagem, categoria_id = :categoria_id, destaque = :destaque
                    WHERE id = :id";
        } else {
            $sql = "UPDATE noticias
                    SET titulo = :titulo, texto = :texto, resumo = :resumo, imagem = :imagem, categoria_id = :categoria_id, destaque = :destaque
                    WHERE id = :id AND usuario_id = :usuario_id";
        }

        try {
            $stmt = $this->conexao->prepare($sql);
            $stmt->bindValue(":id", $this->id, PDO::PARAM_INT);
            $stmt->bindValue(":titulo", $this->titulo, PDO::PARAM_STR);
            $stmt->bindValue(":texto", $this->texto, PDO::PARAM_STR);
            $stmt->bindValue(":resumo", $this->resumo, PDO::PARAM_STR);
            $stmt->bindValue(":imagem", $this->imagem, PDO::PARAM_STR);
            $stmt->bindValue(":destaque", $this->destaque, PDO::PARAM_STR);
            $stmt->bindValue(":categoria_id", $this->categoria->getId(), PDO::PARAM_INT);

            if ($this->usuario->getTipo() !== 'admin') {
                $stmt->bindValue(":usuario_id", $this->usuario->getId(), PDO::PARAM_INT);
            }
            $stmt->execute();
        } catch (Exception $e) {
            die("Erro ao atualizar notícia: " . $e->getMessage());
        }
    }

    public function excluir() : void
    {
        if ($this->usuario->getTipo() === 'admin') {
            $sql = "DELETE FROM noticias WHERE id = :id";
        } else {
            $sql = "DELETE FROM noticias WHERE id = :id AND usuario_id = :usuario_id";
        }

        try {
            $stmt = $this->conexao->prepare($sql);
            $stmt->bindValue(":id", $this->id, PDO::PARAM_INT);

            if ($this->usuario->getTipo() !== 'admin') {
                $stmt->bindValue(":usuario_id", $this->usuario->getId(), PDO::PARAM_INT);
            }
            $stmt->execute();
        } catch (Exception $e) {
            die("Erro ao excluir notícia: " . $e->getMessage());
        }
    }

    public  function upload(array $imagem) : void
    {
        // Definindo os tipos válidos

        $tiposValidos = [
          "image/png",
          "image/jpeg",
          "image/gif",
          "image/svg+xml"
        ];

        // Verificando se o arquivo NÃO É um dos tipos válidos
        if (!in_array($imagem['type'], $tiposValidos)) {
            die(
              // Se não for, exibe um alerta e volta para a página anterior
              "<script>
                alert('Tipo de arquivo inválido!');
                history.back()
              </script>"
            );
        }

        // Acessando APENAS o nome/extensão do arquivo
        $nome = $imagem['name'];

        // Acessando os dados de acesso/armazenamento temporários
        $temporario = $imagem['tmp_name'];

        // Definindo a pasta de destino das imagens do site
        $pastaFinal = "../imagens/" . $nome;

        // Movendo o arquivo da pasta temporária para a pasta final/destino
        move_uploaded_file($temporario, $pastaFinal);
    }

    public function getId(): int
    {
        return $this->id;
    }

    public function setId(int $id): void
    {
        $this->id = filter_var($id, FILTER_SANITIZE_NUMBER_INT);
    }

    public function getData(): string
    {
        return $this->data;
    }

    public function setData(string $data): void
    {
        $this->data = filter_var($data, FILTER_SANITIZE_SPECIAL_CHARS);
    }

    public function getTitulo(): string
    {
        return $this->titulo;
    }

    public function setTitulo(string $titulo): void
    {
        $this->titulo = filter_var($titulo, FILTER_SANITIZE_SPECIAL_CHARS);
    }

    public function getTexto(): string
    {
        return $this->texto;
    }

    public function setTexto(string $texto): void
    {
        $this->texto =  filter_var($texto, FILTER_SANITIZE_SPECIAL_CHARS);
    }

    public function getResumo(): string
    {
        return $this->resumo;
    }

    public function setResumo(string $resumo): void
    {
        $this->resumo = filter_var($resumo, FILTER_SANITIZE_SPECIAL_CHARS);
    }

    public function getImagem(): string
    {
        return $this->imagem;
    }

    public function setImagem(string $imagem): void
    {
        $this->imagem = filter_var($imagem, FILTER_SANITIZE_SPECIAL_CHARS);
    }

    public function getDestaque(): string
    {
        return $this->destaque;
    }

    public function setDestaque(string $destaque): void
    {
        $this->destaque = filter_var($destaque, FILTER_SANITIZE_SPECIAL_CHARS);
    }

    public function getCategoria(): Categoria
    {
        return $this->categoria;
    }

    public function setCategoria(Categoria $categoria): void
    {
        $this->categoria = $categoria;
    }

    public function getUsuario(): Usuario
    {
        return $this->usuario;
    }

    public function setUsuario(Usuario $usuario): void
    {
        $this->usuario = $usuario;
    }

    public function getTermo(): string
    {
        return $this->termo;
    }

    public function setTermo(string $termo): void
    {
        $this->termo = filter_var($termo, FILTER_SANITIZE_SPECIAL_CHARS);
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