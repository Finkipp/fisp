<?php
// Получаем имя файла с подробным описанием товара
$descFile = $_GET['product'] ?? '';

// Проверяем существование файла
if (!file_exists($descFile)) {
    die('Файл с подробным описанием не найден');
}

// Читаем содержимое файла
$content = file_get_contents($descFile);
?>

<!doctype html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <title>Подробное описание товара</title>
</head>
<body>
<h1>Подробное описание</h1>
<p><?= nl2br(htmlspecialchars($content)) ?></p>
<a href="index.php">Вернуться к списку товаров</a>
</body>
</html>
