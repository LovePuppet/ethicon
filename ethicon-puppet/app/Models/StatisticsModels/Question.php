<?php
namespace App\Models\StatisticsModels;
use App\Models\ParentModel;
use DB;
/**
 * model
 * @author puppet
 */
class Question extends ParentModel{
  /**
   * 与模型关联的数据表。
   *
   * @var string
   */
  protected $table = 'question';

  /**
   * DB::直接操作的数据库表名
   * @var string
   */
  protected $db_table = 'pt_question';

  /**
   * 主键 默认id。
   *
   * @var string
   */
  protected $primaryKey = 'question_id';

  /**
   * 指定是否模型应该被戳记时间。
   *
   * @var bool
   */
  public $timestamps = false;
  
  public function getAllData(){
    $sql = "SELECT a.question_id,a.question,a.answer_a,a.answer_b,a.answer_c,a.answer_d,a.answer_e,a.answer_f,"
        . "b.answer_a as a_count,b.answer_b as b_count,b.answer_c as c_count,b.answer_d as d_count,"
        . "b.answer_e as e_count,b.answer_f as f_count,b.peoples FROM pt_question a LEFT JOIN pt_question_statistics b "
        . "ON a.question_id = b.question_id";
    return DB::select($sql);
  }
}