@extends('home.parent')
<?php 
$title = \App\Components\Tools::sLang('Questionnaire view', '查看问卷');
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
        <?php echo \App\Components\Tools::sLang('Questionnaire view', '查看问卷');?>
        <small></small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="{{URL('admin')}}"><i class="fa fa-dashboard"></i> <?php echo \App\Components\Tools::sLang('Home page', '首页');?></a></li>
        <li><a href="{{URL('admin/form/list')}}"><?php echo \App\Components\Tools::sLang('Information management', '信息管理');?></a></li>
        <li class="active"><?php echo \App\Components\Tools::sLang('Questionnaire view', '查看问卷');?></li>
      </ol>
    </section> 
    <section class="invoice">
      <div class="row">
        <div class="col-xs-12">
          <p class="lead"></p>
          <div class="table-responsive">
            <div>姓名：{{ $data['name'] }}</div>
            <div>手机号：{{ $data['mobile'] }}</div>
            @if(!empty($questions))
              @foreach($questions as $question)
              <div>
                <h4>{{ $question['question_id'] }}.{!! $question['question'] !!}</h4>
                @if(!empty($question['answer_a']))
                  <div style="margin-left:20px;">
                    <?php if($question['a'][0] == 1){?>
                      <input type='checkbox' disabled="disabled" checked="checked"/>
                    <?php }else{ ?>
                      <input type='checkbox' disabled="disabled"/>
                    <?php } ?>
                    {!! $question['answer_a'] !!}
                    <?php if(!empty($question['a'][1])){ echo '<br>&nbsp;&nbsp;&nbsp;&nbsp;'.str_replace('a,', '',$question['a'][1]);}?>
                  </div>
                @endif
                @if(!empty($question['answer_b']))
                  <div style="margin-left:20px;">
                    <?php if($question['b'][0] == 1){?>
                      <input type='checkbox' disabled="disabled" checked="checked"/>
                    <?php }else{ ?>
                      <input type='checkbox' disabled="disabled"/>
                    <?php } ?>
                    {!! $question['answer_b'] !!}
                    <?php if(!empty($question['b'][1])){ echo '<br>&nbsp;&nbsp;&nbsp;&nbsp;'.str_replace('b,', '',$question['b'][1]);}?>
                  </div>
                @endif
                @if(!empty($question['answer_c']))
                  <div style="margin-left:20px;">
                    <?php if($question['c'][0] == 1){?>
                      <input type='checkbox' disabled="disabled" checked="checked"/>
                    <?php }else{ ?>
                      <input type='checkbox' disabled="disabled"/>
                    <?php } ?>
                    {!! $question['answer_c'] !!}
                    <?php if(!empty($question['c'][1])){ echo '<br>&nbsp;&nbsp;&nbsp;&nbsp;'.str_replace('c,', '',$question['c'][1]);}?>
                  </div>
                @endif
                @if(!empty($question['answer_d']))
                  <div style="margin-left:20px;">
                    <?php if($question['d'][0] == 1){?>
                      <input type='checkbox' disabled="disabled" checked="checked"/>
                    <?php }else{ ?>
                      <input type='checkbox' disabled="disabled"/>
                    <?php } ?>
                    {!! $question['answer_d'] !!}
                    <?php if(!empty($question['d'][1])){ echo '<br>&nbsp;&nbsp;&nbsp;&nbsp;'.str_replace('d,', '',$question['d'][1]);}?>
                  </div>
                @endif
                @if(!empty($question['answer_e']))
                  <div style="margin-left:20px;">
                    <?php if($question['e'][0] == 1){?>
                      <input type='checkbox' disabled="disabled" checked="checked"/>
                    <?php }else{ ?>
                      <input type='checkbox' disabled="disabled"/>
                    <?php } ?>
                    {!! $question['answer_e'] !!}
                    <?php if(!empty($question['e'][1])){ echo '<br>&nbsp;&nbsp;&nbsp;&nbsp;'.str_replace('e,', '',$question['e'][1]);}?>
                  </div>
                @endif
                @if(!empty($question['answer_f']))
                  <div style="margin-left:20px;">
                    <?php if($question['f'][0] == 1){?>
                      <input type='checkbox' disabled="disabled" checked="checked"/>
                    <?php }else{ ?>
                      <input type='checkbox' disabled="disabled"/>
                    <?php } ?>
                    {!! $question['answer_f'] !!}
                    <?php if(!empty($question['f'][1])){ echo '<br>&nbsp;&nbsp;&nbsp;&nbsp;'.str_replace('f,', '',$question['f'][1]);}?>
                  </div>
                @endif
              </div>
              @endforeach
            @endif
          </div>
        </div>
      </div>
    </section>
</div>
@endsection
@section('foot_js')
@endsection