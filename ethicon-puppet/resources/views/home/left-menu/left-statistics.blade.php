@if(App\Components\MenuTools::isShowMenu(['/admin/form/list','/admin/questionnaire/list'])) 

@if((isset($admin_form_tree_menu) && $admin_form_tree_menu) || (isset($admin_questionnaire_tree_menu) && $admin_questionnaire_tree_menu))
<li class="active treeview">
  @else
<li class="treeview">
  @endif
  <a href="#"><i class="fa fa-home"></i> <span><?php echo \App\Components\Tools::sLang('Information management', '信息管理');?></span>
    <span class="pull-right-container">
      <i class="fa fa-angle-left pull-right"></i>
    </span>
  </a>
  <ul class="treeview-menu">
    @if(App\Components\MenuTools::isShowMenu(['/admin/form/list']))
    <li @if((isset($admin_form_tree_menu) && $admin_form_tree_menu))class="active" @endif><a href="/admin/form/list"><i class="fa fa-circle-o"></i><?php echo \App\Components\Tools::sLang('Basic information', '基础信息');?></a></li>
    @endif
    @if(App\Components\MenuTools::isShowMenu(['/admin/questionnaire/list']))
    <li @if((isset($admin_questionnaire_tree_menu) && $admin_questionnaire_tree_menu))class="active" @endif><a href="/admin/questionnaire/list"><i class="fa fa-circle-o"></i><?php echo \App\Components\Tools::sLang('Questionnaire statistics', '问卷统计');?></a></li>
    @endif
  </ul>
</li>
@endif
