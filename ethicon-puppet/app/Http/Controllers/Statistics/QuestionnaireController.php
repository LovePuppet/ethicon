<?php
namespace App\Http\Controllers\Statistics;
use App\Http\Controllers\Controller;
use App\Models\StatisticsModels\Question;
class QuestionnaireController extends Controller{
  public function index(){
    $oQuestion = new Question();
    $questionList = $oQuestion->getAllData();
    return view('statistics/questionnaire/index',['admin_questionnaire_tree_menu'=>true,'questionList'=>$questionList]);
  }
  
  public function show($id){
    $oQuestion = new Question();
    $data = $oQuestion->db_get(['question_id'=>['=',$id]]);
    $oFormQuestion = new \App\Models\StatisticsModels\FormQuestion();
    $questions = $oFormQuestion->getAllFormQuestions($id);
    return view('statistics/questionnaire/view',['admin_questionnaire_tree_menu'=>true,'data'=>$data,'questions'=>$questions]);
  }
}
