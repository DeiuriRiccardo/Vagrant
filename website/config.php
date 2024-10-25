<?php
$servername = "10.10.20.11";
$username = "webuser";
$password = "webpass";
$dbname = "web_db";

try {
    $conn = new mysqli($servername, $username, $password, $dbname);

    echo "<h1 style='color: green;'>Connessione al database MySQL riuscita!</h1>";

    $sql = "SELECT * FROM persons;";
    $result = $conn->query($sql);

    if ($result->num_rows > 0) {
        echo "<p>Ecco il contenuto della tabella 'persons':</p>";
        echo "<table border='1'>
                <tr>
                    <th>ID</th>
                    <th>Cognome</th>
                    <th>Nome</th>
                    <th>Indirizzo</th>
                    <th>Città</th>
                </tr>";
        while ($row = $result->fetch_assoc()) {
            echo "<tr>
                    <td>" . $row["personID"] . "</td>
                    <td>" . $row["lastName"] . "</td>
                    <td>" . $row["firstName"] . "</td>
                    <td>" . $row["address"] . "</td>
                    <td>" . $row["city"] . "</td>
                </tr>";
        }
        echo "</table>";
    } else {
        echo "<p>Non ci sono righe nella tabella 'persons'.</p>";
    }

    $conn->close();
} catch (Exception $ex) {
    echo "<h1 style='color: red;'>Connessione al database fallita.</h1>";
}
?>
