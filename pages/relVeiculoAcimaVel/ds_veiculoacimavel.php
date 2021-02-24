<?php

$where = '';

if(!empty($_REQUEST['placa'])) {
    $where = "WHERE v.placa LIKE '%{$_REQUEST['placa']}%'";
}

$db = new Database();

if($db->connect()) {

    $dados = $db->sqlQueryArray(
        "SELECT
            v.placa,
            f.nome,
            r.data,
            v.vel_maxima,
            r.velocidade,
            r.latitude,
            r.longitude
        FROM rastreamento r
        INNER JOIN veiculo v ON v.id = r.veiculo_id AND v.vel_maxima < r.velocidade
        INNER JOIN funcionario f ON f.id = r.funcionario_id
        {$where}"
    );
   
        $dadosarray = (array) $dados;
        $dados = (array)$dados;

    for ($i = 0; $i < sizeof($dados); $i++) {
        $velocidade_permitida = $dadosarray[$i]['vel_maxima'];
        $velocidade = $dadosarray[$i]['velocidade'];
        $diferencaVel = 100 * $velocidade / $velocidade_permitida - 100;
        $diferencaVel = round($diferencaVel);
        $diferencaVel = strval($diferencaVel);
        $diferencaVel = $diferencaVel . "%";
        $dados[$i]['diferencaVel'] = $diferencaVel;
    }

    
    echo json_encode(array(
        'status' => 'success',
        'data' => $dados
    ));
} else {
    echo json_encode(array(
        'status' => 'failure',
        'message' => 'Erro ao conectar ao banco'
    ));
}