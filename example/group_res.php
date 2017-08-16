<?php 

$data = require "./data.json";
$apm = [];
$funcs = $data['func_res'];
$tree = getTree($funcs, 0);

function getTree($data, $pId, $minTime = 0.001)
{   
    $tree = [];
    foreach($data as $k => $v) {
        if($v['pf_id'] == $pId) {
            $v['pf_id'] = getTree($data, $v['id'], $minTime);

            $v['children'] = $v['pf_id'];
            $v['state'] = ['opened' => true];
            unset($v['pf_id']);
            $v['text'] = $v['cf']."(响应时间:".round($v['t'], 4).")";

            $tree[] = $v;

            unset($data[$k]);
        }
    }

    return $tree;
}

?>
<!DOCTYPE html>
<html>
<head>
    <title></title>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

    <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/jstree/3.3.3/themes/default/style.min.css" />
    <script src="//cdnjs.cloudflare.com/ajax/libs/jstree/3.3.3/jstree.min.js"></script>
</head>
<body>
    <div id="container"></div>
    <script>
    $(function() {
      $('#container').jstree({
        'core' : {
            'data' : <?php echo json_encode($tree) ?>
        }
      });
    });
    </script>
</body>
</html>