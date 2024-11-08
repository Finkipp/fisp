<?php
// Открываем файл с товарами
$productsFile = 'products.txt';
if (!file_exists($productsFile)) {
    die('Файл с товарами не найден');
}

// Читаем данные из файла
$lines = file($productsFile);
?>

<!doctype html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <title>Список товаров</title>
</head>
<body>
<h1>Список товаров</h1>
<ul>
    <?php foreach ($lines as $line) { ?>
        <?php
            // Разделяем строку на части
            list($code, $name, $price, $descFile) = explode('#', trim($line));
        ?>
        <li>
            <a href="description.php?product=<?= urlencode($descFile) ?>"><?= htmlspecialchars($name) ?></a> (Цена: <?= number_format($price, 0, '.', ' ') ?>&nbsp;руб.)
        </li>
    <?php } ?>
</ul>
</body>
</html>
