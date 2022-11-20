create table contratos (
    VALOR_PARCELA int,
    PARCELAS int,
    ID PRIMARY KEY
);

create table pagamentos (
    PESSOA_ID int REFERENCES pessoas(ID),
    DT_PAGAMENTO date,
    ID PRIMARY KEY
);

create table pessoas (
    NOME varchar (50),
    CONTRATO_ID int REFERENCES contratos(ID),
    INADIMPLENTE varchar (50),
    DT_COMPLETO date,
    ID PRIMARY KEY,
);

/*inserindo dados no banco*/
INSERT INTO pessoas (NOME, CONTRATO_ID, INADIMPLENTE, DT_COMPLETO)
VALUES ("Cristian Ghyprievy", 2, "S", "Null"),("Joana Cabel", 1, "S", "Null"),("John Serial", 3, "S", "Null"),("Michael Seven", 2, "N", "2021-09-25");

INSERT INTO contratos (VALOR_PARCELA, PARCELAS)
VALUES (150, 100),(300, 48), (550, 24), (1000, 12);

INSERT INTO pagamentos (PESSOA_ID, DT_PAGAMENTO)
VALUES (4, "2021-09-01"),(3, "2021-09-05"),(1, "2021-09-19"),(2, "2021-09-25");

/* CONSULTAS*/

/* 1- Selecionar o nome, dia do mês e valor da parcela para clientes que estão inadimplentes */
SELECT NOME, day(DT_PAGAMENTO) as DIA_MES, VALOR_PARCELA
FROM pessoas, pagamentos, contratos
WHERE INADIMPLENTE = 'S' AND CONTRATO_ID = contratos.ID AND PESSOA_ID = pessoas.ID
ORDER BY NOME;

/* 2-Selecionar o nome e valor total pago de clientes com pagamento completo */
SELECT NOME, VALOR_PARCELA * PARCELAS as VALOR_TOTAL
FROM pessoas, contratos
WHERE INADIMPLENTE = 'N' AND CONTRATO_ID = contratos.ID;LECT * FROM demo;