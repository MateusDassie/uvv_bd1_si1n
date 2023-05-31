-- Comando para sair do usuário (mateus_dassie) se existir.
DROP ROLE IF EXISTS mateus_dassie;

-- Comando para sair do banco de dados (uvv) se existir.
DROP DATABASE IF EXISTS uvv;

-- Comando para a criação de um usuário (mateus_dassie).
CREATE USER mateus_dassie
WITH ENCRYPTED PASSWORD 'dassie123';

-- Comando para a criação de um banco de dados (uvv).
CREATE DATABASE uvv
OWNER           mateus_dassie
TEMPLATE        template0
ENCODING   'UTF8'
LC_COLLATE 'pt_BR.UTF-8'
LC_CTYPE   'pt_BR.UTF-8'
allow_connections: TRUE;
 
-- Comando para garantir todas as permissões no banco de dados para o usuário (mateus_dassie).
GRANT ALL PRIVILEGES ON DATABASE uvv TO mateus_dassie;

-- Comando para conectar ao banco de dados (uvv) com o usuário "mateus_dassie".
\c "dbname=uvv user=mateus_dassie password=dassie123"

-- Comando para criar o schema (lojas) e autorização do usuário (mateus_dassie).
CREATE SCHEMA lojas AUTHORIZATION mateus_dassie;

-- Comando para demonstrar o "SEARCH_PATH" que está sendo usado.
SHOW SEARCH_PATH;

-- Comando para habilitar o "SEARCH_PATH" para o schema (lojas).
SET SEARCH_PATH TO lojas, "$user", public;

-- Comando para a criação da tabela (produtos) e a constante da chave primária da mesma (produto_id).
CREATE TABLE produtos (
                produto_id                NUMERIC(38)  NOT NULL,
                nome                      VARCHAR(255) NOT NULL,
                preco_unitario            NUMERIC(10,2),
                detalhes                  BYTEA,
                imagem                    BYTEA,
                imagem_mime_type          VARCHAR(512),
                imagem_arquivo            VARCHAR(512),
                imagem_charset            VARCHAR(512),
                imagem_ultima_atualizacao DATE,
CONSTRAINT produto_id PRIMARY KEY (produto_id)
);

-- Comandos para comentários na tabela produtos e em suas colunas.
COMMENT ON TABLE  produtos                           IS 'Esta é a tabela que possui os dados dos produtos.';
COMMENT ON COLUMN produtos.produto_id                IS 'Esta é a coluna que possui a chave da tabela "produtos".';
COMMENT ON COLUMN produtos.nome                      IS 'Esta é a coluna que possui o nome dos produtos.';
COMMENT ON COLUMN produtos.preco_unitario            IS 'Esta é a coluna que possui o preço unitário dos produtos.';
COMMENT ON COLUMN produtos.detalhes                  IS 'Esta é a coluna que possui os detalhes dos produtos.';
COMMENT ON COLUMN produtos.imagem                    IS 'Esta é a coluna que possui a imagem dos produtos.';
COMMENT ON COLUMN produtos.imagem_mime_type          IS 'Esta coluna possui o tipo de mídia da internet da imagem dos produtos.';
COMMENT ON COLUMN produtos.imagem_arquivo            IS 'Esta é a coluna que possui o arquivo de imagem dos produtos.';
COMMENT ON COLUMN produtos.imagem_charset            IS 'Esta é a coluna que possui a codificação de caracteres das imagens dos produtos.';
COMMENT ON COLUMN produtos.imagem_ultima_atualizacao IS 'Esta é a coluna que possui a última atualização da imagem dos produtos.';

-- Comando para a criação da tabela (lojas) e a constante da chave primária da mesma (loja_id).
CREATE TABLE lojas (
                loja_id                 NUMERIC(38)  NOT NULL,
                nome                    VARCHAR(255) NOT NULL,
                endereco_web            VARCHAR(100),
                endereco_fisico         VARCHAR(512),
                latitude                NUMERIC,
                longitude               NUMERIC,
                logo                    BYTEA,
                logo_mime_type          VARCHAR(512),
                logo_arquivo            VARCHAR(512),
                logo_charset            VARCHAR(512),
                logo_ultima_atualizacao DATE,
CONSTRAINT loja_id PRIMARY KEY (loja_id)
);

-- Comandos para comentários na tabela lojas e em suas colunas.
COMMENT ON TABLE  lojas                         IS 'Esta é a tabela que possui os dados das lojas.';
COMMENT ON COLUMN lojas.loja_id                 IS 'Esta é a coluna que possui a chave primária(PK) da tabela lojas.';
COMMENT ON COLUMN lojas.nome                    IS 'Esta é a coluna que possui o nome das lojas.';
COMMENT ON COLUMN lojas.endereco_web            IS 'Esta é a coluna que possui o endereço web dos sites das lojas.';
COMMENT ON COLUMN lojas.endereco_fisico         IS 'Esta é a coluna que possui o endereco físico das lojas.';
COMMENT ON COLUMN lojas.latitude                IS 'Esta é a coluna que possui a latitude das localizações das lojas.';
COMMENT ON COLUMN lojas.longitude               IS 'Esta é a coluna que possui a longitude das localizações das lojas.';
COMMENT ON COLUMN lojas.logo                    IS 'Esta é a coluna que possui a logo das lojas.';
COMMENT ON COLUMN lojas.logo_mime_type          IS 'Esta é a coluna que possui o tipo de mídia da internet das logos.';
COMMENT ON COLUMN lojas.logo_arquivo            IS 'Esta é a coluna que possui o arquivo da logo das lojas.';
COMMENT ON COLUMN lojas.logo_charset            IS 'Esta é a coluna que possui a codificação de caracteres da logo das lojas.';
COMMENT ON COLUMN lojas.logo_ultima_atualizacao IS 'Esta é a coluna que possui a última atualização da logo das lojas.';

-- Comando para a criação da tabela estoques e a constante da chave primária da mesma (estoque_id).
CREATE TABLE estoques (
                estoque_id NUMERIC(38) NOT NULL,
                loja_id    NUMERIC(38) NOT NULL,
                produto_id NUMERIC(38) NOT NULL,
                quantidade NUMERIC(38) NOT NULL,
CONSTRAINT estoque_id PRIMARY KEY (estoque_id)
);

-- Comandos para comentários na tabela estoques e em suas colunas.
COMMENT ON TABLE  estoques            IS 'Esta é a tabela que possui os dados dos estoques.';
COMMENT ON COLUMN estoques.estoque_id IS 'Esta é a coluna que possui a chave primária(PK) da tabela "estoques".';
COMMENT ON COLUMN estoques.loja_id    IS 'Esta é a coluna que possui a chave estrangeira(FK) da tabela lojas.';
COMMENT ON COLUMN estoques.produto_id IS 'Esta é a coluna que possui a chave estrangeira(FK) da tabela "produtos".';
COMMENT ON COLUMN estoques.quantidade IS 'Esta é a coluna que possui a quantidade dos estoques.';

-- Comando para a criação da tabela clientes e a constante da chave primária da mesma (cliente_id).
CREATE TABLE clientes (
                cliente_id NUMERIC(38)  NOT NULL,
                email      VARCHAR(255) NOT NULL,
                nome       VARCHAR(255) NOT NULL,
                telefone1  VARCHAR(20),
                telefone2  VARCHAR(20),
                telefone3  VARCHAR(20),
CONSTRAINT cliente_id PRIMARY KEY (cliente_id)
);

-- Comandos para comentários na tabela clientes e em suas colunas.
COMMENT ON TABLE  clientes            IS 'Esta é a tabela que possui os dados dos clientes.';
COMMENT ON COLUMN clientes.cliente_id IS 'Esta é a coluna que possui a chave primária(PK) da tabela "clientes".';
COMMENT ON COLUMN clientes.email      IS 'Esta é a coluna que possui o email dos clientes.';
COMMENT ON COLUMN clientes.nome       IS 'Esta é a coluna que possui o nome dos clientes.';
COMMENT ON COLUMN clientes.telefone1  IS 'Esta é a coluna que possui o primeiro número de telefone do cliente.';
COMMENT ON COLUMN clientes.telefone2  IS 'Esta é a coluna que possui o segundo número de telefone do cliente.';
COMMENT ON COLUMN clientes.telefone3  IS 'Esta é a coluna que possui o terceiro número de telefone do cliente.';

-- Comando para a criação da tabela envios e a constante da chave primária da mesma (envio_id).
CREATE TABLE envios (
                envio_id         NUMERIC(38)  NOT NULL,
                loja_id          NUMERIC(38)  NOT NULL,
                cliente_id       NUMERIC(38)  NOT NULL,
                endereco_entrega VARCHAR(512) NOT NULL,
                status           VARCHAR(15)  NOT NULL,
CONSTRAINT envio_id PRIMARY KEY (envio_id)
);

-- Comandos para comentários na tabela envios e em suas colunas.
COMMENT ON TABLE  envios                  IS 'Esta é a tabela que possui os dados dos envios.';
COMMENT ON COLUMN envios.envio_id         IS 'Esta é a coluna que possui a chave primária(PK) da tabela "envios".';
COMMENT ON COLUMN envios.loja_id          IS 'Esta é a coluna que possui a chave estrangeira(FK) da tabela lojas.';
COMMENT ON COLUMN envios.cliente_id       IS 'Esta é a coluna que possui a chave estrangeira(FK) da tabela "clientes".';
COMMENT ON COLUMN envios.endereco_entrega IS 'Esta é a coluna que possui o endereço de entrega dos envios.';
COMMENT ON COLUMN envios.status           IS 'Esta é a coluna que possui o status dos envios.';

-- Comando para a criação da tabela pedidos e a constante da chave primária da mesma (pedido_id).
CREATE TABLE pedidos (
                pedido_id  NUMERIC(38) NOT NULL,
                data_hora  TIMESTAMP   NOT NULL,
                cliente_id NUMERIC(38) NOT NULL,
                status     VARCHAR(15) NOT NULL,
                loja_id    NUMERIC(38) NOT NULL,
CONSTRAINT pedido_id PRIMARY KEY (pedido_id)
);

-- Comandos para comentários na tabela pedidos e em suas colunas.
COMMENT ON TABLE  pedidos            IS 'Esta é a tabela que possui os dados dos pedidos.';
COMMENT ON COLUMN pedidos.pedido_id  IS 'Esta é a coluna que possui a chave primária(PK) da tabela "pedidos".';
COMMENT ON COLUMN pedidos.data_hora  IS 'Esta é a coluna que possui a data e a hora dos pedidos.';
COMMENT ON COLUMN pedidos.cliente_id IS 'Esta é a coluna que possui a chave estrangeira (FK) da tabela "clientes".';
COMMENT ON COLUMN pedidos.status     IS 'Esta é a coluna que possui o status dos pedidos.';
COMMENT ON COLUMN pedidos.loja_id    IS 'Esta é a coluna que possui a chave estrangeira(FK) da tabela lojas.';

-- Comando para a criação da tabela pedidos_itens e a constante das chaves primárias da mesma (pedido_id e produto_id).
CREATE TABLE pedidos_itens (
                pedido_id       NUMERIC(38)   NOT NULL,
                produto_id      NUMERIC(38)   NOT NULL,
                numero_da_linha NUMERIC(38)   NOT NULL,
                preco_unitario  NUMERIC(10,2) NOT NULL,
                quantidade      NUMERIC(38)   NOT NULL,
                envio_id        NUMERIC(38),
CONSTRAINT pedido_idproduto_id PRIMARY KEY (pedido_id, produto_id)
);

-- Comandos para comentários na tabela pedidos_itens e em suas colunas.
COMMENT ON TABLE  pedidos_itens                 IS 'Esta é a tabela que possui os itens dos pedidos.';
COMMENT ON COLUMN pedidos_itens.pedido_id       IS 'Esta é a coluna que possui a chave primária(PK) da tabela "pedidos".';
COMMENT ON COLUMN pedidos_itens.produto_id      IS 'Esta é a coluna que possui a chave primária(PK) da tabela "produtos".';
COMMENT ON COLUMN pedidos_itens.numero_da_linha IS 'Esta é a coluna que possui o número da linha dos itens dos pedidos.';
COMMENT ON COLUMN pedidos_itens.preco_unitario  IS 'Esta é a coluna que possui o preço unitário dos itens dos pedidos.';
COMMENT ON COLUMN pedidos_itens.quantidade      IS 'Esta é a coluna que possui a quantidade dos itens dos pedidos.';
COMMENT ON COLUMN pedidos_itens.envio_id        IS 'Esta é a coluna que possui a chave estrangeira(FK) da tabela "envios".';

-- Comando para a alteração da tabela "estoques", feito para a adição da constante da chave estrangeira da tabela "produtos".
ALTER TABLE estoques ADD CONSTRAINT produtos_estoques_fk
FOREIGN KEY (produto_id)
REFERENCES produtos (produto_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

-- Comando para a alteração da tabela "pedidos_itens", feito para a adição da constante da chave estrangeira da tabela "produtos".
ALTER TABLE pedidos_itens ADD CONSTRAINT produtos_pedidos_itens_fk
FOREIGN KEY (produto_id)
REFERENCES produtos (produto_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

-- Comando para a alteração da tabela "pedidos", feito para a adição da constante da chave estrangeira da tabela "lojas".
ALTER TABLE pedidos ADD CONSTRAINT lojas_pedidos_fk
FOREIGN KEY (loja_id)
REFERENCES lojas (loja_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

-- Comando para a alteração da tabela "estoques", feito para a adição da constante da chave estrangeira da tabela "lojas".
ALTER TABLE estoques ADD CONSTRAINT lojas_estoques_fk
FOREIGN KEY (loja_id)
REFERENCES lojas (loja_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

-- Comando para a alteração da tabela "envios", feito para a adição da constante da chave estrangeira da tabela "lojas".
ALTER TABLE envios ADD CONSTRAINT lojas_envios_fk
FOREIGN KEY (loja_id)
REFERENCES lojas (loja_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

-- Comando para a alteração da tabela "pedidos", feito para a adição da constante da chave estrangeira da tabela "clientes".
ALTER TABLE pedidos ADD CONSTRAINT clientes_pedidos_fk
FOREIGN KEY (cliente_id)
REFERENCES clientes (cliente_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

-- Comando para a alteração da tabela "envios", feito para a adição da constante da chave estrangeira da tabela "clientes".
ALTER TABLE envios ADD CONSTRAINT clientes_envios_fk
FOREIGN KEY (cliente_id)
REFERENCES clientes (cliente_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

-- Comando para a alteração da tabela "pedidos_itens", feito para a adição da constante da chave estrangeira da tabela "envios".
ALTER TABLE pedidos_itens ADD CONSTRAINT envios_pedidos_itens_fk
FOREIGN KEY (envio_id)
REFERENCES envios (envio_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

-- Comando para a alteração da tabela "pedidos_itens", feito para a adição da constante da chave estrangeira da tabela "pedidos".
ALTER TABLE pedidos_itens ADD CONSTRAINT pedidos_pedidos_itens_fk
FOREIGN KEY (pedido_id)
REFERENCES pedidos (pedido_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

-- Comando para a alteração da tabela "pedidos", feito para a adição da constante de "checagem" para corrigir os status dos pedidos.
ALTER TABLE pedidos
ADD CONSTRAINT corrigir_status_pedidos
CHECK (status IN ('CANCELADO', 'COMPLETO', 'ABERTO', 'PAGO', 'REEMBOLSADO', 'ENVIADO'));

-- Comando para a alteração da tabela "envios", feito para a adição da constante de "checagem" para corrigir os status dos envios.
ALTER TABLE envios
ADD CONSTRAINT corrigir_status_envios
CHECK (status IN ('CRIADO', 'ENVIADO', 'TRANSITO', 'ENTREGUE'));

-- Comando para a alteração da tabela "lojas", feito para a adição da constante de "checagem" para corrigir os endereços das lojas.
ALTER TABLE lojas
ADD CONSTRAINT check_endereco_lojas
CHECK ((endereco_web IS NOT NULL) OR (endereco_fisico IS NOT NULL));
