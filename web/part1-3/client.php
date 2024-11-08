<?php
// Создаем сокет
$address = 'localhost';
$port = 10001;
if (($socket = socket_create(AF_INET, SOCK_STREAM, SOL_TCP)) < 0) {
    throw new Exception('socket_create() failed: '.socket_strerror(socket_last_error())."\n");
}

// Подключаемся к серверу
echo "Connect to '$address' port '$port'...";
if (socket_connect($socket, $address, $port) < 0) {
    throw new Exception('socket_connect() failed: '.socket_strerror(socket_last_error())."\n");
} else {
    echo "OK\n";
}

// Читаем приветственное сообщение от сервера
if (false === ($buf = socket_read($socket, 1024))) {
    throw new Exception('socket_read() failed: '.socket_strerror(socket_last_error())."\n");
} else {
    echo "Server said: $buf";
}

// Отправляем сообщение серверу
$message = "Hello, Server!\n";
socket_write($socket, $message, strlen($message));
echo "Say to server: ($message) ... OK\n";

// Читаем ответ от сервера
if (false === ($buf = socket_read($socket, 1024))) {
    throw new Exception('socket_read() failed: '.socket_strerror(socket_last_error())."\n");
} else {
    echo "Server said: $buf\n";
}

// Завершаем соединение
echo 'Close socket ... '; 
socket_close($socket);
echo "OK\n";
?>
