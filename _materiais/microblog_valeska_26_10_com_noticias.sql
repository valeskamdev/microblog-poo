-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 26/10/2023 às 14:26
-- Versão do servidor: 10.4.28-MariaDB
-- Versão do PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `microblog_valeska`
--
CREATE DATABASE IF NOT EXISTS `microblog_valeska` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `microblog_valeska`;

-- --------------------------------------------------------

--
-- Estrutura para tabela `categorias`
--

CREATE TABLE `categorias` (
  `id` smallint(6) NOT NULL,
  `nome` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `categorias`
--

INSERT INTO `categorias` (`id`, `nome`) VALUES
(1, 'Segurança'),
(2, 'Mercado'),
(4, 'Mobile'),
(5, 'Games'),
(6, 'Educação'),
(7, 'Desenvolvimento');

-- --------------------------------------------------------

--
-- Estrutura para tabela `noticias`
--

CREATE TABLE `noticias` (
  `id` mediumint(9) NOT NULL,
  `data` datetime NOT NULL DEFAULT current_timestamp(),
  `titulo` varchar(150) NOT NULL,
  `texto` text NOT NULL,
  `resumo` tinytext NOT NULL,
  `imagem` varchar(45) NOT NULL,
  `destaque` enum('sim','nao') NOT NULL,
  `usuario_id` smallint(6) DEFAULT NULL,
  `categoria_id` smallint(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `noticias`
--

INSERT INTO `noticias` (`id`, `data`, `titulo`, `texto`, `resumo`, `imagem`, `destaque`, `usuario_id`, `categoria_id`) VALUES
(1, '2023-10-25 08:42:02', 'Udacity lança curso de deep learning em português', 'Deep learning é o tema do momento dentre as empresas do Vale do Silício: o reconhecimento facial do Facebook, a assistente virtual Siri, o carro autônomo do Google e o diagnóstico de um tipo raro de câncer pelo IBM Watson são apenas algumas possíveis aplicações. Por meio desta tecnologia, sistemas cada vez mais inteligentes estão sendo desenvolvidos e resolvendo problemas de altíssima complexidade.&#13;&#10;&#13;&#10;Brasileiros agora já conseguem se especializar nesta área: a Udacity – a Universidade do Vale do Silício – lançou em português o programa Nanodegree Fundamentos de Deep Learning. Tipos e arquiteturas de redes neurais, reconhecimento de objetos, bots inteligentes, drone image tracking, previsão do mercado de ações e visualização de dados são alguns dos conceitos e aplicações abordados no curso.&#13;&#10;&#13;&#10;“Deep learning é uma tecnologia transformadora que já vemos à nossa volta todos os dias em imagens médicas, pesquisas do Google, carros autônomos e muito mais. Estamos apenas no início do que esta tecnologia pode fazer por nós, mal posso esperar para ver o que nossos alunos construirão em seguida”, comenta Sebastian Thrun, professor de Stanford e fundador da Udacity.&#13;&#10;&#13;&#10;Deep learning é o tema do momento dentre as empresas do Vale do Silício: o reconhecimento facial do Facebook, a assistente virtual Siri, o carro autônomo do Google e o diagnóstico de um tipo raro de câncer pelo IBM Watson são apenas algumas possíveis aplicações. Por meio desta tecnologia, sistemas cada vez mais inteligentes estão sendo desenvolvidos e resolvendo problemas de altíssima complexidade.&#13;&#10;&#13;&#10;Brasileiros agora já conseguem se especializar nesta área: a Udacity – a Universidade do Vale do Silício – lançou em português o programa Nanodegree Fundamentos de Deep Learning. Tipos e arquiteturas de redes neurais, reconhecimento de objetos, bots inteligentes, drone image tracking, previsão do mercado de ações e visualização de dados são alguns dos conceitos e aplicações abordados no curso.&#13;&#10;&#13;&#10;“Deep learning é uma tecnologia transformadora que já vemos à nossa volta todos os dias em imagens médicas, pesquisas do Google, carros autônomos e muito mais. Estamos apenas no início do que esta tecnologia pode fazer por nós, mal posso esperar para ver o que nossos alunos construirão em seguida”, comenta Sebastian Thrun, professor de Stanford e fundador da Udacity.', 'A Udacity lançou em português o programa Nanodegree Fundamentos de Deep Learning, que abordará temas como tipos e arquiteturas de redes neurais, reconhecimento de objetos, bots inteligentes, drone image tracking, entre outros.', 'felicidade.jpg', 'nao', 1, 6),
(2, '2023-10-25 08:42:46', 'Chrome vai marcar sites HTTP no modo de navegação anônima como não seguros', 'O Google anunciou ontem o segundo passo no seu plano de marcar todos os sites HTTP como não seguros no Chrome. A partir de outubro de 2017, o Chrome marcará sites HTTP com dados inseridos e sites HTTP no modo de navegação anônima como não seguros.&#13;&#10;&#13;&#10;O HTTPS é uma versão mais segura do protocolo HTTP usado na Internet para conectar usuários a sites. As conexões seguras são consideradas uma medida necessária para diminuir o risco de os usuários serem vulneráveis à injeção de conteúdo, o que pode resultar em espionagem, ataques man-in-the-middle e modificação de outros dados.&#13;&#10;&#13;&#10;Os dados são mantidos seguros de terceiros, e os usuários podem ficar mais confiantes de que estão se comunicando com o site correto.&#13;&#10;&#13;&#10;O Google anunciou ontem o segundo passo no seu plano de marcar todos os sites HTTP como não seguros no Chrome. A partir de outubro de 2017, o Chrome marcará sites HTTP com dados inseridos e sites HTTP no modo de navegação anônima como não seguros.&#13;&#10;&#13;&#10;O HTTPS é uma versão mais segura do protocolo HTTP usado na Internet para conectar usuários a sites. As conexões seguras são consideradas uma medida necessária para diminuir o risco de os usuários serem vulneráveis à injeção de conteúdo, o que pode resultar em espionagem, ataques man-in-the-middle e modificação de outros dados.&#13;&#10;&#13;&#10;Os dados são mantidos seguros de terceiros, e os usuários podem ficar mais confiantes de que estão se comunicando com o site correto.', 'A partir de outubro de 2017, o Chrome marcará sites HTTP com dados inseridos e sites HTTP no modo de navegação anônima como não seguros.', 'sanduiche.jpg', 'sim', 1, 1),
(3, '2023-10-25 08:43:42', 'Estudo aponta que profissionais de TI certificados têm desempenho melhor', 'A tecnologia da informação é uma área vital para a maioria das empresas atualmente e uma das que mais crescem em oportunidades de trabalho. &#13;&#10;&#13;&#10;Ter as habilidades certas dá aos profissionais da TI a confiança necessária para atender às demandas dos empregadores, aumentando seu desempenho e o da organização.&#13;&#10;&#13;&#10;De acordo com da IDC, profissionais certificados têm um desempenho melhor e mais domínio de conhecimento em relação àqueles que não são certificados.&#13;&#10;&#13;&#10;O estudo da IDC comparando duas equipes, com e sem as certificações, com um conjunto de tarefas específicas e objetivamente mensuráveis, mostrou que os funcionários certificados realizaram tarefas de forma mais confiável e consistente.&#13;&#10;&#13;&#10;Leonard Wadewitz, diretor da CompTIA para América Latina e Caribe, conta que esses resultados atendem às principais perspectivas que líderes de TI e CIOs têm para sua equipe: rapidez e assertividade no dia a dia e na resolução de problemas.&#13;&#10;&#13;&#10;A tecnologia da informação é uma área vital para a maioria das empresas atualmente e uma das que mais crescem em oportunidades de trabalho. Ter as habilidades certas dá aos profissionais da TI a confiança necessária para atender às demandas dos empregadores, aumentando seu desempenho e o da organização.&#13;&#10;&#13;&#10;De acordo com da IDC, profissionais certificados têm um desempenho melhor e mais domínio de conhecimento em relação àqueles que não são certificados.&#13;&#10;&#13;&#10;O estudo da IDC comparando duas equipes, com e sem as certificações, com um conjunto de tarefas específicas e objetivamente mensuráveis, mostrou que os funcionários certificados realizaram tarefas de forma mais confiável e consistente.&#13;&#10;&#13;&#10;Leonard Wadewitz, diretor da CompTIA para América Latina e Caribe, conta que esses resultados atendem às principais perspectivas que líderes de TI e CIOs têm para sua equipe: rapidez e assertividade no dia a dia e na resolução de problemas.', 'Estudo comparando duas equipes, com e sem certificações, mostrou que os funcionários certificados realizaram tarefas de forma mais confiável e consistente.', 'modelo.jpg', 'sim', 2, 2),
(14, '2019-05-10 19:49:58', 'Visual Studio Code 1.12 está disponível para download', 'O Visual Studio Code 1.12 já pode ser baixado. Nessa versão, a equipe de desenvolvimento mudou o foco habitual em novos recursos para melhorar os processos e a base de código. Todas as issues em aberto foram revisadas, bugs foram corrigidos e a dívida de engenharia foi reduzida. &#13;&#10;&#13;&#10;Nessa versão, a equipe corrigiu 2.199 bugs em todos os repositórios VS Code. E dos 3.775 issues que atualmente a equipe rastreia no github.com/Microsoft/vscode, 2.368 são solicitações de recursos.&#13;&#10;&#13;&#10;O Visual Studio Code 1.12 já pode ser baixado. Nessa versão, a equipe de desenvolvimento mudou o foco habitual em novos recursos para melhorar os processos e a base de código. Todas as issues em aberto foram revisadas, bugs foram corrigidos e a dívida de engenharia foi reduzida.&#13;&#10;&#13;&#10;Nessa versão, a equipe corrigiu 2.199 bugs em todos os repositórios VS Code. E dos 3.775 issues que atualmente a equipe rastreia no github.com/Microsoft/vscode, 2.368 são solicitações de recursos.&#13;&#10;&#13;&#10;O Visual Studio Code 1.12 já pode ser baixado. Nessa versão, a equipe de desenvolvimento mudou o foco habitual em novos recursos para melhorar os processos e a base de código. Todas as issues em aberto foram revisadas, bugs foram corrigidos e a dívida de engenharia foi reduzida. &#13;&#10;&#13;&#10;Nessa versão, a equipe corrigiu 2.199 bugs em todos os repositórios VS Code. E dos 3.775 issues que atualmente a equipe rastreia no github.com/Microsoft/vscode, 2.368 são solicitações de recursos.', 'Nessa versão, a equipe corrigiu 2.199 bugs em todos os repositórios VS Code. Todas as issues em aberto foram revisadas, bugs foram corrigidos e a dívida de engenharia foi reduzida.', 'dog.jpg', 'sim', 1, 7),
(15, '2019-05-10 19:53:31', 'Uso do Android cresce no Brasil', 'O Android é o sistema operacional mais popular do mundo. E isso também é realidade no Brasil. De acordo com a empresa de análise de dados Kantar, o sistema do Google já domina 93,2% do mercado nacional de dispositivos móveis. &#13;&#10;&#13;&#10;O número é referente à análise conduzida entre dezembro de 2016, janeiro e fevereiro de 2017 no país. No mesmo período, um ano atrás, o Android já dominava 90,4% do mercado. Ou seja, o software do Google continua crescendo, enquanto seus rivais continuam se distanciando. &#13;&#10;&#13;&#10;No ano passado, o iOS já aparecia em segundo lugar com 4,7% do mercado, numa pequena disputa com o Windows Phone, que representava 4,6% do bolo. Agora, o sistema da Apple tem 4,4% de market share no Brasil, enquanto o da Microsoft caiu para 2,1% nos três meses terminando em fevereiro. &#13;&#10;&#13;&#10;Embora os números do iOS tenham se mantido relativamente estáveis, a queda do Windows Phone foi certamente mais expressiva. Isso porque até janeiro de 2016, o sistema da Microsoft era mais popular no Brasil do que o da Apple: 4,1% contra 3,3%. Em um ano, o quadro virou de ponta-cabeça. &#13;&#10;&#13;&#10;Guardadas as devidas proporções, porém, o Windows Phone até que está numa “boa fase” no Brasil. Entre julho e setembro do ano passado, o sistema (já praticamente abandonado pela Microsoft) tinha 1,1% do mercado, chegando agora a pouco mais de 2%. Só quem manteve um ritmo estável de crescimento durante todo o ano (e deve continuar mantendo em 2017) foi mesmo o Android. &#13;&#10;O Android é o sistema operacional mais popular do mundo. E isso também é realidade no Brasil. De acordo com a empresa de análise de dados Kantar, o sistema do Google já domina 93,2% do mercado nacional de dispositivos móveis.&#13;&#10;&#13;&#10;O número é referente à análise conduzida entre dezembro de 2016, janeiro e fevereiro de 2017 no país. No mesmo período, um ano atrás, o Android já dominava 90,4% do mercado. Ou seja, o software do Google continua crescendo, enquanto seus rivais continuam se distanciando. &#13;&#10;&#13;&#10;No ano passado, o iOS já aparecia em segundo lugar com 4,7% do mercado, numa pequena disputa com o Windows Phone, que representava 4,6% do bolo. Agora, o sistema da Apple tem 4,4% de market share no Brasil, enquanto o da Microsoft caiu para 2,1% nos três meses terminando em fevereiro.&#13;&#10;&#13;&#10;Embora os números do iOS tenham se mantido relativamente estáveis, a queda do Windows Phone foi certamente mais expressiva. Isso porque até janeiro de 2016, o sistema da Microsoft era mais popular no Brasil do que o da Apple: 4,1% contra 3,3%. Em um ano, o quadro virou de ponta-cabeça.&#13;&#10;&#13;&#10;Guardadas as devidas proporções, porém, o Windows Phone até que está numa “boa fase” no Brasil. Entre julho e setembro do ano passado, o sistema (já praticamente abandonado pela Microsoft) tinha 1,1% do mercado, chegando agora a pouco mais de 2%. Só quem manteve um ritmo estável de crescimento durante todo o ano (e deve continuar mantendo em 2017) foi mesmo o Android.', 'O Android é o sistema operacional mais popular do mundo. E isso também é realidade no Brasil. De acordo com a empresa de análise de dados Kantar, o sistema do Google já domina 93,2% do mercado nacional de dispositivos móveis. ', 'abstrato.jpg', 'nao', 1, 4),
(16, '2017-11-30 22:28:57', 'Escola de Governança da Internet no Brasil abre inscrições para Curso Intensivo', 'Serão 50 horas dedicadas ao debate de assuntos que demandam atenção da sociedade brasileira e mundial, como proteção de dados pessoais, algoritmos, blockchain, criptografia e Internet das Coisas. Os interessados em aprofundar o conhecimento sobre esses e outros temas devem se inscrever até 25 de junho no portal da EGI. &#13;&#10;&#13;&#10;“Desde 2014, o CGI.br promove o Curso Intensivo da EGI, que é uma referência no País. A EGI criou um espaço de interlocução e construção de conhecimento sobre governança da Internet. É nossa responsabilidade manter esse espaço e ampliar a participação da sociedade no debate. Com um corpo docente formado por profissionais e acadêmicos reconhecidos em suas áreas de atuação, o curso prima pelo cuidado e qualidade dos temas abordados. A cada ano temos a oportunidade de aprimorar essa experiência e aprofundar o debate sobre temas emergentes relacionados ao uso da Internet em um ambiente multissetorial”, considera Hartmut Glaser, secretário executivo do CGI.br e diretor da EGI.&#13;&#10;&#13;&#10;As aulas acontecerão de 20 a 25 de agosto, em São Paulo. O curso, que é gratuito, tem o objetivo de capacitar gestores públicos, formuladores de políticas públicas, empresários, pesquisadores, acadêmicos, representantes da comunidade técnica, de organizações da sociedade civil e demais interessados sobre o funcionamento e a governança da Internet. &#13;&#10;&#13;&#10;Para participar do processo seletivo é necessário preencher o formulário, enviar currículo e produzir um texto sobre temas relacionados à Governança da Internet dentro da área de atuação do candidato. Veja o programa na íntegra em http://egi.nic.br/curso-intensivo-egi/.&#13;&#10;&#13;&#10;As aulas acontecerão de 20 a 25 de agosto, em São Paulo. O curso, que é gratuito, tem o objetivo de capacitar gestores públicos, formuladores de políticas públicas, empresários, pesquisadores, acadêmicos, representantes da comunidade técnica, de organizações da sociedade civil e demais interessados sobre o funcionamento e a governança da Internet. &#13;&#10;&#13;&#10;Para participar do processo seletivo é necessário preencher o formulário, enviar currículo e produzir um texto sobre temas relacionados à Governança da Internet dentro da área de atuação do candidato. Veja o programa na íntegra em http://egi.nic.br/curso-intensivo-egi/.', 'Primeira a debater temas cruciais para o desenvolvimento da Internet no país, a EGI (Escola de Governança da Internet), iniciativa do Comitê Gestor da Internet no Brasil (CGI.br), recebe inscrições para a 4ª turma do Curso Intensivo.', 'cores.jpg', 'sim', 1, 6),
(17, '2017-11-30 22:30:33', 'Unity anuncia integração com Google Tango', 'O motor Unity ganhou integração com o Google Tango. Essa foi a grande novidade do keynote Vision Summit. O Unity já suporta aplicativos para outros headsets de realidade virtual (RV) do Google, Cardboard e Daydream, mas o gerente de produtos do Google, Nathan Martz, anunciou que a Daydream experimentará uma atualização em maio permitindo que os criadores testem as alterações de RV e realidade aumentada para seu aplicativo em minutos. &#13;&#10;&#13;&#10;O blog do Unity também mostrou Vuforia Smart Terrain e Tango trabalhando juntos para construir uma versão de realidade aumentada de Marte no palco com a IA que entendia a geometria do ambiente. Houve outros exemplos da experiência da realidade aumentada com outras empresas, incluindo o Laboratório de Propulsão a Jato da NASA e palestras de outras empresas e dignitários, como NFL e Audi. Segundo o site Develop, outra nota interessante do evento foi o principal gerente de grupo da Microsoft, Brandon Bray, anunciando que 91% dos aplicativos para os fones de ouvido HoloLens são feitos com Unity e que Mixed Reality estará disponível em breve no Unity para tirar proveito dos novos fones de ouvido Acer MR este ano. &#13;&#10;&#13;&#10;O blog do Unity também mostrou Vuforia Smart Terrain e Tango trabalhando juntos para construir uma versão de realidade aumentada de Marte no palco com a IA que entendia a geometria do ambiente. Houve outros exemplos da experiência da realidade aumentada com outras empresas, incluindo o Laboratório de Propulsão a Jato da NASA e palestras de outras empresas e dignitários, como NFL e Audi. &#13;&#10;&#13;&#10;Segundo o site Develop, outra nota interessante do evento foi o principal gerente de grupo da Microsoft, Brandon Bray, anunciando que 91% dos aplicativos para os fones de ouvido HoloLens são feitos com Unity e que Mixed Reality estará disponível em breve no Unity para tirar proveito dos novos fones de ouvido Acer MR este ano.', 'Essa foi a grande novidade do keynote Vision Summit, considerando que o Unity já suportava aplicativos para outros headsets de realidade virtual (RV) do Google, Cardboard e Daydream', 'purple.jpg', 'sim', 2, 5),
(18, '2017-05-01 13:27:35', 'Quase 2 milhões de dispositivos Android podem ser infectados com malware FalseGuide', 'Embora tenha havido algum esforço dos fabricantes de smartphones Android para entregar atualizações de segurança mensais do Google para pelo menos alguns dos seus dispositivos, a situação está longe de ser completamente ideal. &#13;&#10;&#13;&#10;Após o Google ter recentemente admitido que metade dos dispositivos Android ativos não recebeu uma atualização de segurança em 2016, o cenário é preocupante, especialmente depois de grandes vulnerabilidades de segurança, como o Stagefright, sendo descobertas no sistema operacional.&#13;&#10;&#13;&#10;No entanto, os aplicativos mal-intencionados apresentam um vetor alternativo para comprometer dispositivos Android com mais de 2,1 milhões de gadgets que baixaram o malware da Google Play Store em 2015. Agora, parece que mais aplicativos disponíveis na loja oficial de aplicativos do Google têm uma nova variante de malware, chamado de FalseGuide. &#13;&#10;&#13;&#10;No seu anúncio, a Check Point revelou que: “FalseGuide cria um botnet silencioso fora dos dispositivos infectados para fins de adware. Um botnet é um grupo de dispositivos controlados por hackers sem o conhecimento de seus proprietários. Os bots são usados por várias razões com base nas capacidades de computação distribuída de todos os dispositivos”.&#13;&#10;&#13;&#10;Embora tenha havido algum esforço dos fabricantes de smartphones Android para entregar atualizações de segurança mensais do Google para pelo menos alguns dos seus dispositivos, a situação está longe de ser completamente ideal. &#13;&#10;&#13;&#10;Após o Google ter recentemente admitido que metade dos dispositivos Android ativos não recebeu uma atualização de segurança em 2016, o cenário é preocupante, especialmente depois de grandes vulnerabilidades de segurança, como o Stagefright, sendo descobertas no sistema operacional.&#13;&#10;&#13;&#10;No entanto, os aplicativos mal-intencionados apresentam um vetor alternativo para comprometer dispositivos Android com mais de 2,1 milhões de gadgets que baixaram o malware da Google Play Store em 2015. &#13;&#10;&#13;&#10;Agora, parece que mais aplicativos disponíveis na loja oficial de aplicativos do Google têm uma nova variante de malware, chamado de FalseGuide. No seu anúncio, a Check Point revelou que: “FalseGuide cria um botnet silencioso fora dos dispositivos infectados para fins de adware. &#13;&#10;&#13;&#10;Um botnet é um grupo de dispositivos controlados por hackers sem o conhecimento de seus proprietários. Os bots são usados por várias razões com base nas capacidades de computação distribuída de todos os dispositivos”.', 'Aplicativos disponíveis na loja oficial de aplicativos do Google têm uma nova variante de malware, chamado de FalseGuide. ', 'luminarias.jpg', 'nao', 1, 1),
(19, '2017-05-02 09:29:46', 'Angular 4.1.0 está disponível para download', 'A versão 4.1.0 do Angular já pode ser baixada – o anúncio foi feito pelo blog da empresa. Na prática, a nova versão é uma simples substituta para a 4.x.x anterior. Ela adiciona suporte completo para TypeScript 2.2 e 2.3. Os desenvolvedores relataram anteriormente boas experiências com o TypeScript 2.2 e 2.3, mas o Angular agora é construído com o TypeScript 2.3. Isso não afeta nosso suporte para o TypeScript 2.1, que acompanha a versão 4.0. &#13;&#10;&#13;&#10;Além disso, segundo o site C# Corner, o Angular agora é compatível com StrictNullChecks do TypeScript. Isso significa que você pode ativar StrictNullChecks em seu projeto, se desejar. A versão 4.1.0 do Angular já pode ser baixada – o anúncio foi feito pelo blog da empresa. &#13;&#10;&#13;&#10;Na prática, a nova versão é uma simples substituta para a 4.x.x anterior. Ela adiciona suporte completo para TypeScript 2.2 e 2.3. Os desenvolvedores relataram anteriormente boas experiências com o TypeScript 2.2 e 2.3, mas o Angular agora é construído com o TypeScript 2.3. &#13;&#10;&#13;&#10;Isso não afeta nosso suporte para o TypeScript 2.1, que acompanha a versão 4.0. Além disso, segundo o site C# Corner, o Angular agora é compatível com StrictNullChecks do TypeScript. Isso significa que você pode ativar StrictNullChecks em seu projeto, se desejar. &#13;&#10;&#13;&#10;A versão 4.1.0 do Angular já pode ser baixada – o anúncio foi feito pelo blog da empresa. Na prática, a nova versão é uma simples substituta para a 4.x.x anterior. Ela adiciona suporte completo para TypeScript 2.2 e 2.3. Os desenvolvedores relataram anteriormente boas experiências com o TypeScript 2.2 e 2.3, mas o Angular agora é construído com o TypeScript 2.3. Isso não afeta nosso suporte para o TypeScript 2.1, que acompanha a versão 4.0. &#13;&#10;&#13;&#10;Além disso, segundo o site C# Corner, o Angular agora é compatível com StrictNullChecks do TypeScript. Isso significa que você pode ativar StrictNullChecks em seu projeto, se desejar.', 'Na prática, a nova versão é uma simples substituta para a 4.x.x anterior. ', 'felicidade.jpg', 'nao', 2, 7),
(20, '2017-11-05 12:18:53', 'Versão 5.6 do Unity já pode ser baixada', 'O Unity 5.6 chega dois anos após o lançamento do Unity 5, e contém vários aprimoramentos e novos recursos que podem fornecer a melhor experiência para os desenvolvedores e, através deles, para jogadores e usuários finais.\r\n\r\nA nova versão do Unity é equipada com um preview do Progressive Lightmapper, uma nova técnica para fornecer feedback imediato para o desenvolvedor ao testar diferentes cenários de iluminação. \r\n\r\nAlém disso, ajuda a classificar a iteração mais rápida em comparação com a solução Enlighten atual. Juntamente com isso, Light Modes também são integrados, a fim de oferecer uma funcionalidade para misturar tempo real e iluminação para objetos estáticos e dinâmicos.\r\n\r\nOutra melhoria é um melhor desempenho gráfico. A geração de instâncias de GPU foi melhorada e agora é suportada pela instanciação Procedural. Shaders de computador para Metal foram adicionados para que os usuários possam trabalhar em detalhes ainda menores em um jogo e aproveitar o poder de chipsets, especialmente em dispositivos da Apple.\r\n\r\nO Unity 5.6 oferecerá mais opções e controles aos usuários com a ajuda de uma ampla gama de efeitos de partículas. E, para reduzir a sobrecarga do driver e a carga de trabalho da CPU, a equipe do Unity trouxe o suporte para Vulkan. Isso não apenas mantém a CPU livre, mas economiza memória RAM juntamente com maior duração da bateria para plataformas móveis.\r\n\r\nAgora, você pode jogar 4k vídeos em um player de vídeo multiplataforma, o que irá ajudá-lo a construir experiências de realidade virtual em 360° para os seus jogadores. A nova versão traz integração gratuira e nativa do TextMesh Pro, que é a ferramenta mais popular e de alto desempenho na Unity Asset Store e oferece renderização de texto avançada e controle aprimorado sobre a formatação e o layout de texto.\r\n\r\nNo Unity 5.6, o recurso de relatório de desempenho foi melhorado de forma maciça. Agora, ele coleta todas as informações de ocorrências de falhas acontecendo no iOS. Além disso, o relatório de exceção foi adicionado e o perfilador foi aprimorado, o que ajudará a classificar os problemas de desempenho, conforme divulgado pelo C# Corner.\r\n\r\nUnity 5.6 está disponível para download e uso para usuários existentes, bem como para novos usuários. Para uma melhor compreensão e uma leitura completa dos recursos do Unity 5.6, consulte as release notes.', 'A plataforma de desenvolvimento de jogos 3D Unity foi atualizada para a versão 5.6 que, segundo a empresa, é a última do ciclo Unity 5.', 'luminarias.jpg', 'nao', 1, 5),
(21, '2017-11-05 12:45:56', 'IoT vai impactar a economia mundial em US$ 11 trilhões até 2025', 'A Internet das Coisas (IoT) vem sendo encarada com otimismo por setores da indústria, podendo se tornar um importante elemento econômico nas próximas décadas. &#13;&#10;&#13;&#10;Estima-se que o impacto econômico global vinculado ao cenário de IoT corresponda a mais de US$ 11 trilhões até 2025. “A IoT poderá trazer inúmeros benefícios aos consumidores. Dispositivos de saúde interconectados permitirão monitoramento mais constante e eficiente e interação mais eficaz entre paciente e médico. &#13;&#10;&#13;&#10;Sistemas de automação residencial permitirão que um consumidor, antes mesmo de chegar em casa, possa enviar mensagem para que os próprios dispositivos realizem ações para abrir os portões, desligar alarmes, preparar o banho quente, colocar música ambiente e alterar a temperatura da casa”, destacou o professor e pesquisador Eduardo Magrani, do Centro de Tecnologia e Sociedade da Fundação Getulio Vargas – FGV – Direito. &#13;&#10;&#13;&#10;De acordo com ele, o poder público demonstra já estar atento aos benefícios da IoT, entendendo que esta surge como importante ferramenta voltada para os desafios da gestão pública prometendo, a partir do uso de tecnologias integradas e do processamento massivo de dados, soluções mais eficazes para problemas como poluição, congestionamentos, criminalidade, eficiência produtiva, entre outros. &#13;&#10;&#13;&#10;Já existem exemplos de aplicações de IoT pelo País, e elas tendem a aumentar. Já no setor privado, o entusiasmo com o potencial econômico da IoT vem dando margem para um forte investimento nessa área, voltado para soluções de escala macro como cidades inteligentes, rastreamento de carga, agricultura de precisão e gerenciamento de energia e ativos. &#13;&#10;&#13;&#10;“Um exemplo desse tipo de investimento é o realizado pela empresa IBM, que não só empregou US$ 3 bilhões em seu negócio de IoT, como também fez uma parceria com a AT&#38;T para fornecer soluções IoT industriais em uma série de questões, desde a eficiência energética até serviços de saúde. &#13;&#10;&#13;&#10;Essas novas frentes de investimento em IoT decorrem das perspectivas de lucro positivo do setor. Somente a título de exemplo, cabe ressaltar a pesquisa recente realizada pela Cisco, que estima que a Internet das Coisas pode adicionar US$ 352 bilhões à economia brasileira até o final de 2022. &#13;&#10;&#13;&#10;Por conta de previsões como essa, diversas empresas estão investindo mais em tecnologias IoT, desenvolvendo iniciativas concretas em diversas áreas”, esclareceu Magrani.', 'Essa previsão em relação ao mercado de IoT foi feita por um professor da FGV.', 'mais.jpg', 'sim', 1, 2);

-- --------------------------------------------------------

--
-- Estrutura para tabela `usuarios`
--

CREATE TABLE `usuarios` (
  `id` smallint(6) NOT NULL,
  `nome` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `senha` varchar(255) NOT NULL,
  `tipo` enum('admin','editor') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `usuarios`
--

INSERT INTO `usuarios` (`id`, `nome`, `email`, `senha`, `tipo`) VALUES
(1, 'Agatha', 'agatha_giovanna@gmail.com', '$2y$10$1oOgzAIclXzC7.HClHZscO81P7KrBGR3JAI4ek9wDbwCJJ9ANO/SO', 'admin'),
(2, 'Vanessa', 'vanessa@gmail.com', '$2y$10$HrPFm4/KUBzt3AjnlLAkEeHucba6qJWUsENf1vjWCyigkdTWOgzDK', 'editor'),
(5, 'bueno', 'bueno@gmail.com', '$2y$10$/WhCIJqkQ4u56fFtBmgulOIuLeUthUmOfrD.sKMGAmNc/G.ocTY0O', 'editor');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `noticias`
--
ALTER TABLE `noticias`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_noticias_usuarios` (`usuario_id`),
  ADD KEY `fk_noticias_categorias` (`categoria_id`);

--
-- Índices de tabela `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id` smallint(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de tabela `noticias`
--
ALTER TABLE `noticias`
  MODIFY `id` mediumint(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT de tabela `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` smallint(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `noticias`
--
ALTER TABLE `noticias`
  ADD CONSTRAINT `fk_noticias_categorias` FOREIGN KEY (`categoria_id`) REFERENCES `categorias` (`id`) ON DELETE SET NULL ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_noticias_usuarios` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE SET NULL ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
