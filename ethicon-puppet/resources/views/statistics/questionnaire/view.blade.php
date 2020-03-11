@extends('home.parent')
<?php 
$title = \App\Components\Tools::sLang('Question view', '查看问题');
?>
@section('title',$title)
@section('head_js')
@endsection
@section('head_css')
@endsection
@section('content')
<div class="content-wrapper">
    <section class="content-header">
      <h1>
        <?php echo \App\Components\Tools::sLang('Question view', '查看问题');?>
        <small></small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="{{URL('admin')}}"><i class="fa fa-dashboard"></i> <?php echo \App\Components\Tools::sLang('Home page', '首页');?></a></li>
        <li><a href="{{URL('admin/questionnaire/list')}}"><?php echo \App\Components\Tools::sLang('Questionnaire statistics', '问卷统计');?></a></li>
        <li class="active"><?php echo \App\Components\Tools::sLang('Question view', '查看问题');?></li>
      </ol>
    </section> 
    <section class="invoice">
      <div class="row">
        <div class="col-xs-12">
          <p class="lead"></p>
          <div class="table-responsive">
            @if(!empty($data))
              <div>
                <h4>{{ $data['question_id'] }}.{!! $data['question'] !!}</h4>
                @if(!empty($data['answer_a']))
                <div style="margin-left:20px;">
                  {!! $data['answer_a'] !!}
                </div>
                @endif
                @if(!empty($data['answer_b']))
                <div style="margin-left:20px;">
                  {!! $data['answer_b'] !!}
                </div>
                @endif
                @if(!empty($data['answer_c']))
                <div style="margin-left:20px;">
                  {!! $data['answer_c'] !!}
                </div>
                @endif
                @if(!empty($data['answer_d']))
                <div style="margin-left:20px;">
                  {!! $data['answer_d'] !!}
                </div>
                @endif
                @if(!empty($data['answer_e']))
                <div style="margin-left:20px;">
                  {!! $data['answer_e'] !!}
                </div>
                @endif
                @if(!empty($data['answer_f']))
                <div style="margin-left:20px;">
                  {!! $data['answer_f'] !!}
                </div>
                @endif
                @if(!empty($questions))
                  @foreach($questions as $question)
                    <div style="margin-left: 30px;"><?php 
                      $answer = str_replace('a,', '',$question['value']);
                      $answer = str_replace('b,', '',$answer);
                      $answer = str_replace('c,', '',$answer);
                      $answer = str_replace('d,', '',$answer);
                      $answer = str_replace('e,', '',$answer);
                      $answer = str_replace('f,', '',$answer);
                      echo $answer;
                    ?></div>
                  @endforeach
                @endif
              </div>
            @endif
          </div>
        </div>
      </div>
    </section>
</div>
@endsection
@section('foot_js')
@endsection