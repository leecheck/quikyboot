var api = {};

api.login = "/login/do";

api.sysuser_add = "/main/sysUser/add";
api.sysuser_edit = "/main/sysUser/edit";
api.sysuser_del = "/main/sysUser/del";
api.sysuser_edit_pass = "/main/sysUser/edit/pass";
api.sysuser_query = "/main/sysUser/query";
api.sysUser_role_update = "/main/sysUser/role/update";
api.sysuser_usernameDump = "/main/sysUser/usernameDump";
api.sysuser_orgid = "/main/sysUser/orgid";

api.sysrole_query = "/main/sysRole/query";
api.sysrole_edit = "/main/sysRole/edit";
api.sysrole_del = "/main/sysRole/del";
api.sysrole_add = "/main/sysRole/add";
api.sysrole_query_uid = "/main/sysRole/query/uid";
api.sysrole_menu_update = "/main/sysRole/menu/update";
api.sysrole_roleCodeDump = "/main/sysRole/roleCodeDump";
api.sysrole_roleNameDump = "/main/sysRole/roleNameDump";


api.sysOrg_tree = "/main/sysOrg/tree";
api.sysOrg_query = "/main/sysOrg/query";
api.sysOrg_edit = "/main/sysOrg/edit";
api.sysOrg_add = "/main/sysOrg/add";
api.sysOrg_del = "/main/sysOrg/del";
api.sysOrg_organCodeDump = "/main/sysOrg/organCodeDump";


api.sysDict_tree = "/main/sysDict/tree";
api.sysDict_query = "/main/sysDict/query";
api.sysDict_edit = "/main/sysDict/edit";
api.sysDict_add = "/main/sysDict/add";
api.sysDict_del = "/main/sysDict/del";
api.sysDict_dictCodeDump = "/main/sysDict/dictCodeDump";

api.sysMaplayer_query = "/main/sysMaplayer/query";
api.sysMaplayer_edit = "/main/sysMaplayer/edit";
api.sysMaplayer_add = "/main/sysMaplayer/add";
api.sysMaplayer_del = "/main/sysMaplayer/del";

api.getLayerGroup = "/main/sysMaplayer/get/layerGroup";
api.getMapConfig = "/main/sysMaplayer/get/mapConfig";
api.getLayerType = "/main/sysMaplayer/get/layerType";

//台站
api.tbstatinfo_query = "/work/tbStationinfo/query";
api.tbstatinfo_edit = "/work/tbStationinfo/edit";
api.tbstatinfo_add = "/work/tbStationinfo/add";
api.tbstatinfo_del = "/work/tbStationinfo/del";
api.tbstatinfo_createtb = "/work/tbStationinfo/createNewTab";
api.tbstatinfo_childDump = "/work/tbStationinfo/childDump";//新增

//系统日志
api.tbsystemlog_query = "/work/tbSystemLog/query";
api.tbsystemlog_del = "/work/tbSystemLog/del";

//操作日志
api.syslog_query = "/main/sysLog/query";
api.syslog_del = "/main/sysLog/del";
api.syslog_logType = "/main/sysLog/logType";
//任务
api.tbtask_query = "/work/tbTaskModel/query";
api.tbtask_queryname = "/work/tbTaskModel/queryStat";//台站
api.tbtask_add = "/work/tbTaskModel/add";
api.tbtask_edit = "/work/tbTaskModel/edit";
api.tbtask_del = "/work/tbTaskModel/del";
//运行日志
api.sysrunlog_query = "/main/sysRunLog/query";
api.sysrunlog_del = "/main/sysRunLog/del";
//异常信息
api.tbabnormal_query = "/work/tbAbnormal/query";
api.tbabnormal_query_name = "/work/tbAbnormal/queryStat";//台站
api.tbabnormal_del = "/work/tbAbnormal/del";
//频谱
api.tbspectdate_query = "/work/tbSpectrumdata/query";
api.tbspectdate_queryTask = "/work/tbSpectrumdata/querySpectDate";//回放
//菜单
api.sysmenu_tree = "/main/sysMenu/tree";
api.sysmenu_query = "/main/sysMenu/query";
api.sysmenu_add = "/main/sysMenu/add";
api.sysmenu_edit = "/main/sysMenu/edit";
api.sysmenu_del = "/main/sysMenu/del";
api.sysmenu_childNameDump = "/main/sysMenu/childNameDump";
api.sysmenu_query_roleid = "/main/sysMenu/query/RoleId";
//区域
api.sysarea_tree = "/main/sysArea/tree";
api.sysarea_query = "/main/sysArea/query";
api.sysarea_add = "/main/sysArea/add";
api.sysarea_edit = "/main/sysArea/edit";
api.sysarea_del = "/main/sysArea/del";
api.sysarea_areaCodeDump = "/main/sysArea/areaCodeDump";
//文件
api.sysfile_add = "/main/sysFile/add";
api.sysfile_query = "/main/sysFile/query";
api.sysfile_del = "/main/sysFile/del";
api.sysfile_edit = "/main/sysFile/edit";
api.sysfile_download = "/main/sysFile/download";
//数据库备份
api.sysStore_query = "/main/sysStore/query";
api.sysStore_add = "/main/sysStore/add";
api.sysStore_connect = "/main/sysStore/connect";
api.sysStore_del = "/main/sysStore/del";
api.sysStore_backup = "/main/sysStore/backup";
api.sysStore_cornEdit = "/main/sysStore/corn/edit";
