<@l.simple title="首页" import=""
js="js/lib.js"
css="js/leaflet/MiniMap.css">

    <div id="index">
        <h1>Hello world,${list!}</h1>
        <a href="<@c.rootPath/>/admin/sysUser/list">用户管理</a></h1><br>
        <h1><i class="ivu-icon ivu-icon-ios-appstore"></i><a href="<@c.rootPath/>/logout">注销</a></h1><br>

        <br>
        <br>
        <br>
        <br>
        <br>
    </div>

    <style type="text/css">

    </style>

    <script type="text/javascript">
        <@c.userDetail></@c.userDetail>
    </script>
</@l.simple>
