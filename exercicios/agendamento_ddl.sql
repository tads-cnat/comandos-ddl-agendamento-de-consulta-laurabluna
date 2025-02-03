CREATE TABLE paciente 
(
    cpf_pessoa VARCHAR(11) NOT NULL,
    senha VARCHAR(100) NOT NULL,
    plano_saude VARCHAR(100) NOT NULL,
    FOREIGN KEY (cpf_pessoa) REFERENCES pessoa(cpf)
); 

CREATE TABLE pessoa 
(
    cpf VARCHAR(11) PRIMARY KEY,
    email VARCHAR(100) NOT NULL, 
    nome VARCHAR(100) NOT NULL,
    data_nasc DATE NOT NULL,
    endereco TEXT NOT NULL,
    telefone VARCHAR(15) NOT NULL
)

CREATE TABLE medico (
    cpf_pessoa VARCHAR(11) PRIMARY KEY,  
    crm VARCHAR(20) UNIQUE NOT NULL,  
    especialidade_id INT,  
    FOREIGN KEY (cpf_pessoa) REFERENCES pessoa(cpf)  
);

CREATE TABLE especialidade (
    id INT PRIMARY KEY AUTO_INCREMENT, 
    descricao VARCHAR(255) NOT NULL  
);

CREATE TABLE medico_especialidade (
    cpf_medico VARCHAR(11), 
    id_especialidade INT,  
    PRIMARY KEY (cpf_medico, id_especialidade),  
    FOREIGN KEY (cpf_medico) REFERENCES medico(cpf_pessoa),  
    FOREIGN KEY (id_especialidade) REFERENCES especialidade(id)  
);

CREATE TABLE agendamento (
    cpf_paciente VARCHAR(11),  
    dh_consulta DATETIME,  
    cpf_medico VARCHAR(11),  
    dh_agendamento DATETIME, 
    valor_consulta DECIMAL(10, 2),  
    PRIMARY KEY (dh_consulta), 
    FOREIGN KEY (cpf_paciente) REFERENCES pessoa(cpf),  
    FOREIGN KEY (cpf_medico) REFERENCES medico(cpf_pessoa)  
);
