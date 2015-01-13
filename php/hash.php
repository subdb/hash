/**
 * Author: Raphael Santiago <https://github.com/RafaelSantiago>
 * Excerpt from the project php-subdb
 */

function hashSubDB($filename){
    $size = filesize($filename);
    $inicio = file_get_contents($filename, false, null, 0, 64 * 1024);
    $fim = file_get_contents($filename, false, null, $size - (64 * 1024), 64 * 1024);
    $data = $inicio . $fim;
    $hash = md5($data);
    return $hash;
}
