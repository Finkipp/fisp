<?php
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $name = $_POST['name'];
    $signature = $_POST['signature'];
    $background_color = $_POST['background_color'];
    $border = isset($_POST['border']) ? '1' : '0';
    $rows = $_POST['rows'];
    $columns = $_POST['columns'];
    $cell_fill = $_POST['cell_fill'];
    $image_uploaded = false;

    // Обработка загрузки изображения
    if (isset($_FILES['background_image']) && $_FILES['background_image']['error'] == UPLOAD_ERR_OK) {
        $target_dir = "uploads/";
        $target_file = $target_dir . basename($_FILES["background_image"]["name"]);

        $imageFileType = strtolower(pathinfo($target_file, PATHINFO_EXTENSION));

        // Проверка типа файла
        if (in_array($imageFileType, ['jpg', 'jpeg', 'png', 'gif'])) {
            move_uploaded_file($_FILES["background_image"]["tmp_name"], $target_file);
            $image_uploaded = $target_file; // Сохраним путь к изображению
        } else {
            echo "Неверный формат изображения!";
            exit;
        }
    }

    // Вывод результата
    echo "<h1>Уважаемый(ая) $name!</h1>";
    echo "<p>Мы рады приветствовать вас на наших курсах.</p>";
    echo "<p>Надеемся на дальнейшее сотрудничество.</p>";

    echo "<h2>$signature</h2>";

    echo "<table style='background-color: $background_color; ";
    if ($border) {
        echo "border: 1px solid black; border-collapse: collapse;";
    }
    echo "'>";

    for ($i = 0; $i < $rows; $i++) {
        echo "<tr>";
        for ($j = 0; $j < $columns; $j++) {
            if ($cell_fill == 'row_col') {
                echo "<td>" . ($i + 1) . ", " . ($j + 1) . "</td>";
            } elseif ($cell_fill == 'zeros') {
                echo "<td>0</td>";
            } elseif ($cell_fill == 'empty') {
                echo "<td></td>";
            } elseif ($cell_fill == 'stars') {
                echo "<td>*</td>";
            }
        }
        echo "</tr>";
    }

    echo "</table>";

    // Установка фона документа, если изображение загружено
    if ($image_uploaded) {
        echo "<style>body { background-image: url('$image_uploaded'); background-size: cover; }</style>";
    }
} else {
    echo "Неверный запрос!";
}

