@extends('home.parent')
<?php 
$title = \App\Components\Tools::sLang('Questionnaire statistics', '问卷统计');
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
        <?php echo \App\Components\Tools::sLang('Questionnaire statistics', '问卷统计');?>
        <small></small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="{{URL('admin')}}"><i class="fa fa-dashboard"></i> <?php echo \App\Components\Tools::sLang('Home page', '首页');?></a></li>
        <li class="active"><?php echo \App\Components\Tools::sLang('Questionnaire statistics', '问卷统计');?></li>
      </ol>
    </section> 
    <section class="invoice">
      <div class="row">
        <div class="col-xs-12">
          <p class="lead"></p>
          <div class="table-responsive">
            @if(!empty($questionList))
              @foreach($questionList as $question)
                <div>{{ $question['question_id'] }}.{!! $question['question'] !!}</div>
                <table class="table table-bordered table-striped" style="width:60%;margin-left:20px;">
                  <tr>
                    <td>选项</td>
                    <td>小计</td>
                    <td>比例</td>
                  </tr>
                  @if(!empty($question['answer_a']))
                  <tr>
                    <td>{!! $question['answer_a'] !!}</td>
                    <td>{{ $question['a_count'] }}</td>
                    <td>{{ intval($question['peoples']) == 0 ? 0 : (sprintf("%.2f",$question['a_count']/$question['peoples'])*100) }}%</td>
                  </tr>
                  @endif
                  @if(!empty($question['answer_b']))
                  <tr>
                    <td>{!! $question['answer_b'] !!}</td>
                    <td>{{ $question['b_count'] }}</td>
                    <td>{{ intval($question['peoples']) == 0 ? 0 : (sprintf("%.2f",$question['b_count']/$question['peoples'])*100) }}%</td>
                  </tr>
                  @endif
                  @if(!empty($question['answer_c']))
                  <tr>
                    <td>{!! $question['answer_c'] !!}</td>
                    <td>{{ $question['c_count'] }}</td>
                    <td>{{ intval($question['peoples']) == 0 ? 0 : (sprintf("%.2f",$question['c_count']/$question['peoples'])*100) }}%</td>
                  </tr>
                  @endif
                  @if(!empty($question['answer_d']))
                  <tr>
                      <td>{!! $question['answer_d'] !!}<?php if(strpos($question['answer_d'],"其他") !== false){?><a href="{{URL('admin/questionnaire/show').'/'.$question['question_id']}}" target="_blank">查看</a><?php }?></td>
                    <td>{{ $question['d_count'] }}</td>
                    <td>{{ intval($question['peoples']) == 0 ? 0 : (sprintf("%.2f",$question['d_count']/$question['peoples'])*100) }}%</td>
                  </tr>
                  @endif
                  @if(!empty($question['answer_e']))
                  <tr>
                    <td>{!! $question['answer_e'] !!}<?php if(strpos($question['answer_e'],"其他") !== false){?><a href="{{URL('admin/questionnaire/show').'/'.$question['question_id']}}" target="_blank">查看</a><?php }?></td>
                    <td>{{ $question['e_count'] }}</td>
                    <td>{{ intval($question['peoples']) == 0 ? 0 : (sprintf("%.2f",$question['e_count']/$question['peoples'])*100) }}%</td>
                  </tr>
                  @endif
                  @if(!empty($question['answer_f']))
                  <tr>
                    <td>{!! $question['answer_f'] !!}<?php if(strpos($question['answer_f'],"其他") !== false){?><a href="{{URL('admin/questionnaire/show').'/'.$question['question_id']}}" target="_blank">查看</a><?php } ?></td>
                    <td>{{ $question['f_count'] }}</td>
                    <td>{{ intval($question['peoples']) == 0 ? 0 : (sprintf("%.2f",$question['f_count']/$question['peoples'])*100) }}%</td>
                  </tr>
                  @endif
                  <tr>
                    <td>本题有效填写人数</td>
                    <td>{{ $question['peoples'] }}</td>
                    <td>{{ intval($question['peoples']) == 0 ? 0 : 100 }}%</td>
                  </tr>
                </table>
                <br>
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