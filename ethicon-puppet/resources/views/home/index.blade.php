@extends('home.parent')
<?php 
$title = env('SYSTEM_NAME','PUPPET');
$title .= \App\Components\Tools::sLang('Background Management System', '后台管理系统');
?>
@section('title',$title)
@section('head_js')
@endsection
@section('head_css')
<style>
    .users-list img{
        min-width:80px;
        min-height:80px;
        max-width:80px;
        max-height:80px;
    }
    .skillstore>li img{
        border-radius:0%;
    }
</style>
@endsection
@section('content')
<div class="content-wrapper">
  <section class="content-header">
    <h1>{{ env('SYSTEM_NAME','PUPPET') }} <?php echo \App\Components\Tools::sLang('Background Management System', '后台管理系统');?></h1>
    <ol class="breadcrumb">
      <!-- <li><a href="{{URL('appstore')}}"><i class="fa fa-dashboard"></i>appstore</a></li> -->
    </ol>
  </section>
  <section class="content">
    <!-- 新品推荐end -->
  </section>
</div>
@endsection
@section('foot_js')
@endsection