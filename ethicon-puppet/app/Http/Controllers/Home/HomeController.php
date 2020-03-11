<?php

namespace App\Http\Controllers\Home;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Log;
class HomeController extends Controller{
  private $params;
  private $code = 0;
  private $msg = '';
  private $data = [];
  public function __construct(Request $request) {
    $this->params = $request->all();
  }
    
  public function index(){
    return view('home/index');
  }
  
  public function dataSave(){
    Log::info("params=".json_encode($this->params));
    if(isset($this->params['name']) && !empty($this->params['name']) && isset($this->params['hospital']) && !empty($this->params['hospital'])
      && isset($this->params['title']) && !empty($this->params['title']) && isset($this->params['specialty']) && !empty($this->params['specialty']) && 
      isset($this->params['mobile']) && !empty($this->params['mobile']) && isset($this->params['operations_num']) && isset($this->params['endoscopic_rate'])
      && isset($this->params['qs_survey']) && !empty($this->params['qs_survey'])){
      $data['name'] = trim($this->params['name']);
      $data['hospital'] = trim($this->params['hospital']);
      $data['title'] = trim($this->params['title']);
      $data['specialty'] = trim($this->params['specialty']);
      $data['mobile'] = trim($this->params['mobile']);
      $data['operations_num_one_year'] = intval($this->params['operations_num']);
      $data['endoscopic_rate'] = intval($this->params['endoscopic_rate']);
      $data['qs_survey'] = $this->params['qs_survey'];
      $data['create_time'] = time();
      $oForm = new \App\Models\StatisticsModels\Form();
      $form_id = $oForm->db_insertGetId($data);
      if($form_id){
        $qs_survey = json_decode($this->params['qs_survey'],true);
        if(!empty($qs_survey)){
          $oFormQuestion = new \App\Models\StatisticsModels\FormQuestion();
          $oQuestionStatistics = new \App\Models\StatisticsModels\QuestionStatistics();
          foreach ($qs_survey as $val){
            $fqData = [];
            $fqData['form_id'] = $form_id;
            $fqData['question_id'] = $val['id'];
            if(strpos($val['answer'],',') === false){
              $fqData['answer'] = strtolower($val['answer']);//全部存小写选项
              $upper = strtoupper($val['answer']).',';
              $lower = strtolower($val['answer']).',';
              $fqData['value'] = str_replace($upper,'',trim($val['value']));
              $fqData['value'] = str_replace($lower,'',trim($val['value']));
              $oFormQuestion->db_insert($fqData);
            }else{
              $answer_arr = explode(',', $val['answer']);
              foreach ($answer_arr as $val_){
                if(!empty($val_)){
                  $fqData = [];
                  $fqData['answer'] = strtolower($val_);//全部存小写选项
                  if(!empty($val['value'])){
                    $value_arr = explode(',', $val['value']);
                    if(strtolower($val_) == strtolower($value_arr[0])){
                      $fqData['value'] = $value_arr[1];
                    }
                  }
                  $oFormQuestion->db_insert($fqData);
                }
              }
            }
            //存储统计数据
            $questionStatisticsData = $oQuestionStatistics->db_get(['question_id'=>['=',$val['id']]]);
            if(!empty($questionStatisticsData)){
              $fsData = [];
              $fsData['question_id'] = $val['id'];
              $answer_arr = explode(',', strtolower($val['answer']));
              if(in_array('a', $answer_arr)){
                $fsData['answer_a'] = $questionStatisticsData['answer_a'] + 1;
              }
              if(in_array('b', $answer_arr)){
                $fsData['answer_b'] = $questionStatisticsData['answer_b'] + 1;
              }
              if(in_array('c', $answer_arr)){
                $fsData['answer_c'] = $questionStatisticsData['answer_c'] + 1;
              }
              if(in_array('d', $answer_arr)){
                $fsData['answer_d'] = $questionStatisticsData['answer_d'] + 1;
              }
              if(in_array('e', $answer_arr)){
                $fsData['answer_e'] = $questionStatisticsData['answer_e'] + 1;
              }
              if(in_array('f', $answer_arr)){
                $fsData['answer_f'] = $questionStatisticsData['answer_f'] + 1;
              }
              $fsData['peoples'] = $questionStatisticsData['peoples'] + 1;
              $oQuestionStatistics->db_update('',$questionStatisticsData['id'],$fsData);
            }else{
              $fsData = [];
              $fsData['question_id'] = $val['id'];
              $answer_arr = explode(',', strtolower($val['answer']));
              if(in_array('a', $answer_arr)){
                $fsData['answer_a'] = 1;
              }
              if(in_array('b', $answer_arr)){
                $fsData['answer_b'] = 1;
              }
              if(in_array('c', $answer_arr)){
                $fsData['answer_c'] = 1;
              }
              if(in_array('d', $answer_arr)){
                $fsData['answer_d'] = 1;
              }
              if(in_array('e', $answer_arr)){
                $fsData['answer_e'] = 1;
              }
              if(in_array('f', $answer_arr)){
                $fsData['answer_f'] = 1;
              }
              $fsData['peoples'] = 1;
              $oQuestionStatistics->db_insert($fsData);
            }
          }
        }
        $this->msg = '保存成功';
      }else{
        $this->code = 1;
        $this->msg = '保存失败';
      }
    }else{
      $this->code = 1;
      $this->msg = '缺少数据';
    }
    echo json_encode(['code'=>$this->code,'msg'=>$this->msg,'data'=>$this->data]);
  }
}