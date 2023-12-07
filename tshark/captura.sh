#!/bin/bash

# Diretório onde o arquivo PCAP fica armazenado.
pcap_directory="/inserir/caminho/dodiretorio"

# Nome fixo do arquivo PCAP
pcap_file="$pcap_directory/trafego_$(date
+%Y%m%d_%H%M%S).pcapng"

# Diretório para mover o arquivo após a coleta
destination_directory=""/inserir/caminho/dodiretorio""

# Endereço IP ou sub-rede a ser monitorada
subnet="INSERIR REDE EX: 192.168.0.1/24"

# Interface de rede a ser usada
interface="eth0"

# Duração da captura em segundos (1 horas = 3600 segundos)
duration=3600

# Iniciar a captura com o Tshark e salvar no arquivo PCAP
/usr/bin/tshark -i "$interface" -w "$pcap_file" -a duration:"$duration" -
f "net $subnet" &

# Obter o PID do processo do Tshark
tshark_pid=$!

# Aguardar o tempo de captura (1 horas)
sleep "$duration"

# Matar o processo do Tshark usando o PID
kill "$tshark_pid"

# Mover o arquivo de captura para a pasta de destino
mv "$pcap_file" "$destination_directory"
