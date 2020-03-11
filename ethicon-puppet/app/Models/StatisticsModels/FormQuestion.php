<?php
namespace App\Models\StatisticsModels;
use App\Models\ParentModel;
use DB;
/**
 * model
 * @author puppet
 */
class FormQuestion extends ParentModel{
  /**
   * 与模型关联的数据表。
   *
   * @var string
   */
  protected $table = 'form_question';

  /**
   * DB::直接操作的数据库表名
   * @var string
   */
  protected $db_table = 'pt_form_question';

  /**
   * 主键 默认id。
   *
   * @var string
   */
  protected $primaryKey = 'id';

  /**
   * 指定是否模型应该被戳记时间。
   *
   * @var bool
   */
  public $timestamps = false;
  
  /**
   * 获取表单所有问卷题目
   */
  public function getFormQuestions($form_id){
    $sql = "SELECT b.question_id,b.question,b.answer_a,b.answer_b,b.answer_c,b.answer_d,b.answer_e,b.answer_f "
      . "FROM {$this->db_table} a LEFT JOIN pt_question b ON a.question_id = b.question_id WHERE a.form_id = ? GROUP BY a.question_id";
    return DB::select($sql,[$form_id]);
  }
  
  /**
   * 获取所有问卷回答
   */
  public function getFormAnswers($form_id){
    $sql = "SELECT question_id,answer,`value` FROM {$this->db_table} WHERE form_id = ?";
    return DB::select($sql,[$form_id]);
  }
  
  /**
   * 某一个问题所有其他回答
   */
  public function getAllFormQuestions($question_id){
    $sql = "SELECT `value` FROM {$this->db_table} WHERE question_id = ? AND `value` != ''";
    return DB::select($sql,[$question_id]);
  }
}