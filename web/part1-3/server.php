<?php
// Устанавливаем время выполнения скрипта неограниченным
set_time_limit(0);

// Создаем сокет
echo 'Create socket ... ';
if (($sock = socket_create(AF_INET, SOCK_STREAM, SOL_TCP)) < 0) {
    throw new Exception('socket_create() failed: '.socket_strerror(socket_last_error())."\n");
} else {
    echo "OK\n";
}

// Привязываем сокет к адресу и порту
$address = 'localhost'; 
$port = 10001; 
echo 'Bind socket ... ';
if (($ret = socket_bind($sock, $address, $port)) < 0) {
    throw new Exception('socket_bind() failed: '.socket_strerror(socket_last_error())."\n");
} else {
    echo "OK\n";
}

// Включаем прослушивание сокета
echo 'Listen socket ... '; 
if (($ret = socket_listen($sock, 5)) < 0) {
    throw new Exception('socket_listen() failed: '.socket_strerror(socket_last_error())."\n");
} else {
    echo "OK\n";
}

// Основной цикл
do {
    echo 'Accept socket ... '; 
    if (($msgsock = socket_accept($sock)) < 0) {
        throw new Exception('socket_accept() failed: '.socket_strerror(socket_last_error())."\n");
    } else {
        echo "OK\n";
    }

    // Отправляем приветственное сообщение
    $msg = "Hello, Client!\n"; 
    socket_write($msgsock, $msg, strlen($msg));
    echo "Say to client: ($msg) ... OK\n";

    // Читаем сообщение от клиента
    echo 'Client said: '; 
    if (false === ($buf = socket_read($msgsock, 1024, PHP_NORMAL_READ))) {
        throw new Exception('socket_read() failed: '.socket_strerror(socket_last_error())."\n");
    } else {
        echo "$buf\n";
    }

    // Отправляем обратно клиенту то, что он сказал
    socket_write($msgsock, $buf, strlen($buf));
    
    // Если клиент сказал "shutdown", завершаем сервер
    if (trim($buf) === 'shutdown') {
        echo "Shutting down server...\n";
        break;
    }

    socket_close($msgsock);
} while (true);

// Закрываем сокет
echo 'Close socket ... '; 
socket_close($sock); 
echo "OK\n";
?>