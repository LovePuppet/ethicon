<?php
namespace App\Http\Controllers\Statistics;
use App\Http\Controllers\Controller;
use App\Models\StatisticsModels\Form;
use App\Components\Tools;
class FormController extends Controller{
  public function index(){
    return view('statistics/form/index',['admin_form_tree_menu'=>true]);
  }
  
  public function show($id){
    $oForm = new Form();
    $data = $oForm->db_get(['form_id'=>['=',$id]]);
    $oFormQuestion = new \App\Models\StatisticsModels\FormQuestion();
    $questions = $oFormQuestion->getFormQuestions($id);
    $answers = $oFormQuestion->getFormAnswers($id);
    if(!empty($questions)){
      foreach($questions as $key => $val){
        if(!empty($val['answer_a'])){
          $val['a'] = Tools::questionAnswer($val['question_id'],'a',$answers);
        }
        if(!empty($val['answer_b'])){
          $val['b'] = Tools::questionAnswer($val['question_id'],'b',$answers);
        }
        if(!empty($val['answer_c'])){
          $val['c'] = Tools::questionAnswer($val['question_id'],'c',$answers);
        }
        if(!empty($val['answer_d'])){
          $val['d'] = Tools::questionAnswer($val['question_id'],'d',$answers);
        }
        if(!empty($val['answer_e'])){
          $val['e'] = Tools::questionAnswer($val['question_id'],'e',$answers);
        }
        if(!empty($val['answer_f'])){
          $val['f'] = Tools::questionAnswer($val['question_id'],'f',$answers);
        }
        $questions[$key] = $val;
      }
    }
//    $phpWord = new \PhpOffice\PhpWord\PhpWord();
//    $section = $phpWord->addSection();
//    if(!empty($questions)){
//      foreach ($questions as $question){
//        $section->addTitle($question['question_id'].".".$question['question'], 1);
//        if(!empty($question['answer_a'])){
//          if($question['a'][0] == 0){
//            $section->addCheckBox($name,$text);
//          }
//        }
//      }
//    }
//    $writers = array('Word2007' => 'docx', 'ODText' => 'odt', 'RTF' => 'rtf', 'HTML' => 'html');
//    \PhpOffice\PhpWord\Writer($phpWord,'demo1', $writers);
    return view('statistics/form/view',['admin_form_tree_menu'=>true,'data'=>$data,'questions'=>$questions]);
  }
}