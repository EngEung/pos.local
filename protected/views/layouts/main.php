<?php Yii::app()->bootstrap->registerAssetCss("bootstrap.css");?>
<?php /* @var $this Controller */ ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="language" content="en" />
    <?php //Yii::app()->bootstrap->registerAssetCss("bootstrap.css");?>
    <link rel="stylesheet" type="text/css" href="<?php echo Yii::app()->request->baseUrl; ?>/js/jquery-easyui/themes/bootstrap/easyui.css" />
    <link rel="stylesheet" type="text/css" href="<?php echo Yii::app()->request->baseUrl; ?>/css/main.css" />
</head>

<body class="easyui-layout layout panel-noscroll easyui-fluid" style="text-align: left;">
    
        <div data-options="region:'north'" style="height:70px;background:#F5F5F5;">
            <div id="header">
                <div id="header-content">
                    <div id="logo">
                        <a href="/">
                            Logo
                        </a>
                    </div>
                    <div id="top-panel">
                       <div id="top-menu">
                            <div class="top-hori-menu">
                                <ul>
                                    <?php echo $this->getTopMenu();?>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div data-options="region:'west',split:true" title="Operations" style="width:250px;">
                 <?php echo $this->getLeftMenu();?>
        </div>
        <div data-options="region:'center',title:'Welcome',iconCls:'', height:570">
             <div id="tab_dashboard" class="easyui-tabs" style="width:auto;height: 570px;">
               
             </div>
            
        </div>
</body>

<script>
      
     function addTabDashboard(title, url){
        if ($('#tab_dashboard').tabs('exists', title)){
            $('#tab_dashboard').tabs('select', title);
        } else {
            var content ='<iframe scrolling="yes" frameborder="0"  src="'+url+'" style="width:100%;height:100%;"></iframe>';
            $('#tab_dashboard').tabs('add',{
                            title:title,
                            content:content,
                            closable:true
            });
        }
      }
    //  addTabDashboard("Dasboard", '');
    $("#btnSignins").click(function(){
        alert('sdfsdf');
    });
</script>
</html>
